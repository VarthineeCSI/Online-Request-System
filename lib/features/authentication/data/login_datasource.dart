abstract class LoginDataSource {
  Future<List> getLoginList();

  void addLogin(List logins);
}
