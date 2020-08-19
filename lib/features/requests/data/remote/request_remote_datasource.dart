
import 'package:onlinerequestsystem/features/requests/data/request_datasource.dart';
import 'package:onlinerequestsystem/features/requests/data/remote/request_api.dart';
// * RequestRemoteDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
class RequestRemoteDataSource implements RequestDataSource {
  static const NAME = "RequestRemoteDataSource";
  final RequestApi requestApi;

  RequestRemoteDataSource(this.requestApi);

  @override
  Future<List> getRequestList(String getValue) => requestApi.getRequestList(getValue);

  @override
  Future<List> getRequestData(String getValue) => requestApi.getRequestData(getValue);

  @override
  void addRequest(List<dynamic> requests) {}
}
