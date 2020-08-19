
import 'package:onlinerequestsystem/features/combos/data/combo_datasource.dart';
import 'package:onlinerequestsystem/features/combos/data/remote/combo_api.dart';
// * ComboRemoteDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
class ComboRemoteDataSource implements ComboDataSource {
  static const NAME = "ComboRemoteDataSource";
  final ComboApi comboApi;

  ComboRemoteDataSource(this.comboApi);

  @override
  Future<List> getComboList(String typeCombo) => comboApi.getComboList(typeCombo);

  @override
  void addCombo(List<dynamic> combos) {}
}
