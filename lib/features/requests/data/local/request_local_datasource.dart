import 'package:onlinerequestsystem/features/requests/data/request_datasource.dart';

// * RequestLocalDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
class RequestLocalDataSource implements RequestDataSource {
  static const NAME = "RequestLocalDataSource";
  List _requestsList = [];

  @override
  Future<List> getRequestList(String getValue) => Future.value(_requestsList);
  @override

  Future<List> getRequestData(String getValue) => Future.value(_requestsList);
  @override
  
  void addRequest(List<dynamic> requests) {
    _requestsList = requests;
  }
}
