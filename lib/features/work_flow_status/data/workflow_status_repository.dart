

import 'workflow_status_datasource.dart';
// * WorkFlowStatusRepository
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-17

abstract class WorkFlowStatusRepository {
  Future<List> getWorkFlowStatusList(String typeWorkFlowStatus);
}

class DefaultWorkFlowStatusRepository implements WorkFlowStatusRepository {
  final WorkFlowStatusDataSource workFlowStatusRemoteDataSource;
  final WorkFlowStatusDataSource workFlowStatusLocalDataSource;

  DefaultWorkFlowStatusRepository(this.workFlowStatusRemoteDataSource, this.workFlowStatusLocalDataSource);

  Future<List> getWorkFlowStatusList(String getValue) async {
    final workFlowStatuss = await workFlowStatusLocalDataSource.getWorkFlowStatusList(getValue);
    if (workFlowStatuss.length == 0) {
      final workFlowStatusList = await workFlowStatusRemoteDataSource.getWorkFlowStatusList(getValue);
      workFlowStatusLocalDataSource.addWorkFlowStatus(workFlowStatusList);
      return workFlowStatusList;
    }
    return workFlowStatuss;
  }
}
