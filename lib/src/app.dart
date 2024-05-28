import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/src/screen/control_page/control_page_view.dart';
import 'core/values/theme.dart';



class FlutterTask extends StatefulWidget {
  static final navKey = GlobalKey<NavigatorState>();

  const FlutterTask({Key? key}) : super(key: key);

  @override
  State<FlutterTask> createState() => _FlutterTaskState();
}

class _FlutterTaskState extends State<FlutterTask> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: FlutterTask.navKey, // GlobalKey()
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.of(context),
        home:    const ContView());
  }
}



