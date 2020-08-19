import 'package:onlinerequestsystem/core/usecase.dart';
import 'package:onlinerequestsystem/features/authentication/data/post_repository.dart';

abstract class GetLoginListUseCase extends UseCase<Object, Future<List>> {}

class DefaultGetLoginListUseCase implements GetLoginListUseCase {
  final LoginRepository loginRepository;

  DefaultGetLoginListUseCase(this.loginRepository);

  @override
  Future<List> execute(Object params) => loginRepository.getLoginList();
}
