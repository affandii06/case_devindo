import 'package:case_devindo/provider/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  int index;
  Detail(this.index);
  @override
  _DetailState createState() => _DetailState(this.index);
}

class _DetailState extends State<Detail> {
  int index;
  _DetailState(this.index);

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
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text('Userid : ' + data.data[index].userId.toString(), style: GoogleFonts.poppins(),),
            SizedBox(height: 10,),
            Text('Id : ' + data.data[index].id.toString(), style: GoogleFonts.poppins(),),
            SizedBox(height: 10,),
            Text('Title : ' + data.data[index].title, style: GoogleFonts.poppins(),),
            SizedBox(height: 10,),
            Text('Body : ' + data.data[index].body, style: GoogleFonts.poppins(),),
          ],
        ),
      ),
    );
  }
}
