
import 'package:onlinerequestsystem/features/authentication/data/login_datasource.dart';

class LoginLocalDataSource implements LoginDataSource {
  static const NAME = "LoginLocalDataSource";
  List _logins = [];

  @override
  Future<List> getLoginList() => Future.value(_logins);

  @override
  void addLogin(List<dynamic> logins) {
    _logins = logins;
  }
}
