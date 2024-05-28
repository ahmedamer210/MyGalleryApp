import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/utils/input_validators.dart';
import '../../core/values/colors.dart';
import 'login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor:Colors.white,
      body: Stack(
        children:[
          Flex(direction: Axis.horizontal,
          children:[ Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children:[
                  Container(height: size.height,width: size.width,
                  decoration: const BoxDecoration(image:
                DecorationImage(image:  AssetImage('assets/images/loginBack.png'), fit: BoxFit.fill)


                ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 170,),

                    SizedBox(width: 110,
                      child: Text(
                        textAlign: TextAlign.center,
                          "My GAllary",
                          style:  GoogleFonts.tajawal(
                              color: const Color(0xff4A4A4A),
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),

                      const SizedBox(height: 40,),

                      Container(width: size.width-50,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            color: Colors.white70
                            ,)
                        ,child: Column(children: [
                          const SizedBox(height: 20,),
                        Text(
                            textAlign: TextAlign.center,
                            "LOG IN",
                            style:  GoogleFonts.tajawal(
                                color: const Color(0xff4A4A4A),
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),

                          const SizedBox(height: 30,),

                          TextFormField(
                            controller:emailControl,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            style: const TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                              hintText: tr("User Name"),
                              hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(196, 196, 196, 1)),
                              errorStyle: const TextStyle(color: Colors.white),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30)),
                                borderSide:
                                BorderSide(width: 1, color: Colors.white),
                              ),
                              disabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30)),
                                borderSide:
                                BorderSide(width: 1, color: Colors.white),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30)),
                                borderSide: BorderSide(
                                  width:1,
                                  color: Colors.white,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                 ),
                              errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.white)),
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.white)),
                            ),
                            onChanged: (value) {
                              if (value.isEmpty ||
                                  value == null ||
                                  !InputValidators().emailValidator(
                                      email: value, context: context)) {

                              }
                            },

                            cursorColor: Colors.black,
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 30,),
                          TextFormField(
                            controller: passwordControl,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            obscureText: obscureTxt,
                            decoration: InputDecoration(
                              hintText: tr("Password"),
                              hintStyle: GoogleFonts.tajawal(
                                  fontSize: 14,fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(196, 196, 196, 1)),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    obscureTxt = !obscureTxt;
                                  });
                                },
                                child: Icon(
                                  obscureTxt
                                      ? Icons.lock
                                      : Icons.lock_open,
                                  color:  Colors.grey,
                                ),
                              ),
                              errorStyle:
                              const TextStyle(color: Colors.white),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30)),
                                borderSide:
                                BorderSide(width: 1, color: Colors.white),
                              ),
                              disabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30)),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.white),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30)),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                    width: 1,
                                  )),
                              errorBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                      width: 01, color: Colors.white)),
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.white)),

                            ),

                            cursorColor: Colors.black,
                            keyboardType: TextInputType.text,
                          ),

                          const SizedBox(height: 40,),

                          Container( height: 45,width: size.width,
                            padding: const EdgeInsets.all(0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff7BB3FF)
                            ),
                            child: TextButton(
                              style:   TextButton.styleFrom(
                                foregroundColor: Colors.white,),
                              onPressed:() async {
                                checkLogin();


                              },
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(tr("Submit"),style: GoogleFonts.tajawal(color: Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 15
                                  ),),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30,),

                        ],),)







                  ],),
                ),

                  Positioned(top: 70,left: 50,
                      child: Image.asset("assets/images/love_photography.png",height: 110,width: 110,)),

              ]),
            ),
          ),
        ]),




          isLoading==true?
          SizedBox(
            height: size.height,
            child: const Center(
              child: CircularProgressIndicator(
                color:appColor,
              ),
            ),
          ):const SizedBox.shrink()
      ]),
    );
  }
}
