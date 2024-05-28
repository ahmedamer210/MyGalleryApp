import 'package:flutter/material.dart';
import 'package:flutter_task/src/core/local/storagehelper.dart';
import '../../app.dart';
import '../../auth/login/login_view.dart';
import '../../core/values/colors.dart';
import '../gallery/gallery_view.dart';

class ContView extends StatefulWidget {
  const ContView({super.key});

  @override
  State<ContView> createState() => _ContViewState();
}

class _ContViewState extends State<ContView> with StorageHelper {

  Future<void> controlToApp() async {
    var isFirst=await getFirst();
    var token = await getToken();
    var isLogin = token  !=null && token !=""? true : false;

    await Future.delayed(const Duration(seconds: 1));

    if (isFirst == false) {
      if(isLogin){
        FlutterTask.navKey.currentState!.pushReplacement(
          MaterialPageRoute(builder: (context) =>   const GalleryView()),);
      }else {
        FlutterTask.navKey.currentState!.pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginView()),);
      }

    } else {
      FlutterTask.navKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginView()),
      );


    }

  }



  @override
  void initState() {
    super.initState();
    controlToApp();
  }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return   Scaffold(
      backgroundColor: Colors.white,
    body: SizedBox(
      height: size.height,
      child: const Center(
        child: CircularProgressIndicator(
          color: appColor,
        ),
      ),
    ),
    );
  }
}
