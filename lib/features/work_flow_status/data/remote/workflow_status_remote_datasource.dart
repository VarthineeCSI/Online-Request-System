
import 'package:onlinerequestsystem/features/work_flow_status/data/remote/workflow_status_api.dart';
import 'package:onlinerequestsystem/features/work_flow_status/data/workflow_status_datasource.dart';
// * WorkFlowStatusRemoteDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-17
class WorkFlowStatusRemoteDataSource implements WorkFlowStatusDataSource {
  static const NAME = "WorkFlowStatusRemoteDataSource";
  final WorkFlowStatusApi workFlowStatusApi;

  WorkFlowStatusRemoteDataSource(this.workFlowStatusApi);

  @override
  Future<List> getWorkFlowStatusList(String getValue) => workFlowStatusApi.getWorkFlowStatusList(getValue);

  @override
  void addWorkFlowStatus(List<dynamic> workFlowStatuss) {}
}
