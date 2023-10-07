import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:last_fm/core/constants/color_constants.dart';
import 'package:last_fm/core/di/injection_getit.dart' as di;
import 'package:last_fm/features/presentation/pages/home/home_main_page.dart';
import 'package:last_fm/features/presentation/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // Init Dependency Inject
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(360, 640), minTextAdapt: true, splitScreenMode: true);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightMode,
      darkTheme: darkMode,
      home: const HomePage(),
    );
  }
}