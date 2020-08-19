import 'request_datasource.dart';
// * RequestRepository
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10

abstract class RequestRepository {
  Future<List> getRequestList(String getValue);
  Future<List> getRequestData(String getValue);
}

class DefaultRequestRepository implements RequestRepository {
  final RequestDataSource requestRemoteDataSource;
  final RequestDataSource requestLocalDataSource;

  DefaultRequestRepository(
      this.requestRemoteDataSource, this.requestLocalDataSource);

  Future<List> getRequestList(String getValue) async {
    final requests = await requestLocalDataSource.getRequestList(getValue);
    if (requests.length == 0) {
      final requestList =
          await requestRemoteDataSource.getRequestList(getValue);
      requestLocalDataSource.addRequest(requestList);
      return requestList;
    }
    return requests;
  }

  Future<List> getRequestData(String getValue) async {
    final requestData = await requestRemoteDataSource.getRequestData(getValue);
    return requestData;
  }
}
