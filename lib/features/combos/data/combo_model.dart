// * Combo Model
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-19

class ComboModel {
  final String comboCode;
  final String comboName;
  final String comboDetail;

  ComboModel({this.comboCode, this.comboName, this.comboDetail});

  // Stored Procedure: sp_common_GetBOITypeCombo
  // Input: BOI
  factory ComboModel.boiTypeFromJson(Map<String, dynamic> json) {
    return new ComboModel(
      comboCode: json['boiTypeCode'],
      comboName: json['boiTypeName'],
      comboDetail: "",
    );
  }

  // Stored Procedure: sp_Common_GetBusinessPlaceCombo
  // Input: Company
  factory ComboModel.businessPlaceFromJson(Map<String, dynamic> json) {
    return new ComboModel(
      comboCode: json['businessPlaceCode'],
      comboName: json['description'],
      comboDetail: "",
    );
  }

  // Stored Procedure: sp_common_GetChargeBackCombo
  // Input: Charge back from Customer
  factory ComboModel.chargeBackFromJson(Map<String, dynamic> json) {
    return new ComboModel(
      comboCode: json['chargeBackCode'],
      comboName: json['chargeBackName'],
      comboDetail: "",
    );
  }

  // Stored Procedure: sp_common_GetCurrencyCombo
  // Input: Currency
  factory ComboModel.currencyFromJson(Map<String, dynamic> json) {
    return new ComboModel(
      comboCode: json['currencyCode'],
      comboName: json['currencyCode'],
      comboDetail: "",
    );
  }

  // Stored Procedure: sp_common_GetDepartmentCombo
  // Input: Organization
  factory ComboModel.departmentFromJson(Map<String, dynamic> json) {
    return new ComboModel(
      comboCode: json['deptCode'],
      comboName: json['deptCode'],
      comboDetail: ": " + json['deptNameTH'],
    );
  }

  // Stored Procedure: sp_common_GetEPStatusCombo
  // Input: Expense Type
  factory ComboModel.epStatusFromJson(Map<String, dynamic> json) {
    return new ComboModel(
      comboCode: json['prStatusCode'],
      comboName: json['prStatusName'],
      comboDetail: "",
    );
  }

  // Stored Procedure: sp_common_GetProfitCenterCombo
  // Input: Project
  factory ComboModel.profitCenterFromJson(Map<String, dynamic> json) {
    return new ComboModel(
      comboCode: json['profitCenterCode'],
      comboName: json['description'],
      comboDetail: "",
    );
  }

  // Stored Procedure: sp_common_GetDocStatusCombo
  // Input: Expense Status
  factory ComboModel.docStatusFromJson(Map<String, dynamic> json) {
    return new ComboModel(
      comboCode: json['docStatusCode'],
      comboName: json['docStatusName'],
      comboDetail: "",
    );
  }

  // Stored Procedure: sp_common_GetMiscCombo
  // Input: Workflow Status
  factory ComboModel.miscFromJson(Map<String, dynamic> json) {
    return new ComboModel(
      comboCode: json['valueCode'],
      comboName: json['valueDisplay'],
      comboDetail: "",
    );
  }

  // Stored Procedure: sp_common_GetDocumentTypeCombo
  // Input: Expense Type
  factory ComboModel.documentTypeFromJson(Map<String, dynamic> json) {
    print(json);
    return new ComboModel(
      comboCode: json['docTypeID'].toString(),
      comboName: json['docTypeName'],
      comboDetail: "",
    );
  }

  // Stored Procedure: sp_common_GetItemComboByText
  // Input: Expense Code
  factory ComboModel.itemFromJson(Map<String, dynamic> json) {
    return new ComboModel(
      comboCode: json['itemCode'].toString(),
      comboName: json['itemCode'],
      comboDetail: ": " + json['itemDescription'],
    );
  }
}
