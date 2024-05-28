import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/colors.dart';
import 'gallery_viewmodel.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({super.key});

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends GalleryViewModel {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: Colors.white,
      body:

      Stack(
        children:[
          SizedBox(height: size.height,width: size.width,),
          Container(height: size.height,width: size.width,
            decoration: const BoxDecoration(image:
            DecorationImage(image:  AssetImage('assets/images/gellaryback.png'), fit: BoxFit.fill)
            ),),


          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [

                const SizedBox(height: 30,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        Text(
                            textAlign: TextAlign.center,
                            "Welcome",
                            style:  GoogleFonts.tajawal(
                                color: const Color(0xff4A4A4A),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text(
                            textAlign: TextAlign.center,
                            user!=null?
                            user!.user!.name.toString():"",
                            style:  GoogleFonts.tajawal(
                                color: const Color(0xff4A4A4A),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Container(width: 60,height: 60,decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(image: AssetImage("assets/images/user.png"),fit: BoxFit.cover)
                    ),)



                  ],
                ),

                const SizedBox(height: 30,),

                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(onTap: () {
                     logoutApp();

                    },
                      child: Container(height: 35,
                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 15),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Row(  crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container( height: 25,width: 25,
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9),
                                  color: const Color(0xffC83B3B)
                              ),child: SvgPicture.asset("assets/images/arrow.svg"),),
                            const SizedBox(width: 10,),
                            Text(
                                textAlign: TextAlign.center,
                                "Log out",
                                style:  GoogleFonts.tajawal(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),

                          ],),
                      ),
                    ),

                    InkWell(onTap: () async {
                      showMyDialog(context);
                    },
                      child: Container(height: 35,
                        padding: const EdgeInsets.only(top: 5,bottom: 5,left: 15,right: 15),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                        ),
                        child: Row( crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container( height: 25,width: 25,
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9),
                                  color: const Color(0xffFF9900)
                              ),child: SvgPicture.asset("assets/images/arrowtop.svg"),),
                            const SizedBox(width: 10,),
                            Text(
                                textAlign: TextAlign.center,
                                "upload",
                                style:  GoogleFonts.tajawal(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),

                          ],),
                      ),
                    )

                  ],),
                const SizedBox(height: 30,),




                Expanded(
                  child: SingleChildScrollView(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [



                        GridView.count(padding: EdgeInsets.zero,
                            childAspectRatio: 1,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            crossAxisCount: 3,
                            physics:
                            const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children:
                            galleryModel!=null?
                            galleryModel!.data!.images!.map((e) {
                              return InkWell(
                                onTap: () {

                                },
                                child: Container(
                                  height: 80,width: 80,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                    image:  DecorationImage(
                                        image:
                                        CachedNetworkImageProvider(e),
                                        fit: BoxFit.fill)),
                                ),
                              );
                            }).toList()

                       :[] ),







                      ],),
                  ),
                ),
              ],
            ),
          ),


          isLoading==true?
          SizedBox(
            height: size.height/1,
            child: const Center(
              child: CircularProgressIndicator(
                color: appColor,
              ),
            ),
          ):const SizedBox.shrink()
      ]),



    );
  }
}
