import 'package:case_devindo/model/datamodel.dart';
import 'package:case_devindo/service/hitapi.dart';
import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier {

  List<Data> data;

  getdata(context)async{
    data = await HitAPI().getDataFromApi(context);
    notifyListeners();
  }

}