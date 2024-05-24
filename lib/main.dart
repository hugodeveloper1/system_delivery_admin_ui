import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:system_delivery_admin_ui/controllers/home_controller.dart';
import 'package:system_delivery_admin_ui/presentation/app_colors.dart';
import 'package:system_delivery_admin_ui/view/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cardTheme: CardTheme(
            color: Colors.white,
            elevation: 5,
            surfaceTintColor: Colors.white,
            shadowColor: Colors.black12,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          primaryColor: AppColors.green,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyLarge: GoogleFonts.poppins(
              color: AppColors.darkCharcoal,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            bodyMedium: GoogleFonts.poppins(
              color: AppColors.darkCharcoal,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            bodySmall: GoogleFonts.poppins(
              color: AppColors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ),
        home: const HomeView(),
      ),
    );
  }
}
