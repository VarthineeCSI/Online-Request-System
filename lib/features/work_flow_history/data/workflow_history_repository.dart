

import 'workflow_history_datasource.dart';
// * WorkFlowHistoryRepository
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-14

abstract class WorkFlowHistoryRepository {
  Future<List> getWorkFlowHistoryList(String typeWorkFlowHistory);
}

class DefaultWorkFlowHistoryRepository implements WorkFlowHistoryRepository {
  final WorkFlowHistoryDataSource workFlowHistoryRemoteDataSource;
  final WorkFlowHistoryDataSource workFlowHistoryLocalDataSource;

  DefaultWorkFlowHistoryRepository(this.workFlowHistoryRemoteDataSource, this.workFlowHistoryLocalDataSource);

  Future<List> getWorkFlowHistoryList(String getValue) async {
    final workFlowHistorys = await workFlowHistoryLocalDataSource.getWorkFlowHistoryList(getValue);
    if (workFlowHistorys.length == 0) {
      final workFlowHistoryList = await workFlowHistoryRemoteDataSource.getWorkFlowHistoryList(getValue);
      workFlowHistoryLocalDataSource.addWorkFlowHistory(workFlowHistoryList);
      return workFlowHistoryList;
    }
    return workFlowHistorys;
  }
}
