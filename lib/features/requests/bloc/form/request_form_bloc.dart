import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/requests/bloc/request.dart';
import 'package:onlinerequestsystem/features/requests/domain/get_request_usecase.dart';

// * RequestBloc
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final GetRequestUseCase getRequestUseCase;
  final userCode =
      getIt.get(instanceName: "SharedPreferences").getString('userCode');
  final epNoCurrent =
      getIt.get(instanceName: "SharedPreferences").getString("epNoCurrent");
      
  RequestBloc(this.getRequestUseCase);

  @override
  RequestState get initialState => RequestLoadingState();

  @override
  Stream<RequestState> mapEventToState(RequestEvent event) async* {
    if (event is FetchRequest) {
      try {
        final String tempEvent = "?ExpenseNo=" +
            epNoCurrent +
            "&UserCode=" +
            userCode +
            "&IsAddMode=0";
        yield RequestLoadedState(await getRequestUseCase.getvalue(tempEvent));
      } catch (_) {
        yield RequestErrorState();
      }
    }
  }
}
