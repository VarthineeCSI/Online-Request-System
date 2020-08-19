import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/requests/bloc/request.dart';
import 'package:onlinerequestsystem/features/requests/data/remote/request_api.dart';
import 'package:onlinerequestsystem/features/requests/data/remote/request_remote_datasource.dart';

import 'data/local/request_local_datasource.dart';
import 'data/request_datasource.dart';
import 'data/request_repository.dart';
import 'domain/get_request_usecase.dart';

class RequestLocator {
  static register() {
    getIt.registerFactory<RequestApi>(() => DefaultRequestApi());
    getIt.registerFactory<RequestDataSource>(
      () => RequestLocalDataSource(),
      instanceName: RequestLocalDataSource.NAME,
    );
    getIt.registerFactory<RequestDataSource>(
      () => RequestRemoteDataSource(getIt.get()),
      instanceName: RequestRemoteDataSource.NAME,
    );
    getIt.registerFactory<RequestRepository>(
      () => DefaultRequestRepository(
        getIt.get(instanceName: RequestRemoteDataSource.NAME),
        getIt.get(instanceName: RequestLocalDataSource.NAME),
      ),
    );
    getIt.registerFactory<GetRequestUseCase>(
      () => DefaultGetRequestUseCase(getIt.get()),
    );

    getIt.registerFactory(() => RequestBloc(getIt.get()));
    getIt.registerFactory(() => RequestListBloc(getIt.get()));
    getIt.registerFactory(() => RequestFilterBloc(),
        instanceName: "RequestFilterBloc");
  }
}
