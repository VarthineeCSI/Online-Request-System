// * ComboDataSource
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
abstract class ComboDataSource {
  Future<List> getComboList(String typeCombo);

  void addCombo(List combos);
}
