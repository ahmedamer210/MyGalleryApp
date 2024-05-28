import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_task/src/app.dart';
import 'package:flutter_task/src/auth/login/login_view.dart';
import 'package:flutter_task/src/core/local/storagehelper.dart';
import 'package:flutter_task/src/core/utils/helper_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../auth/auth_model/user_model.dart';
import '../../core/network/network_service.dart';
import 'gallery_view.dart';
import 'model/gallery_model.dart';
import 'model/upload_model.dart';

abstract class GalleryViewModel extends State<GalleryView> with StorageHelper{

  UserModel? user;
  final Dio dio = NetworkService.instance.dio;
  GalleryModel?galleryModel;
  bool isLoading=false;
  XFile? image;
  File? imageLogo;
  ImagePicker picker = ImagePicker();



  @override
  void initState() {
    getUser().then((value) => {
      setState(() {
    user=value;
      })
    });
    getGallery();
    super.initState();
  }

  Future<void> getGallery() async {
    setState(() {
      isLoading=true;
    });

    final gallery = await dio.get("my-gallery",);
    var response= GalleryModel.fromJson(gallery.data);
    setState(() {
      isLoading=false;
    });
    if(response.status=="success"){
      setState(() {
        galleryModel=response;
      });
    }



  }

  Future<void> pickImageFromCamera() async {
     image = await picker.pickImage(source: ImageSource.camera);
     Navigator.pop(context);
     uploadImage().then((value) => {getGallery()});

  }

  Future<void> pickImageFromGallery() async {
   image = await picker.pickImage(source: ImageSource.gallery);
   Navigator.pop(context);
    uploadImage().then((value) => {getGallery()});


  }


  Future<void> uploadImage() async {
    setState(() {
      isLoading=true;
    });
    Map<String,dynamic> mp={};
    if(image!=null) {
      String imageUpdateUser = image!.path.split('/').last;
      mp["img"]=  await MultipartFile.fromFile(image!.path, filename:imageUpdateUser);
    }
    final upLoad = await dio.post("upload",data: FormData.fromMap(mp) );
    var response= UploadModel.fromJson(upLoad.data);
    setState(() {
      isLoading=false;
    });
    if(response.status=="success"){
       toastAppSuccess(response.message.toString(), context);
    }else{
      // toastApp(response.message.toString(), context);
    }






  }


  Future<void> logoutApp() async {
    setState(() {
      isLoading=true;
    });

    saveToken("").then((value) async => {
      await saveToken(""),
      await Future.delayed(const Duration(seconds: 1)),
      setState(() {
        isLoading=false;
      }),
      FlutterTask.navKey.currentState!.pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
              const LoginView()))
    });
  }

  showMyDialog(BuildContext context)  {
    Size size = MediaQuery.of(context).size;

    return showDialog<void>(barrierColor: Colors.transparent,
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(backgroundColor: Colors.black45,
          surfaceTintColor: const Color.fromARGB(128, 255, 255, 255) ,
          elevation:20,
          contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          insetPadding:
          const EdgeInsets.symmetric(horizontal: 25, vertical: 50.0),



          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

          content: SingleChildScrollView(
            child: ListBody(
              children:  <Widget>[

                SizedBox(width: size.width,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30,),
                      InkWell(onTap: () async {
                        pickImageFromGallery();

                      },
                        child: Container(height: 55,width: 160,
                          padding:  const EdgeInsets.all(10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                              color: const Color(0xffDDCDFF)
                          ),
                          child: Row( crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset("assets/images/gallery.png"),
                              const SizedBox(width: 10,),
                              Text(
                                  textAlign: TextAlign.center,
                                  "Gallery",
                                  style:  GoogleFonts.tajawal(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),

                            ],),
                        ),
                      ),


                      const SizedBox(height: 30,),

                      InkWell(onTap: () async {

                        pickImageFromCamera();
                      },
                        child: Container(height: 55,width: 160,
                          padding:  const EdgeInsets.all(10),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Row( crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset("assets/images/cam1.png",height: 50,width: 50,),
                              const SizedBox(width: 10,),
                              Text(
                                  textAlign: TextAlign.center,
                                  "Camera",
                                  style:  GoogleFonts.tajawal(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),

                            ],),
                        ),
                      ),

                      const SizedBox(height: 30,),



                    ],
                  ),
                )



              ],
            ),
          ),

        );
      },
    );
  }


}