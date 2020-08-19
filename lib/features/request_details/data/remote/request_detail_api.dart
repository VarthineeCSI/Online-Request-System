import 'dart:convert' as convert;
import 'dart:async';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

// * RequestDetailApi
// * @Author: Varthinee Teangthong
// * @Create Date: 2563-08-14
abstract class RequestDetailApi {
  Future<List> getRequestDetailList(String typeRequestDetail);
}

class DefaultRequestDetailApi implements RequestDetailApi {
  final _url = GlobalConfiguration().getString("UrlAPI").toString();

  Future<List> getRequestDetailList(String getValue) async {
    String url = _url + 'RequestDetail/EPS020_LoadEPLine' + getValue;
    print(url);

    var response = await http.get(url);
    final List data = convert.jsonDecode(response.body);

    return data;
  }
}
