import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/work_flow_status/bloc/workflow_status.dart';
import 'package:onlinerequestsystem/features/work_flow_status/domain/get_workflow_status_usecase.dart';
// * WorkFlowStatusBloc
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-17
class WorkFlowStatusBloc extends Bloc<WorkFlowStatusEvent, WorkFlowStatusState> {
  final GetWorkFlowStatusUseCase getWorkFlowStatusUseCase;

  final userCode = getIt.get(instanceName: "SharedPreferences").getString('userCode');

  List defaultResult = [];

  WorkFlowStatusBloc(this.getWorkFlowStatusUseCase);

  @override
  WorkFlowStatusState get initialState => WorkFlowStatusLoadingState();

  @override
  Stream<WorkFlowStatusState> mapEventToState(WorkFlowStatusEvent event) async* {
    if (event is FetchWorkFlowStatus) {
      try {
        final String tempEvent ='?EPNo=' + event.epNo +'&UserCode=' +  userCode;
        yield WorkFlowStatusLoadedState(await getWorkFlowStatusUseCase.execute(tempEvent));
      } catch (_) {
        yield WorkFlowStatusErrorState();
      }
    }
  }
}
