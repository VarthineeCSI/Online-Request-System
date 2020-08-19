import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/requests/domain/get_request_usecase.dart';
import 'package:onlinerequestsystem/features/requests/bloc/request.dart';

// * RequestListBloc
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
class RequestListBloc extends Bloc<RequestListEvent, RequestListState> {
  final GetRequestUseCase getRequestListListUseCase;
  final userCode =
      getIt.get(instanceName: "SharedPreferences").getString('userCode');
  List defaultResult = [];

  RequestListBloc(this.getRequestListListUseCase);

  @override
  RequestListState get initialState => RequestListLoadingState();

  @override
  Stream<RequestListState> mapEventToState(RequestListEvent event) async* {
    if (event is FetchRequestList) {
      try {
        final String tempEvent = '?UserCode=' + userCode;
        yield RequestListLoadedState(
            await getRequestListListUseCase.execute(tempEvent));
      } catch (_) {
        yield RequestListErrorState();
      }
    }
    if (event is FetchDefaultRequestList) {
      try {
        final String tempEvent = "?EPNo=&EPStatusCode=CREATE,SUBMIT,BUDGET,APPROVE,HRD,FIC,PO,OPM,HR,FINANCE&DocTypeGroupID=2&DocTypeID=-1&DeptCode=ALL&DocStatusCode=1&CreateDateFrom=&CreateDateTo=&UserCode=470228";
        final String tempEvent_all = "?EPNo=&EPStatusCode=CREATE,SUBMIT,BUDGET,APPROVE,HRD,FIC,PO,OPM,HR,FINANCE&DocTypeGroupID=2&DocTypeID=-1&DeptCode=ALL&DocStatusCode=ALL&CreateDateFrom=&CreateDateTo=&UserCode=470228";
        yield RequestListLoadedState(
            await getRequestListListUseCase.execute(tempEvent_all));
      } catch (_) {
        yield RequestListErrorState();
      }
    }
  }
}
