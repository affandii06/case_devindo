import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'dataprovider.dart';

class SearchProvider with ChangeNotifier{

  List Resulttitle;
  List Resultid;

  performSearch(context, String query) {
    final data = Provider.of<DataProvider>(context, listen: false);
    data.getdata(context);

    Resulttitle = new List<String>();
    Resultid = new List<String>();
    for (int i = 0; i < data.data.length; i++ ) {
      var item = data.data[i].title;
      var id = data.data[i].id;
      if (item.toLowerCase().contains(query.toLowerCase())){
        Resulttitle.add(item);
        Resultid.add(id.toString());
        print(Resulttitle);
        print(Resultid);
        notifyListeners();
      }
    }
  }

}