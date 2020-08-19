import 'package:onlinerequestsystem/core/usecase.dart';
import 'package:onlinerequestsystem/features/request_action/data/request_action_repository.dart';

// * GetRequestActionUseCase
// * @Author: Jiramate Phuaphan
abstract class GetRequestActionUseCase extends UseCase<Object, Future<List>> {
}

class DefaultGetRequestActionUseCase implements GetRequestActionUseCase {
  final RequestActionRepository requestActionRepository;

  DefaultGetRequestActionUseCase(this.requestActionRepository);

  @override
  Future<List> execute(Object params) {
    return requestActionRepository.getRequestActionList(params.toString());
  }
  
}
