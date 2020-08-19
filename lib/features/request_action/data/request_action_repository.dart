import 'request_action_datasource.dart';
// * RequestActionRepository
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-19

abstract class RequestActionRepository {
  Future<List> getRequestActionList(String getValue);
}

class DefaultRequestActionRepository implements RequestActionRepository {
  final RequestActionDataSource requestActionRemoteDataSource;
  final RequestActionDataSource requestActionLocalDataSource;

  DefaultRequestActionRepository(
      this.requestActionRemoteDataSource, this.requestActionLocalDataSource);

  Future<List> getRequestActionList(String getValue) async {
    final requestActionList =
        await requestActionRemoteDataSource.getRequestActionList(getValue);
    return requestActionList;
  }
}
