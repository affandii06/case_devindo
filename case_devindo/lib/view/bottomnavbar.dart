import 'package:case_devindo/provider/bottomnavprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomnavProvider>(
      create: (context)=> BottomnavProvider(),
      child: Consumer<BottomnavProvider>(
        builder: (context, page, _) => Scaffold(
          body: page.page,

          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSize(
                    curve: Curves.fastOutSlowIn,
                    vsync:this, duration: new Duration(seconds: 1),
                    child: Container(
                      width: page.width1,
                      decoration: BoxDecoration(
                          color: page.colorcont1,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.home, color: page.coloricon1,),
                              onPressed: (){
                                page.selected = 0;
                              }
                          ),
                          page.selected == 0 ? Text('Home', style: GoogleFonts.poppins(color: Colors.white,),) : Text('')
                        ],
                      ),
                    ),
                  ),

                  AnimatedSize(
                    curve: Curves.fastOutSlowIn,
                    vsync:this, duration: new Duration(seconds: 1),
                    child: Container(
                      width: page.width2,
                      decoration: BoxDecoration(
                          color: page.colorcont2,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.search, color: page.coloricon2,),
                              onPressed: (){
                                page.selected = 1;
                              }
                          ),
                          page.selected == 1 ? Text('Search', style: GoogleFonts.poppins(color: Colors.white,),) : Text('')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}

