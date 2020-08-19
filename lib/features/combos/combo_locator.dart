import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/combos/bloc/combo.dart';
import 'package:onlinerequestsystem/features/combos/data/remote/combo_api.dart';
import 'package:onlinerequestsystem/features/combos/data/remote/combo_remote_datasource.dart';

import 'data/local/combo_local_datasource.dart';
import 'data/combo_datasource.dart';
import 'data/combo_repository.dart';
import 'domain/get_combo_list_usecase.dart';

// * ComboLocator
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
class ComboLocator {
  static register() {
    getIt.registerFactory<ComboApi>(() => DefaultComboApi());
    getIt.registerFactory<ComboDataSource>(
      () => ComboLocalDataSource(),
      instanceName: ComboLocalDataSource.NAME,
    );
    getIt.registerFactory<ComboDataSource>(
      () => ComboRemoteDataSource(getIt.get()),
      instanceName: ComboRemoteDataSource.NAME,
    );
    getIt.registerFactory<ComboRepository>(
      () => DefaultComboRepository(
        getIt.get(instanceName: ComboRemoteDataSource.NAME),
        getIt.get(instanceName: ComboLocalDataSource.NAME),
      ),
    );
    getIt.registerFactory<GetComboListUseCase>(
      () => DefaultGetComboListUseCase(getIt.get()),
    );
    getIt.registerFactory(() => ComboBloc(getIt.get()));
  }
}
