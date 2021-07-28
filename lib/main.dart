import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_test/home_page.dart';
import 'package:game_test/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  ///FORCING THE ORIENTATION OF THE APP SO THAT THE USER CAN'T ROTATE IT.
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      return runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      home: ThemeSetUp(),
    );
  }
}

class ThemeSetUp extends StatelessWidget {
  const ThemeSetUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(),
        // splashColor: Colors.transparent,
        // highlightColor: Colors.transparent,
      ),
      child: const WelcomeScreen(),
    );
  }
}
