import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:townsquare/Modules/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false, // Remove debug banner
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: Colors.white, // Set light mode background
            appBarTheme: const AppBarTheme(
              backgroundColor:
                  Colors.transparent, // Transparent AppBar for light mode
              elevation: 0,
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Colors.black, // Set dark mode background
            appBarTheme: const AppBarTheme(
              backgroundColor:
                  Colors.transparent, // Transparent AppBar for dark mode
              elevation: 0,
            ),
          ),
          themeMode: ThemeMode.system, // Switch between light and dark modes
          home: const HomePage(),
        );
      },
    );
  }
}
