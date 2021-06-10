import 'package:case_devindo/provider/dataprovider.dart';
import 'package:case_devindo/provider/searchprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {

  String query;

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
    return ChangeNotifierProvider<SearchProvider>(
      create: (context)=>SearchProvider(),
      child: Consumer<SearchProvider>(
        builder:(context, result, _)=> Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Case_Devindo', style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
          ),
          body: Container(
            margin: EdgeInsets.only(top: 20, right: 20, left: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value){
                      result.performSearch(context, value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Cari Berdasarkan Judul',
                      hintStyle: GoogleFonts.roboto(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      prefixIcon: Icon(Icons.search)
                    ),
                    style: GoogleFonts.roboto(),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.65,
                    child: ListView.builder(
                      itemCount: result.Resulttitle == null ? data.data.length : result.Resulttitle.length,
                      itemBuilder: (BuildContext context, int index){
                        if(result.Resulttitle != null) {
                          return Card(
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Title : ' +
                                          result.Resulttitle[index],
                                          style: GoogleFonts.poppins()),
                                    ),
                                  ],
                                ),
                              )
                          );
                        }else{
                          return Card(
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text('Title : ' +
                                          data.data[index].title,
                                          style: GoogleFonts.poppins()),
                                    ),
                                  ],
                                ),
                              )
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
