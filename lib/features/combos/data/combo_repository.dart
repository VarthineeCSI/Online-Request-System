

import 'combo_datasource.dart';
// * ComboRepository
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07

abstract class ComboRepository {
  Future<List> getComboList(String typeCombo);
}

class DefaultComboRepository implements ComboRepository {
  final ComboDataSource comboRemoteDataSource;
  final ComboDataSource comboLocalDataSource;

  DefaultComboRepository(this.comboRemoteDataSource, this.comboLocalDataSource);

  Future<List> getComboList(String typeCombo) async {
    final combos = await comboLocalDataSource.getComboList(typeCombo);
    if (combos.length == 0) {
      final comboList = await comboRemoteDataSource.getComboList(typeCombo);
      comboLocalDataSource.addCombo(comboList);
      return comboList;
    }
    return combos;
  }
}
