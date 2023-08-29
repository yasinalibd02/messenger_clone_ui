// import 'package:adcard/utils/basic_screen_import.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'backend/utils/network_check/dependency_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter/material.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:get/get.dart';
import 'package:get/get.dart';
import 'constants/routes/routes.dart';
import 'constants/theme.dart';

void main() async {
  // Locking Device Orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: CustomColor.primaryLightColor,
  // ));
  // InternetCheckDependencyInjection.init();

  // main app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) => GetMaterialApp(
        title: "",
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: Themes().theme,
        navigatorKey: Get.key,
        initialRoute: Routes.bottomNavScreen,
        getPages: Routes.list,
        //  translations: LocalString(),
        // locale: const Locale('ar', 'AR'),
        builder: (context, widget) {
          ScreenUtil.init(context);
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!);
        },
      ),
    );
  }
}
