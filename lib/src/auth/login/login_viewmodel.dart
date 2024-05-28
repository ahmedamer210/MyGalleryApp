import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/src/auth/auth_model/user_model.dart';
import 'package:flutter_task/src/core/local/storagehelper.dart';
import '../../app.dart';
import '../../core/network/network_service.dart';
import '../../core/utils/helper_manager.dart';
import '../../core/utils/input_validators.dart';
import '../../screen/gallery/gallery_view.dart';
import 'login_view.dart';

abstract class LoginViewModel extends State<LoginView> with StorageHelper{
  TextEditingController emailControl=TextEditingController();
  TextEditingController passwordControl=TextEditingController();
  var obscureTxt = true;
  bool isLoading=false;
  final Dio dio = NetworkService.instance.dio;


  bool chekValidationLogin() {
    if (emailControl.text == "") {
      toastApp(tr("Enter Email"), context);
      return false;
    }
    if ( !InputValidators().emailValidator( email: emailControl.text, context: context ) ){
      toastApp(tr("Enter Correct Email"),context);
      return false;
    }
    if (passwordControl.text == "") {
      toastApp(tr("Enter Password"), context);
      return false;
    }
    return true;
  }


  Future<void> checkLogin() async {
    if (chekValidationLogin()) {
      setState(() {
        isLoading = true;
      });
      Map<String,dynamic>mp={};
      mp["email"]=emailControl.text;
      mp["password"]=passwordControl.text;

      var lo = await dio.post("auth/login",
          data: mp);
      var response =UserModel.fromJson(lo.data);
      setState(() {
        isLoading = false;
      });
      if (response.token !=null) {
        toastAppSuccess("You have been logged in successfully", context);
        await saveUser(response);
        await saveToken(response.token!);
        await setFirst(false);

        FlutterTask.navKey.currentState!.push(
            MaterialPageRoute(builder: (context) =>const GalleryView(),));

      }else if(lo.data.toString().contains("error_message")){
         toastApp("Invalid Credntials".toString(), context);
      }
    }
  }}