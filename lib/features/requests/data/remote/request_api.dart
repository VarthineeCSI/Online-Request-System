import 'dart:convert' as convert;
import 'dart:async';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

// * RequestApi
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
abstract class RequestApi {
  Future<List> getRequestList(String getValue);
  Future<List> getRequestData(String getValue);
}

class DefaultRequestApi implements RequestApi {
  final _url = GlobalConfiguration().getString("UrlAPI").toString();

  Future<List> getRequestList(String getValue) async {
    String url = _url + 'Request/EPS010_LoadData' + getValue;
    print(url);

    var response = await http.get(url);
    final List data = convert.jsonDecode(response.body);

    // for (Map request in data) {
    //   _data.add(RequestModel.fromJson(request));
    // }

    return data;
  }

  Future<List> getRequestData(String getValue) async {
    String url = _url + 'Request/EPS020_LoadExpense' + getValue;
    print(url);

    var response = await http.get(url);
    final List data = convert.jsonDecode(response.body);

    return data;
  }
}
