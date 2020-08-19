// * Request Form Page
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-31
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/combos/presentation/combo_page.dart';
import 'package:onlinerequestsystem/features/request_details/presentation/lists/request_detail_lists_page.dart';
import 'package:onlinerequestsystem/features/request_details/presentation/lists/request_detail_lists_widget.dart';
import 'package:onlinerequestsystem/features/requests/bloc/request.dart';

import 'package:onlinerequestsystem/utils/helper.dart';
import 'package:onlinerequestsystem/utils/widget_utils.dart';

class RequestFormWidget extends StatefulWidget {
  RequestFormWidget({Key key}) : super(key: key);

  @override
  _RequestFormWidgetState createState() => _RequestFormWidgetState();
}

class _RequestFormWidgetState extends State<RequestFormWidget> {
  String typeForm; //insert //update //updated;
  String epNoCurrent;

  bool _selected = true;
  bool _checkBoxValue = false;
  bool _switchValue = false;

  List<bool> _expands = [true];
  final requestNo = TextEditingController();
  final requestBy = TextEditingController();
  final reMark = TextEditingController();

  String expenseType = "Please select option";
  String organization = "Please select option";
  String project = "Please select option";
  String currency = "Please select option";
  String boi = "Please select option";
  String company = "Please select option";
  String cbfc = "Please select option";

  Widget currentWidget;

  @override
  void initState() {
    typeForm =
        getIt.get(instanceName: "SharedPreferences").getString("typeForm");
    print("typeForm " + typeForm);
    if (typeForm == "update") {
      epNoCurrent =
          getIt.get(instanceName: "SharedPreferences").getString("epNoCurrent");
      context.bloc<RequestBloc>().add(FetchRequest());
      currentWidget = RequestDetailListPage();
    }
    super.initState();
  }

