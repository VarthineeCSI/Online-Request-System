import 'dart:convert' as convert;
import 'dart:async';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

// * RequestActionApi
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-19
abstract class RequestActionApi {
  Future<List> getRequestActionList(String getValue);
}

class DefaultRequestActionApi implements RequestActionApi {
  final _url = GlobalConfiguration().getString("UrlAPI").toString();

  Future<List> getRequestActionList(String getValue) async {
    String url = _url + 'Request/EPS020_CanSubmit' + getValue;
    print(url);

    var response = await http.get(url);
    final List data = convert.jsonDecode(response.body);

    return data;
  }

}
