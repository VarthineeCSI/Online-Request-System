import 'package:onlinerequestsystem/core/usecase.dart';
import 'package:onlinerequestsystem/features/combos/data/combo_repository.dart';
// * GetComboListUseCase
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
abstract class GetComboListUseCase extends UseCase<Object, Future<List>> {}

class DefaultGetComboListUseCase implements GetComboListUseCase {
  final ComboRepository comboRepository;

  DefaultGetComboListUseCase(this.comboRepository);

  @override
  Future<List> execute(Object params) {
    return comboRepository.getComboList(params.toString());
  } 
  
}
