import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_app/config/router/app_router.dart';
import 'config/di/di.dart';
import 'config/services/shared_prefs_service.dart';
import 'core/theme/main_theme.dart';
//test remote
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await ScreenUtil.ensureScreenSize();
  await SharedPrefsService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child){
        return  MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: AppTheme.lightTheme,
        );
      }

    );
  }
}
