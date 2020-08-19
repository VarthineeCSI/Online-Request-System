// * RequestActionDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-19
abstract class RequestActionDataSource {
  Future<List> getRequestActionList(String getValue);
  void addRequestAction(List requestActions);
}
