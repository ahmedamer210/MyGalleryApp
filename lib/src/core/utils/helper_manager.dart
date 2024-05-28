

// import 'package:elegant_notification/elegant_notification.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// toastApp(String msg, BuildContext context) {
//   return ElegantNotification(
//     iconSize: 26,
//     width: MediaQuery.of(context).size.width,
//      height: 65,
//     displayCloseButton: false,
//     description: Text(
//       msg,
//       style: const TextStyle(
//           color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
//     ),
//     icon: const Padding(
//       padding: EdgeInsets.all(10.0),
//       child: Icon(
//         Icons.error_outlined,
//         color: Colors.red,
//       ),
//     ),
//     progressIndicatorColor: Colors.redAccent,
//   ).show(context);
// }
//
// toastAppSuccess(String msg, BuildContext context) {
//   return ElegantNotification(notificationMargin: 50,
//     iconSize: 26,
//     width: MediaQuery.of(context).size.width,
//      height: 50,
//     displayCloseButton: false,
//     description: Text(
//       msg,
//       style: const TextStyle(
//           color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
//     ),
//     icon: const Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Icon(
//         Icons.check_circle,
//         color: Colors.green,
//       ),
//     ),
//     progressIndicatorColor: Colors.lightGreen,
//   ).show(context);
// }
//
//
//
import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showToast({
  required BuildContext context,
  required String msg,
  required IconData icon,
  required Color iconColor,
  required Color progressIndicatorColor,
  double height = 65,
  double? notificationMargin,
}) {
  ElegantNotification(
    notificationMargin: 50,
    iconSize: 26,
    width: MediaQuery.of(context).size.width,
    height: height,
    displayCloseButton: false,
    description: Text(
      msg,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
    ),
    icon: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Icon(
        icon,
        color: iconColor,
      ),
    ),
    progressIndicatorColor: progressIndicatorColor,
  ).show(context);
}




void toastApp(String msg, BuildContext context) {
  showToast(
    context: context,
    msg: msg,
    icon: Icons.error_outlined,
    iconColor: Colors.red,
    progressIndicatorColor: Colors.redAccent,
  );
}

void toastAppSuccess(String msg, BuildContext context) {
  showToast(
    context: context,
    msg: msg,
    icon: Icons.check_circle,
    iconColor: Colors.green,
    progressIndicatorColor: Colors.lightGreen,
    height: 50,
    notificationMargin: 50,
  );
}