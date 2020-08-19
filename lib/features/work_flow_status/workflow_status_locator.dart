import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/work_flow_status/bloc/workflow_status.dart';
import 'package:onlinerequestsystem/features/work_flow_status/data/local/workflow_status_local_datasource.dart';
import 'package:onlinerequestsystem/features/work_flow_status/data/remote/workflow_status_api.dart';
import 'package:onlinerequestsystem/features/work_flow_status/data/remote/workflow_status_remote_datasource.dart';
import 'package:onlinerequestsystem/features/work_flow_status/data/workflow_status_datasource.dart';
import 'package:onlinerequestsystem/features/work_flow_status/data/workflow_status_repository.dart';
import 'package:onlinerequestsystem/features/work_flow_status/domain/get_workflow_status_usecase.dart';

class WorkFlowStatusLocator {
  static register() {
    getIt
        .registerFactory<WorkFlowStatusApi>(() => DefaultWorkFlowStatusApi());
    getIt.registerFactory<WorkFlowStatusDataSource>(
      () => WorkFlowStatusLocalDataSource(),
      instanceName: WorkFlowStatusLocalDataSource.NAME,
    );
    getIt.registerFactory<WorkFlowStatusDataSource>(
      () => WorkFlowStatusRemoteDataSource(getIt.get()),
      instanceName: WorkFlowStatusRemoteDataSource.NAME,
    );
    getIt.registerFactory<WorkFlowStatusRepository>(
      () => DefaultWorkFlowStatusRepository(
        getIt.get(instanceName: WorkFlowStatusRemoteDataSource.NAME),
        getIt.get(instanceName: WorkFlowStatusLocalDataSource.NAME),
      ),
    );
    getIt.registerFactory<GetWorkFlowStatusUseCase>(
      () => DefaultGetWorkFlowStatusUseCase(getIt.get()),
    );

    getIt.registerFactory(() => WorkFlowStatusBloc(getIt.get()));
  }
}
