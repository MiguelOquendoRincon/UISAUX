import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uis_aux/routes/routes.dart';
import 'package:uis_aux/views/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UISAUX',
      initialRoute: LoginScreen.routeName,
      routes: appRoutes,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: Color(0XFF67CA34)
      ),
    );
  }
}