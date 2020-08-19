import 'package:onlinerequestsystem/core/usecase.dart';
import 'package:onlinerequestsystem/features/requests/data/request_repository.dart';

// * GetRequestUseCase
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
abstract class GetRequestUseCase extends UseCase<Object, Future<List>> {
  Future<List> getvalue(Object params);
}

class DefaultGetRequestUseCase implements GetRequestUseCase {
  final RequestRepository requestRepository;

  DefaultGetRequestUseCase(this.requestRepository);

  @override
  Future<List> execute(Object params) {
    return requestRepository.getRequestList(params.toString());
  }

  @override
  Future<List> getvalue(Object params) {
    return requestRepository.getRequestData(params.toString());
  }
}
