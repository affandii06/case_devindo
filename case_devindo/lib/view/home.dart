import 'package:animations/animations.dart';
import 'package:case_devindo/provider/dataprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final data = Provider.of<DataProvider>(context, listen: false);
    data.getdata(context);
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Case_Devindo', style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, right: 20, left: 20),
        child: ListView.builder(
          itemCount: data.data == null ? 0 : data.data.length,
          itemBuilder: (BuildContext context, int index){
            return OpenContainer(
              transitionDuration: Duration(milliseconds: 500),
              closedElevation: 0,
              closedBuilder:(context, action)=> Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Userid : ' + data.data[index].userId.toString(), style: GoogleFonts.poppins(),)
                      ),
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Id : ' + data.data[index].id.toString(), style: GoogleFonts.poppins(),)
                      ),
                      SizedBox(height: 10,),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Title : ' + data.data[index].title, style: GoogleFonts.poppins()),
                      ),
                    ],
                  ),
                )
              ),
              openBuilder: (context, action)=> Detail(index),
            );
          },
        ),
      ),
    );
  }
}
