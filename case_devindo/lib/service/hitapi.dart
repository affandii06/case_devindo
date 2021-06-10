import 'package:case_devindo/model/datamodel.dart';
import 'package:http/http.dart' as http;

class HitAPI {

  getDataFromApi(context)async{
    final response = await http.get('https://jsonplaceholder.typicode.com/posts?_start=0&_limit=10',
        headers: {"Accept": "application/json"}
    );
    print(dataFromJson(response.body));
    return dataFromJson(response.body);
  }

}