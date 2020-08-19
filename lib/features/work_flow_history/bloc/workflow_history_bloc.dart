import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/work_flow_history/bloc/workflow_history.dart';
import 'package:onlinerequestsystem/features/work_flow_history/domain/get_workflow_history_usecase.dart';
// * WorkFlowHistoryBloc
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-14
class WorkFlowHistoryBloc extends Bloc<WorkFlowHistoryEvent, WorkFlowHistoryState> {
  final GetWorkFlowHistoryUseCase getWorkFlowHistoryUseCase;

  final userCode = getIt.get(instanceName: "SharedPreferences").getString('userCode');

  List defaultResult = [];

  WorkFlowHistoryBloc(this.getWorkFlowHistoryUseCase);

  @override
  WorkFlowHistoryState get initialState => WorkFlowHistoryLoadingState();

  @override
  Stream<WorkFlowHistoryState> mapEventToState(WorkFlowHistoryEvent event) async* {
    if (event is FetchWorkFlowHistory) {
      try {
        final String tempEvent ='?EPNo=' + event.epNo +'&UserCode=' +  userCode;
        yield WorkFlowHistoryLoadedState(await getWorkFlowHistoryUseCase.execute(tempEvent));
      } catch (_) {
        yield WorkFlowHistoryErrorState();
      }
    }
  }
}
