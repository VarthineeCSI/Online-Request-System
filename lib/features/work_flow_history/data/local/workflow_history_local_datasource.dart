
import 'package:onlinerequestsystem/features/work_flow_history/data/workflow_history_datasource.dart';
// * WorkFlowHistoryLocalDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-14
class WorkFlowHistoryLocalDataSource implements WorkFlowHistoryDataSource {
  static const NAME = "WorkFlowHistoryLocalDataSource";
  List _workFlowHistorys = [];

  @override
  Future<List> getWorkFlowHistoryList(String getValue) => Future.value(_workFlowHistorys);

  @override
  void addWorkFlowHistory(List<dynamic> workFlowHistorys) {
    _workFlowHistorys = workFlowHistorys;
  }
}
