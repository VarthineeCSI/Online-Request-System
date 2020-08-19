// * WorkFlowStatusDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-17
abstract class WorkFlowStatusDataSource {
  Future<List> getWorkFlowStatusList(String userCode);

  void addWorkFlowStatus(List workFlowStatuss);
}
