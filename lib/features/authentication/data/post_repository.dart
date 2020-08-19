
import 'package:onlinerequestsystem/features/authentication/data/login_datasource.dart';

abstract class LoginRepository {
  Future<List> getLoginList();
}

class DefaultLoginRepository implements LoginRepository {
  final LoginDataSource loginRemoteDataSource;
  final LoginDataSource loginLocalDataSource;

  DefaultLoginRepository(this.loginRemoteDataSource, this.loginLocalDataSource);

  Future<List> getLoginList() async {
    final logins = await loginLocalDataSource.getLoginList();
    if (logins.length == 0) {
      final loginList = await loginRemoteDataSource.getLoginList();
      loginLocalDataSource.addLogin(loginList);
      return loginList;
    }
    return logins;
  }
}
