import 'package:onlinerequestsystem/core/usecase.dart';
import 'package:onlinerequestsystem/features/work_flow_status/data/workflow_status_repository.dart';
// * GetWorkFlowStatusUseCase
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-17
abstract class GetWorkFlowStatusUseCase extends UseCase<Object, Future<List>> {}

class DefaultGetWorkFlowStatusUseCase implements GetWorkFlowStatusUseCase {
  final WorkFlowStatusRepository workFlowStatusRepository;

  DefaultGetWorkFlowStatusUseCase(this.workFlowStatusRepository);

  @override
  Future<List> execute(Object params) {
    return workFlowStatusRepository.getWorkFlowStatusList(params.toString());
  } 
  
}
