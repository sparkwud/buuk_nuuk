import 'package:buuk_nuuk/utils/text_theme.dart';
import 'package:buuk_nuuk/views/screens/main_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Buuk Nuuk',
          theme: ThemeData(
            // scaffoldBackgroundColor: Colors.white,
            // scaffoldBackgroundColor: const Color(0xFFFAEED6),
            // appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFAEED6)),
            textTheme: textTheme,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MainContainer(),
          // home: const MainScreen(),
        );
      },
    );
  }
}
