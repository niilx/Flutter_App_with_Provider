

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiModels extends ChangeNotifier{

  var response;

   getData() => response;

  getDatas() async{
    response = await getListData();
    print("Here:");
    print(response);
    print(response["data"][0]);
    notifyListeners();
  }

  getListData() async {
    String url = "http://dummy.restapiexample.com/api/v1/employees";

    try {
      var result = await http.get(url).timeout(const Duration(seconds: 15));
      print("URL: $url");
      print(result.body);

      return json.decode(result.body);
    }
    catch (exception, stacktrace) {
      print(exception);
      print(stacktrace);
    }
  }
}