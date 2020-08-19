import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/request_action/bloc/request_action.dart';
import 'package:onlinerequestsystem/features/request_action/data/local/request_action_local_datasource.dart';
import 'package:onlinerequestsystem/features/request_action/data/remote/request_action_api.dart';
import 'package:onlinerequestsystem/features/request_action/data/remote/request_action_remote_datasource.dart';
import 'package:onlinerequestsystem/features/request_action/data/request_action_datasource.dart';
import 'package:onlinerequestsystem/features/request_action/data/request_action_repository.dart';
import 'package:onlinerequestsystem/features/request_action/domain/get_request_action_usecase.dart';

class RequestActionLocator {
  static register() {
    getIt.registerFactory<RequestActionApi>(() => DefaultRequestActionApi());
    getIt.registerFactory<RequestActionDataSource>(
      () => RequestActionLocalDataSource(),
      instanceName: RequestActionLocalDataSource.NAME,
    );
    getIt.registerFactory<RequestActionDataSource>(
      () => RequestActionRemoteDataSource(getIt.get()),
      instanceName: RequestActionRemoteDataSource.NAME,
    );
    getIt.registerFactory<RequestActionRepository>(
      () => DefaultRequestActionRepository(
        getIt.get(instanceName: RequestActionRemoteDataSource.NAME),
        getIt.get(instanceName: RequestActionLocalDataSource.NAME),
      ),
    );
    getIt.registerFactory<GetRequestActionUseCase>(
      () => DefaultGetRequestActionUseCase(getIt.get()),
    );

    getIt.registerFactory(() => RequestActionBloc(getIt.get()));
  }
}
