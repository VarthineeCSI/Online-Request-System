
import 'package:onlinerequestsystem/features/work_flow_history/data/remote/workflow_history_api.dart';
import 'package:onlinerequestsystem/features/work_flow_history/data/workflow_history_datasource.dart';
// * WorkFlowHistoryRemoteDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-14
class WorkFlowHistoryRemoteDataSource implements WorkFlowHistoryDataSource {
  static const NAME = "WorkFlowHistoryRemoteDataSource";
  final WorkFlowHistoryApi workFlowHistoryApi;

  WorkFlowHistoryRemoteDataSource(this.workFlowHistoryApi);

  @override
  Future<List> getWorkFlowHistoryList(String getValue) => workFlowHistoryApi.getWorkFlowHistoryList(getValue);

  @override
  void addWorkFlowHistory(List<dynamic> workFlowHistorys) {}
}
