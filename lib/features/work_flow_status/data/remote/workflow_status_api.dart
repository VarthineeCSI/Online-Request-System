import 'dart:convert' as convert;
import 'dart:async';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

// * WorkFlowStatusApi
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-17
abstract class WorkFlowStatusApi {
  Future<List> getWorkFlowStatusList(String getValue);
}

class DefaultWorkFlowStatusApi implements WorkFlowStatusApi {
  final _url = GlobalConfiguration().getString("UrlAPI").toString();

  Future<List> getWorkFlowStatusList(String getValue) async {
    String url = _url + 'WorkFlow/GetWorkflowStatus' + getValue;
    print(url);
    
    var response = await http.get(url);
    final List data = convert.jsonDecode(response.body);

    return data;
  }
}
