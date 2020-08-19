
import 'package:onlinerequestsystem/features/request_action/data/remote/request_action_api.dart';
import 'package:onlinerequestsystem/features/request_action/data/request_action_datasource.dart';
// * RequestActionRemoteDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-19
class RequestActionRemoteDataSource implements RequestActionDataSource {
  static const NAME = "RequestActionRemoteDataSource";
  final RequestActionApi requestActionApi;

  RequestActionRemoteDataSource(this.requestActionApi);

  @override
  Future<List> getRequestActionList(String getValue) => requestActionApi.getRequestActionList(getValue);

  @override
  void addRequestAction(List<dynamic> requestActions) {}
}
