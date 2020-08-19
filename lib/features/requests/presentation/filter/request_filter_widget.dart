
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinerequestsystem/features/combos/presentation/combo_page.dart';
import 'package:onlinerequestsystem/utils/helper.dart';
import 'package:onlinerequestsystem/utils/widget_utils.dart';
// * Request RequestFilterWidget
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-29
class RequestFilterWidget extends StatefulWidget {
  RequestFilterWidget({Key key}) : super(key: key);

  @override
  _RequestFilterWidgetState createState() => _RequestFilterWidgetState();
}

class _RequestFilterWidgetState extends State<RequestFilterWidget> {
  String requestNo = "";
  String expenseStatus = "Please select.";
  String expenseType = "Please select.";
  String organization = "Please select.";
  String workflowStatus = "Please select.";
  String createDate = "Please select.";
  String toDate = "Please select.";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  inputRequestNo(),
                  SizedBox(height: 20.0),
                  Divider(
                    height: 1.0,
                  ),
                  SizedBox(height: 20.0),
                  comboExpenseStatus(),
                  SizedBox(height: 15.0),
                  comboExpenseType(),
                  SizedBox(height: 15.0),
                  comboOrganization(),
                  SizedBox(height: 15.0),
                  comboWorkflowStatus(),
                  SizedBox(height: 15.0),
                  datePickerCreateDate(),
                  SizedBox(height: 15.0),
                  datePickerToDate()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  Widget inputRequestNo() {
    return TextFormField(
      textCapitalization: TextCapitalization.words,
      decoration: FormsTemplate.textFormFieldDecoration(
        Icon(Icons.person),
        "Request No",
        null,
      ),
      onSaved: (String value) {},
      validator: _validateName,
    );
  }

  Widget comboExpenseStatus() {
    var label = "Expense Status";
    var type = "GetEPStatusCombo";
    return Column(children: [
      widgetTitleComboStyle(label),
      InkWell(
        child: widgetComboStyle(expenseStatus),
        onTap: () {
          _navigateAndDisplaySelection(context, type, label);
        },
      )
    ]);
  }

  Widget comboExpenseType() {
    var label = "Expense Type";
    var type = "GetDocumentTypeCombo";
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

  Widget comboOrganization() {
    var label = "Organization";
    var type = "GetDepartmentCombo";
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

  Widget comboWorkflowStatus() {
    var label = "Workflow Status";
    var type = "GetMiscCombo";
    return Column(children: [
      widgetTitleComboStyle(label),
      InkWell(
        child: widgetComboStyle(workflowStatus),
        onTap: () {
          _navigateAndDisplaySelection(context, type, label);
        },
      )
    ]);
  }

  Widget datePickerCreateDate() {
    var label = "Create Date";
    return Column(
      children: [
        widgetTitleDatePickerStyle(label),
        InkWell(
          child: widgetDatePickerStyle(createDate),
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2018),
              lastDate: DateTime(2025),
            ).then((DateTime value) {
              if (value != null) {
                _navigateAndDisplayDate(value.toLocal().toString(), label);
              }
            });
          },
        )
      ],
    );
  }

  Widget datePickerToDate() {
    var label = "To Date";
    return Column(
      children: [
        widgetTitleDatePickerStyle(label),
        InkWell(
          child: widgetDatePickerStyle(toDate),
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2018),
              lastDate: DateTime(2025),
            ).then((DateTime value) {
              if (value != null) {
                _navigateAndDisplayDate(value.toLocal().toString(), label);
              }
            });
          },
        )
      ],
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
        if (type == "GetEPStatusCombo") {
          expenseStatus = result;
        }
        if (type == "GetDocumentTypeCombo") {
          expenseType = result;
        }
        if (type == "GetDepartmentCombo") {
          organization = result;
        }
        if (type == "GetMiscCombo") {
          workflowStatus = result;
        }
      });
    }
  }

  _navigateAndDisplayDate(String date, String type) {
    setState(() {
      if (type == "Create Date") {
        createDate = date.split(" ")[0];
      }
      if (type == "To Date") {
        toDate = date.split(" ")[0];
      }
    });
  }
} // request filter widget
