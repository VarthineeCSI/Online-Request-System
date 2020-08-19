import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/request_action/domain/get_request_action_usecase.dart';

import 'request_action.dart';

// * RequestActionBloc
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-19
class RequestActionBloc extends Bloc<RequestActionEvent, RequestActionState> {
  final GetRequestActionUseCase getRequestActionUseCase;
  final userCode =
      getIt.get(instanceName: "SharedPreferences").getString('userCode');
  final epNoCurrent =
      getIt.get(instanceName: "SharedPreferences").getString("epNoCurrent");
      
  RequestActionBloc(this.getRequestActionUseCase);

  @override
  RequestActionState get initialState => RequestActionLoadingState();

  @override
  Stream<RequestActionState> mapEventToState(RequestActionEvent event) async* {
    if (event is FetchRequestAction) {
      try {
        final String tempEvent = "?EPNo=" +
            epNoCurrent +
            "&UserCode=" +
            userCode;
        yield RequestActionLoadedState(await getRequestActionUseCase.execute(tempEvent));
      } catch (_) {
        yield RequestActionErrorState();
      }
    }
  }
}
