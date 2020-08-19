// * WorkFlowHistoryDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-14
abstract class WorkFlowHistoryDataSource {
  Future<List> getWorkFlowHistoryList(String userCode);

  void addWorkFlowHistory(List workFlowHistorys);
}