  @override
  void dispose() {
    print("dispose");
    // getIt.get(instanceName: "SharedPreferences").remove("epNoCurrent");
    // getIt.get(instanceName: "SharedPreferences").remove("typeForm");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            decoration: BoxDecoration(
                color: HelperColorsTemplete.myCustomColorOpacity9),
            height: 150,
          ),
        ),
        ListView(
          children: <Widget>[
            sectionRequestForm(),
            SizedBox(height: 15),
            sectionRequestDetailLists(),
          ],
        ),
      ],
    );
  }

  Widget sectionRequestDetailLists() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: currentWidget,
    );
  }

  Widget sectionRequestForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ExpansionPanelList(
          expansionCallback: (index, exp) {
            setState(() {
              _expands[index] = !_expands[index];
            });
          },
          children: List.generate(
            _expands.length,
            (i) => ExpansionPanel(
              isExpanded: _expands[i],
              body: typeForm == "update" ? RequestFormUpdate() : RequestForm(),
              headerBuilder: (_, expand) => ListTile(
                leading: Icon(
                  Icons.description,
                  color: HelperColorsTemplete.myCustomColor,
                ),
                title: Text(
                  "Online Request Form",
                  style: TextStyle(
                    color: HelperColorsTemplete.myCustomColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ).toList()),
    );
  }

  Widget RequestForm() {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Divider(),
          inputRequestNo(""),
          SizedBox(height: 15.0),
          inputRequestBy(""),
          SizedBox(height: 15.0),
          comboExpenseType(""),
          SizedBox(height: 15.0),
          comboOrganization(""),
          SizedBox(height: 15.0),
          comboProject(""),
          SizedBox(height: 15.0),
          comboCurrency(""),
          SizedBox(height: 15.0),
          comboBoi(""),
          SizedBox(height: 15.0),
          comboCompany(""),
          SizedBox(height: 15.0),
          comboCbfc(""),
          SizedBox(height: 15.0),
          inputRemark(""),
          SizedBox(height: 15.0),
          SizedBox(
            width: double.infinity,
            child: btnSave(),
          )
        ],
      ),
    );
  }

  Widget RequestFormUpdate() {
    return BlocBuilder<RequestBloc, RequestState>(
      builder: (context, state) {
        if (state is RequestLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is RequestLoadedState) {
          getIt.get(instanceName: "SharedPreferences").setString(
                "docTypeIDCurrent",
                state.items[0]['docTypeID'].toString(),
              );
          return Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Divider(),
                inputRequestNo(state.items[0]['expenseNo'].toString()),
                SizedBox(height: 15.0),
                inputRequestBy(state.items[0]['requestBy'].toString()),
                SizedBox(height: 15.0),
                comboExpenseType(state.items[0]['docTypeName'].toString()),
                SizedBox(height: 15.0),
                comboOrganization(state.items[0]['costCenterCode'].toString()),
                SizedBox(height: 15.0),
                comboProject(state.items[0]['profitCenterCode'].toString()),
                SizedBox(height: 15.0),
                comboCurrency(state.items[0]['epCurrency'].toString()),
                SizedBox(height: 15.0),
                comboBoi(state.items[0]['boiTypeName'].toString()),
                SizedBox(height: 15.0),
                comboCompany(state.items[0]['businessPlaceDesc'].toString()),
                SizedBox(height: 15.0),
                comboCbfc(state.items[0]['chargeBackName'].toString()),
                SizedBox(height: 15.0),
                inputRemark(state.items[0]['reasonPayment'].toString()),
                SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  child: btnSave(),
                )
              ],
            ),
          );
        }
        return Center(child: Text('Something went wrong!'));
      },
    );
  }

  Widget inputRequestNo(String updateValue) {
    if (typeForm != "updated" && typeForm != "insert")
      requestNo.text = updateValue;
    return TextFormField(
      controller: requestNo,
      readOnly: true,
      textCapitalization: TextCapitalization.words,
      decoration: FormsTemplate.textFormFieldDecoration(
        Icon(Icons.info_outline),
        "Request No",
        null,
      ),
      onSaved: (String value) {},
    );
  }

  Widget inputRequestBy(String updateValue) {
    if (typeForm != "updated" && typeForm != "insert")
      requestBy.text = updateValue;
    return TextFormField(
      controller: requestBy,
      readOnly: true,
      textCapitalization: TextCapitalization.words,
      decoration: FormsTemplate.textFormFieldDecoration(
        Icon(Icons.person_outline),
        "Request By",
        null,
      ),
      onSaved: (String value) {},
    );
  }

  Widget inputRemark(String updateValue) {
    if (typeForm != "updated" && typeForm != "insert")
      reMark.text = updateValue;

    return TextField(
      controller: reMark,
      maxLines: 5,
      textCapitalization: TextCapitalization.sentences,
      decoration: FormsTemplate.textFieldDecoration("Remark", ""),
      onChanged: (text) => setState(() {}),
    );
  }

  Widget comboExpenseType(String updateValue) {
    var label = "Expense Type";
    var type = "GetDocumentTypeCombo";
    if (typeForm != "updated" && typeForm != "insert")
      expenseType = updateValue;
    if (expenseType == "null" || expenseType == "")
      expenseType = "Please select option";

    return Column(children: [
      widgetTitleComboStyle(label),
      InkWell(
        child: widgetComboStyle(expenseType),
        onTap: () {
          _navigateAndDisplaySelection(context, type, label);
        },
      )
    ]);
  }

  Widget comboOrganization(String updateValue) {
    var label = "Organization";
    var type = "GetDepartmentCombo";
    if (typeForm != "updated" && typeForm != "insert")
      organization = updateValue;
    if (organization == "null" || organization == "")
      organization = "Please select option";

    return Column(children: [
      widgetTitleComboStyle(label),
      InkWell(
        child: widgetComboStyle(organization),
        onTap: () {
          _navigateAndDisplaySelection(context, type, label);
        },
      )
    ]);
  }

  Widget comboProject(String updateValue) {
    var label = "Project";
    var type = "GetProfitCenterCombo";
    if (typeForm != "updated" && typeForm != "insert") project = updateValue;
    if (project == "null" || project == "") project = "Please select option";

    return Column(children: [
      widgetTitleComboStyle(label),
      InkWell(
        child: widgetComboStyle(project),
        onTap: () {
          _navigateAndDisplaySelection(context, type, label);
        },
      )
    ]);
  }

  Widget comboCurrency(String updateValue) {
    var label = "Currency";
    var type = "GetCurrencyCombo";
    if (typeForm != "updated" && typeForm != "insert") currency = updateValue;
    if (currency == "null" || currency == "") currency = "Please select option";

    return Column(children: [
      widgetTitleComboStyle(label),
      InkWell(
        child: widgetComboStyle(currency),
        onTap: () {
          _navigateAndDisplaySelection(context, type, label);
        },
      )
    ]);
  }

  Widget comboBoi(String updateValue) {
    var label = "BOI";
    var type = "GetBOITypeCombo";
    if (typeForm != "updated" && typeForm != "insert") boi = updateValue;
    if (boi == "null" || boi == "") boi = "Please select option";

    return Column(children: [
      widgetTitleComboStyle(label),
      InkWell(
        child: widgetComboStyle(boi),
        onTap: () {
          _navigateAndDisplaySelection(context, type, label);
        },
      )
    ]);
  }

  Widget comboCompany(String updateValue) {
    var label = "Company";
    var type = "GetBusinessPlaceCombo";
    if (typeForm != "updated" && typeForm != "insert") company = updateValue;
    if (company == "null" || company == "") company = "Please select option";

    return Column(children: [
      widgetTitleComboStyle(label),
      InkWell(
        child: widgetComboStyle(company),
        onTap: () {
          _navigateAndDisplaySelection(context, type, label);
        },
      )
    ]);
  }

  Widget comboCbfc(String updateValue) {
    var label = "Charge back from Customer";
    var type = "GetChargeBackCombo";
    if (typeForm != "updated" && typeForm != "insert") cbfc = updateValue;
    if (cbfc == "null" || cbfc == "") cbfc = "Please select option";

    return Column(children: [
      widgetTitleComboStyle(label),
      InkWell(
        child: widgetComboStyle(cbfc),
        onTap: () {
          _navigateAndDisplaySelection(context, type, label);
        },
      )
    ]);
  }

  Widget btnSave() {
    if (typeForm == "update") typeForm = "updated";
    return RaisedButton(
      color: Colors.green,
      child: Text(
        'Save',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  _navigateAndDisplaySelection(
      BuildContext context, String type, String label) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComboPage(type, label)),
    );
    if (result != null) {
      setState(() {
        switch (type) {
          case "GetDocumentTypeCombo":
            {
              expenseType = result;
            }
            break;
          case "GetDepartmentCombo":
            {
              organization = result;
            }
            break;
          case "GetProfitCenterCombo":
            {
              project = result;
            }
            break;
          case "GetCurrencyCombo":
            {
              currency = result;
            }
            break;
          case "GetBOITypeCombo":
            {
              boi = result;
            }
            break;
          case "GetBusinessPlaceCombo":
            {
              company = result;
            }
            break;
          case "GetChargeBackCombo":
            {
              cbfc = result;
            }
            break;
        }
      });
    }
  }
} // request form widget
