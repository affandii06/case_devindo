import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:case_devindo/provider/dataprovider.dart';
import 'package:case_devindo/view/bottomnavbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataProvider>(create: (context)=>DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<Timer> startsplashcreen()async{
    return Timer(Duration(seconds: 2), nextpage);
  }

  nextpage(){
    Navigator.pushAndRemoveUntil(context, PageTransition(child: BottomNav(), type: PageTransitionType.bottomToTop), (route) => false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startsplashcreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedTextKit(
          pause: Duration(seconds: 2),
          isRepeatingAnimation: false,
          animatedTexts: [
            TyperAnimatedText('Case_Devindo', textStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.blue))
          ],
        ),
      ),
    );
  }
}
