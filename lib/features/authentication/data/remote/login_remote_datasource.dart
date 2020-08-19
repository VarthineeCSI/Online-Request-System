import 'package:onlinerequestsystem/features/authentication/data/login_datasource.dart';
import 'package:onlinerequestsystem/features/authentication/data/remote/login_api.dart';

class LoginRemoteDataSource implements LoginDataSource {
  static const NAME = "LoginRemoteDataSource";
  final LoginApi loginApi;

  LoginRemoteDataSource(this.loginApi);

  @override
  Future<List> getLoginList() => loginApi.getLoginList();

  @override
  void addLogin(List<dynamic> logins) {}
}
