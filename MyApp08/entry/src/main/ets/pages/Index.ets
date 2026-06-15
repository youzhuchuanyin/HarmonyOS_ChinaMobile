import { fileIo, picker } from '@kit.CoreFileKit'
import { photoAccessHelper } from '@kit.MediaLibraryKit'
import axios, { AxiosResponse, FormData } from '@ohos/axios'
import { APIConstants } from '../Constants/APIConstants'
interface responseBodyContent{
  code:number,
  msg:string
}

//读写应用文件
@Entry
@Component
struct Index {

  context=this.getUIContext().getHostContext()
  build() {
    Column(){
     Button('1点击查看沙箱各个虚拟目录：')
       .onClick(_=>{
         console.log('沙箱--应用目录--缓存文件目录：'+ this.context?.cacheDir)
         console.log('沙箱--应用目录--临时文件目录（用完就删）：'+ this.context?.tempDir)
         console.log('沙箱--应用目录--普通文件目录：'+ this.context?.filesDir)
         console.log('沙箱--应用目录--首选项文件目录（也就是设置）：'+ this.context?.preferencesDir)
         console.log('沙箱--应用目录--数据库文件目录：'+ this.context?.databaseDir)
         console.log('沙箱--应用目录--应用可执行文件目录：'+ this.context?.bundleCodeDir)
         console.log('沙箱--应用目录--分布式文件目录（类似共享文件夹）：'+ this.context?.distributedFilesDir)
       })
     Button('2向日志文件中写内容')
       .onClick(async _=>{
        //无则新建，有则继续添加
         //返回值 fileIo.file
         let out01=await fileIo.open(this.context?.filesDir+'/out01.log',fileIo.OpenMode.READ_WRITE|fileIo.OpenMode.CREATE|fileIo.OpenMode.APPEND)
         //写入
         let  length=await fileIo.write(out01.fd,out01.fd+' '+out01.path+' '+out01.name+' '+Date.now()+'tom login')
         console.log('写入完成'+length)
         //关闭
         await fileIo.close(out01)
       })
      Button('3读取日志文件中的内容')
        .onClick(async _=>{
          let out01=await fileIo.open(this.context?.filesDir+'/out01.log',fileIo.OpenMode.READ_ONLY)
          let buf=new ArrayBuffer(80)
          console.log(''+await fileIo.read(out01.fd,buf))
          console.log(''+await fileIo.read(out01.fd,buf))
          console.log(''+await fileIo.read(out01.fd,buf))
          await fileIo.close(out01)
        })
      Button('4拷贝日志文件到另一个日志文件')
        .onClick(async _=>{
          //默认out01是已存在的。out02若存在，则截断，若不存在则创建 可以先用access判断一下是否存在
          let out01=await fileIo.open(this.context?.filesDir+'/out01.log',fileIo.OpenMode.READ_ONLY)
          let out02=await fileIo.open(this.context?.filesDir+'/out02.log',fileIo.OpenMode.WRITE_ONLY|fileIo.OpenMode.CREATE|fileIo.OpenMode.TRUNC)

          let buf=new ArrayBuffer(80)
          let readlength=0
          while (readlength=await fileIo.read(out01.fd,buf)){
            fileIo.write(out02.fd,buf,{length:readlength})//此举避免倒数第一轮的脏数据
          }
          await fileIo.close(out01)
          await fileIo.close(out02)
        })
      Button('5，4的方法二')
        .onClick(_=>{
          fileIo.copyFile(this.context?.filesDir+'/out01.log',this.context?.filesDir+'/out02.log')
        })
      Button('6拉起照片选择器，拾取图库中的文件（用户授权）')
        .onClick(async _=>{
          let picker = new photoAccessHelper.PhotoViewPicker();
          let pickerOptions=new photoAccessHelper.PhotoSelectOptions()
          pickerOptions.maxSelectNumber=1
          pickerOptions.MIMEType=photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE
          let result=await picker.select(pickerOptions)
          console.log(JSON.stringify(result))
        })
      Button('7.文件上传到服务器（用户头像）')
        .onClick(async _=>{
          //1.picker--用户选择
          let photoPicker=new photoAccessHelper.PhotoViewPicker()
          let pickResult=await photoPicker.select({maxSelectNumber:1,MIMEType:photoAccessHelper.PhotoViewMIMETypes.IMAGE_TYPE})
          //2.获得用户所选择的图片的地址，并使用fileIo进行读取。存放在缓冲区中
          let pictureUri=pickResult.photoUris[0]//.../.../.jpg
          let pictureFile=await fileIo.open(pictureUri,fileIo.OpenMode.READ_ONLY)
          let buf=new ArrayBuffer(await (await fileIo.stat(pictureUri)).size)//动态设置缓存区的大小
          await fileIo.read(pictureFile.fd,buf)//图片数据放入缓存区
          await fileIo.close(pictureFile)//关闭图片
          //3.连接服务器并上传文件(使用formData类包装buf)。
          let formData=new FormData()
          formData.append('avatar',buf)
          let response:AxiosResponse=await axios.post(APIConstants.UPDATE_AVATAR,formData,{
            headers:{'Content-Type': 'multipart/form-data',
              'token':'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOjEsInBob25lIjoiMTM1MDEyMzQ1NjciLCJlbWFpbCI6InlhQHRlZHUuY24iLCJjcmVhdGVkIjoxNzgxMTYzNjQ2MzQzLCJleHBpcmVzIjoxNzgxMjUwMDQ2MzQzLCJpYXQiOjE3ODExNjM2NDZ9.8yLCarN2Pb6A-DTjLYIiCtiezBJ864Nyorb8hMuQVPo'
            }
          })
          let mainBody:responseBodyContent=response.data
          console.log(JSON.stringify(mainBody))
        })


      Button('8.从服务器下载文件:下载百度的logo')
        .onClick(async _=>{
          //1.连接互联网，把文件放到缓存区
          let response:AxiosResponse=await axios.get('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png')
          let buf:ArrayBuffer=response.data//文件主体是arraybuffer类型，此时文件已放在缓存区
          //2.用户自主pick一个文件路径
          let docPicker=new picker.DocumentViewPicker()
          let pickResult=await docPicker.save({newFileNames:[Date.now()+'baidu.png']})//路径创建好了
          //3.把缓冲区的内容放到路径中去（fileIo）
          if(pickResult.length!=0) {
            let docfile = await fileIo.open(pickResult[0], fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE)
            let doclength = await fileIo.write(docfile.fd, buf)
            console.log('写入完成，共'+doclength+'个字节')
          }
        })

   }
    .height('100%')
    .width('100%')
  }
}