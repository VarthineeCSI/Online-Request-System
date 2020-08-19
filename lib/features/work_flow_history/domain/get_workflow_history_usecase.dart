import 'package:onlinerequestsystem/core/usecase.dart';
import 'package:onlinerequestsystem/features/work_flow_history/data/workflow_history_repository.dart';
// * GetWorkFlowHistoryUseCase
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-14
abstract class GetWorkFlowHistoryUseCase extends UseCase<Object, Future<List>> {}

class DefaultGetWorkFlowHistoryUseCase implements GetWorkFlowHistoryUseCase {
  final WorkFlowHistoryRepository workFlowHistoryRepository;

  DefaultGetWorkFlowHistoryUseCase(this.workFlowHistoryRepository);

  @override
  Future<List> execute(Object params) {
    return workFlowHistoryRepository.getWorkFlowHistoryList(params.toString());
  } 
  
}
