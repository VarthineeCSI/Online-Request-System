import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

abstract class LoginApi {
  Future<List> getLoginList();
}

class DefaultLoginApi implements LoginApi {
  final _url = "https://jsonplaceholder.typicode.com/posts";

  Future<List> getLoginList() async {
    var response = await http.get(_url);
    final data = convert.jsonDecode(response.body);
    return data;
  }
}
