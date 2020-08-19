import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/authentication/bloc/login_bloc.dart';
import 'package:onlinerequestsystem/features/authentication/data/remote/login_api.dart';
import 'package:onlinerequestsystem/features/authentication/data/remote/login_remote_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/local/login_local_datasource.dart';
import 'data/login_datasource.dart';
import 'data/post_repository.dart';
import 'domain/get_login_list_usecase.dart';

class LoginLocator {
  static register() {
    getIt.registerFactory<LoginApi>(() => DefaultLoginApi());
    getIt.registerFactory<LoginDataSource>(
      () => LoginLocalDataSource(),
      instanceName: LoginLocalDataSource.NAME,
    );
    getIt.registerFactory<LoginDataSource>(
      () => LoginRemoteDataSource(getIt.get()),
      instanceName: LoginRemoteDataSource.NAME,
    );
    getIt.registerFactory<LoginRepository>(
      () => DefaultLoginRepository(
        getIt.get(instanceName: LoginRemoteDataSource.NAME),
        getIt.get(instanceName: LoginLocalDataSource.NAME),
      ),
    );
    getIt.registerFactory<GetLoginListUseCase>(
      () => DefaultGetLoginListUseCase(getIt.get()),
    );
    getIt.registerFactory(() => LoginBloc(getIt.get()));
  }
}
