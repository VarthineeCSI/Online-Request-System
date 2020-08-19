import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/work_flow_history/bloc/workflow_history.dart';
import 'package:onlinerequestsystem/features/work_flow_history/data/local/workflow_history_local_datasource.dart';
import 'package:onlinerequestsystem/features/work_flow_history/data/remote/workflow_history_api.dart';
import 'package:onlinerequestsystem/features/work_flow_history/data/remote/workflow_history_remote_datasource.dart';
import 'package:onlinerequestsystem/features/work_flow_history/data/workflow_history_datasource.dart';
import 'package:onlinerequestsystem/features/work_flow_history/data/workflow_history_repository.dart';
import 'package:onlinerequestsystem/features/work_flow_history/domain/get_workflow_history_usecase.dart';

class WorkFlowHistoryLocator {
  static register() {
    getIt
        .registerFactory<WorkFlowHistoryApi>(() => DefaultWorkFlowHistoryApi());
    getIt.registerFactory<WorkFlowHistoryDataSource>(
      () => WorkFlowHistoryLocalDataSource(),
      instanceName: WorkFlowHistoryLocalDataSource.NAME,
    );
    getIt.registerFactory<WorkFlowHistoryDataSource>(
      () => WorkFlowHistoryRemoteDataSource(getIt.get()),
      instanceName: WorkFlowHistoryRemoteDataSource.NAME,
    );
    getIt.registerFactory<WorkFlowHistoryRepository>(
      () => DefaultWorkFlowHistoryRepository(
        getIt.get(instanceName: WorkFlowHistoryRemoteDataSource.NAME),
        getIt.get(instanceName: WorkFlowHistoryLocalDataSource.NAME),
      ),
    );
    getIt.registerFactory<GetWorkFlowHistoryUseCase>(
      () => DefaultGetWorkFlowHistoryUseCase(getIt.get()),
    );

    getIt.registerFactory(() => WorkFlowHistoryBloc(getIt.get()));
  }
}
