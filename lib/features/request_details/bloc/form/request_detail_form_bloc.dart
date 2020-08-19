import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/features/request_details/domain/get_request_detail_usecase.dart';

import '../request_detail.dart';


// * RequestDetailBloc
// * @Author: 
// * @Create Date: 
class RequestDetailBloc extends Bloc<RequestDetailEvent, RequestDetailState> {
  final GetRequestDetailUseCase getRequestDetailUseCase;
  String defaultType;
  List defaultResult = [];

  RequestDetailBloc(this.getRequestDetailUseCase);

  @override
  RequestDetailState get initialState => RequestDetailLoadingState();

  @override
  Stream<RequestDetailState> mapEventToState(RequestDetailEvent event) async* {
    if (event is FetchRequestDetail) {
      try {
        defaultType = event.requestDetailType;
        defaultResult = await getRequestDetailUseCase.execute(event.requestDetailType);
        yield RequestDetailLoadedState(
            await getRequestDetailUseCase.execute(event.requestDetailType));
      } catch (_) {
        yield RequestDetailErrorState();
      }
    }
  }
}
