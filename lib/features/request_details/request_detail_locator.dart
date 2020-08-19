

import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/request_details/bloc/request_detail.dart';
import 'bloc/form/request_detail_form_bloc.dart';
import 'data/local/request_detail_local_datasource.dart';
import 'data/remote/request_detail_api.dart';
import 'data/remote/request_detail_remote_datasource.dart';
import 'data/request_detail_datasource.dart';
import 'data/request_detail_repository.dart';
import 'domain/get_request_detail_usecase.dart';

class RequestDetailLocator {
  static register() {
    getIt.registerFactory<RequestDetailApi>(() => DefaultRequestDetailApi());
    getIt.registerFactory<RequestDetailDataSource>(
      () => RequestDetailLocalDataSource(),
      instanceName: RequestDetailLocalDataSource.NAME,
    );
    getIt.registerFactory<RequestDetailDataSource>(
      () => RequestDetailRemoteDataSource(getIt.get()),
      instanceName: RequestDetailRemoteDataSource.NAME,
    );
    getIt.registerFactory<RequestDetailRepository>(
      () => DefaultRequestDetailRepository(
        getIt.get(instanceName: RequestDetailRemoteDataSource.NAME),
        getIt.get(instanceName: RequestDetailLocalDataSource.NAME),
      ),
    );
    getIt.registerFactory<GetRequestDetailUseCase>(
      () => DefaultGetRequestDetailUseCase(getIt.get()),
    );

    getIt.registerFactory(() => RequestDetailBloc(getIt.get()));
    getIt.registerFactory(() => RequestDetailListBloc(getIt.get()));

  }
}