import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/request_details/bloc/request_detail.dart';
import 'package:onlinerequestsystem/features/request_details/domain/get_request_detail_usecase.dart';
// * RequestDetailListBloc
// * @Author: 
// * @Create Date: 2563-08-10
class RequestDetailListBloc extends Bloc<RequestDetailListEvent, RequestDetailListState> {
  final GetRequestDetailUseCase getRequestDetailUseCase;
  final userCode = getIt.get(instanceName: "SharedPreferences").getString('userCode');
  final epNoCurrent = getIt.get(instanceName: "SharedPreferences").getString('epNoCurrent');

  RequestDetailListBloc(this.getRequestDetailUseCase);

  @override
  RequestDetailListState get initialState => RequestDetailListLoadingState();

  @override
  Stream<RequestDetailListState> mapEventToState(RequestDetailListEvent event) async* {
    if (event is FetchRequestDetailList) {
      try {
        final String tempEvent ='?EPNo=' + epNoCurrent + "&UserCode=" + userCode;
        yield RequestDetailListLoadedState(await getRequestDetailUseCase.execute(tempEvent));
      } catch (_) {
        yield RequestDetailListErrorState();
      }
    }
  }
}
