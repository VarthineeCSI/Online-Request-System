import 'package:onlinerequestsystem/features/request_action/data/request_action_datasource.dart';

// * RequestActionLocalDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-19
class RequestActionLocalDataSource implements RequestActionDataSource {
  static const NAME = "RequestActionLocalDataSource";
  List _requestActionsList = [];

  @override
  Future<List> getRequestActionList(String getValue) => Future.value(_requestActionsList);
  @override
  
  void addRequestAction(List<dynamic> requestActions) {
    _requestActionsList = requestActions;
  }
}
