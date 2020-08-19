// * RequestDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
abstract class RequestDataSource {
  Future<List> getRequestList(String getValue);
  Future<List> getRequestData(String getValue);
  void addRequest(List requests);
}
