
import 'package:onlinerequestsystem/features/work_flow_status/data/workflow_status_datasource.dart';
// * WorkFlowStatusLocalDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-14
class WorkFlowStatusLocalDataSource implements WorkFlowStatusDataSource {
  static const NAME = "WorkFlowStatusLocalDataSource";
  List _workFlowStatuss = [];

  @override
  Future<List> getWorkFlowStatusList(String getValue) => Future.value(_workFlowStatuss);

  @override
  void addWorkFlowStatus(List<dynamic> workFlowStatuss) {
    _workFlowStatuss = workFlowStatuss;
  }
}
