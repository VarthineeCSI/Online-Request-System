import 'dart:convert' as convert;
import 'dart:async';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

// * WorkFlowHistoryApi
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-14
abstract class WorkFlowHistoryApi {
  Future<List> getWorkFlowHistoryList(String getValue);
}

class DefaultWorkFlowHistoryApi implements WorkFlowHistoryApi {
  final _url = GlobalConfiguration().getString("UrlAPI").toString();

  Future<List> getWorkFlowHistoryList(String getValue) async {
    String url = _url + 'WorkFlow/GetWorkflowHistory' + getValue;
    print(url);
    
    var response = await http.get(url);
    final List data = convert.jsonDecode(response.body);

    return data;
  }
}
