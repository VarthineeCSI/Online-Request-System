
import 'package:onlinerequestsystem/features/combos/data/combo_datasource.dart';
// * ComboLocalDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
class ComboLocalDataSource implements ComboDataSource {
  static const NAME = "ComboLocalDataSource";
  List _combos = [];

  @override
  Future<List> getComboList(String comboType) => Future.value(_combos);

  @override
  void addCombo(List<dynamic> combos) {
    _combos = combos;
  }
}
