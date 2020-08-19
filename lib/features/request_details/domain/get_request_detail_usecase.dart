
// * GetRequestDetailListUseCase
// * @Author: Varthinee Teagthong
// * @Create Date: 2563-08-14
import 'package:onlinerequestsystem/core/usecase.dart';
import 'package:onlinerequestsystem/features/request_details/data/request_detail_repository.dart';

abstract class GetRequestDetailUseCase extends UseCase<Object, Future<List>> {}

class DefaultGetRequestDetailUseCase implements GetRequestDetailUseCase {
  final RequestDetailRepository requestDetailRepository;

  DefaultGetRequestDetailUseCase(this.requestDetailRepository);

  @override
  Future<List> execute(Object params) {
    return requestDetailRepository.getRequestDetailList(params.toString());
  } 
  
}
