import 'dart:convert' as convert;
import 'dart:async';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:onlinerequestsystem/features/combos/data/combo_model.dart';

// * ComboApi
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
abstract class ComboApi {
  Future<List> getComboList(String typeCombo);
}

class DefaultComboApi implements ComboApi {
  final _url = GlobalConfiguration().getString("UrlAPI").toString();

  List<ComboModel> _data = [];

  Future<List> getComboList(String typeCombo) async {
    print('_url: ' + _url + 'Combos/' + typeCombo);
    
    var response = await http.get(_url + 'Combos/' + typeCombo);
    final data = convert.jsonDecode(response.body);
    var arrTypeCombo = typeCombo.split('?');

    switch (arrTypeCombo[0]) {
      case 'GetBOITypeCombo':
        {
          for (Map combo in data) {
            _data.add(ComboModel.boiTypeFromJson(combo));
          }
        }
        break;
      case 'GetBusinessPlaceCombo':
        {
          for (Map combo in data) {
            _data.add(ComboModel.businessPlaceFromJson(combo));
          }
        }
        break;
      case 'GetChargeBackCombo':
        {
          for (Map combo in data) {
            _data.add(ComboModel.chargeBackFromJson(combo));
          }
        }
        break;
      case 'GetCurrencyCombo':
        {
          for (Map combo in data) {
            _data.add(ComboModel.currencyFromJson(combo));
          }
        }
        break;
      case 'GetDepartmentCombo':
        {
          for (Map combo in data) {
            _data.add(ComboModel.departmentFromJson(combo));
          }
        }
        break;
      case 'GetEPStatusCombo':
        {
          for (Map combo in data) {
            _data.add(ComboModel.epStatusFromJson(combo));
          }
        }
        break;
      case 'GetProfitCenterCombo':
        {
          for (Map combo in data) {
            _data.add(ComboModel.profitCenterFromJson(combo));
          }
        }
        break;
      case 'GetDocStatusCombo':
        {
          for (Map combo in data) {
            _data.add(ComboModel.docStatusFromJson(combo));
          }
        }
        break;
      case 'GetMiscCombo':
        {
          for (Map combo in data) {
            _data.add(ComboModel.miscFromJson(combo));
          }
        }
        break;
      case 'GetDocumentTypeCombo':
        {
          for (Map combo in data) {
            _data.add(ComboModel.documentTypeFromJson(combo));
          }
        }
        break;
      case 'GetItemComboByText':
        {
          for (Map combo in data) {
            _data.add(ComboModel.itemFromJson(combo));
          }
        }
        break;
      default:
        {
          //statements;
        }
        break;
    }
    return _data;
  }
}
