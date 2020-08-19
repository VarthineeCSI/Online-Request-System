// * RequestDetail Form Page
// * @Author: Varthinee Teangthong
// * @Create Date: 2563-08-14

import 'package:flutter/material.dart';
import 'package:onlinerequestsystem/features/combos/presentation/combo_page.dart';
import 'package:onlinerequestsystem/features/requests/presentation/form/request_form_page.dart';
import 'package:onlinerequestsystem/utils/helper.dart';
import 'package:onlinerequestsystem/utils/widget_utils.dart';

class RequestDetailFormWidget extends StatefulWidget {
  RequestDetailFormWidget({Key key}) : super(key: key);

  @override
  _RequestDetailFormWidgetState createState() =>
      _RequestDetailFormWidgetState();
}

class _RequestDetailFormWidgetState extends State<RequestDetailFormWidget> {
  int _step = 0;

  List<bool> _expands = [true];
  final requestNo = TextEditingController();
  final requestBy = TextEditingController();
  final reMark = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[formStep(context)],
        ),
      ),
    );
  }

  Widget formStep(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      child: Stepper(
        controlsBuilder: (BuildContext context,
            {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
          return _step == 2
              ? Row()
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.red,
                      onPressed: onStepCancel,
                      child: const Text(
                        'Back',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      onPressed: onStepContinue,
                      child: _step == 1
                          ? const Text(
                              'Save',
                              style: TextStyle(color: Colors.white),
                            )
                          : const Text(
                              'Next',
                              style: TextStyle(color: Colors.white),
                            ),
                    ),
                  ],
                );
        },
        onStepCancel: () {
          setState(() {
            if (_step > 0) _step--;
          });
        },
        onStepContinue: () {
          setState(() {
            if (_step >= 0) if (_step < 2) _step++;
          });
        },
        currentStep: _step,
        type: StepperType.horizontal,
        steps: [
          Step(
              content: Column(
                children: <Widget>[
                  comboExpenseCode("Please select options"),
                  ListTile(title: Text('Total Amount (Inc. Vat)*')),
                  inputRequestDetailTextFormFieldNumber(),
                  ListTile(title: Text('Expense Detail*')),
                  inputRequestDetailMultilineTextField(),
                  textDetail(),
                  SizedBox(height: 10)
                ],
              ),
              title: Text("Input"),
              state: _step == 0 ? StepState.editing : StepState.indexed,
              isActive: _step == 0
                  ? true
                  : false || _step == 1
                      ? true
                      : false || _step == 2 ? true : false),
          Step(
              content: Column(
                children: <Widget>[
                  Text("Total Amount (Exc. VAT) : 0.00"),
                  buildTextTotle(context),
                  Text("VAT Amount : 0.00"),
                  buildTextTotle(context),
                  Text("Total Amount (Inc. VAT) : 0.00"),
                  buildTextTotle(context),
                  ListTile(title: Text('Expense Code*')),
                  comboExpenseCode(""),
                  ListTile(title: Text('Total Amount (Inc. Vat)*')),
                  inputRequestDetailTextFormFieldNumber(),
                  ListTile(title: Text('Expense Detail*')),
                  inputRequestDetailMultilineTextField(),
                  SizedBox(height: 10)
                ],
              ),
              title: Text("Comfirm"),
              state: _step == 1 ? StepState.editing : StepState.indexed,
              isActive: _step == 1 ? true : false || _step == 2 ? true : false),
          Step(
            content: Column(
              children: <Widget>[
                RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      MaterialPageRoute materialPageRoute = MaterialPageRoute(
                          builder: (BuildContext context) => RequestFormPage());
                      Navigator.of(context).pushReplacement(materialPageRoute);
                    },
                    child: const Text(
                      'Back to Online Request',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
            title: Text("Complete"),
            state: _step == 2 ? StepState.complete : StepState.indexed,
            isActive: _step == 2 ? true : false,
          ),
        ],
      ),
    );
  }

  Widget buildTextTotle(BuildContext context) {
    return Text(
      '',
      textAlign: TextAlign.left,
      style: TextStyle(
          color: HelperColorsTemplete.myCustomColor,
          fontSize: 15.0,
          decoration: TextDecoration.underline),
    );
  }

  _navigateAndDisplaySelection(
      BuildContext context, String type, String label) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ComboPage(type, label)),
    );
    if (result != null) {
      // setState(() {

      // });
    }
  }

  Widget comboExpenseCode(String updateValue) {
    var label = "Expense Code";
    var type = "GetItemComboByText";
    // if (typeForm != "updated" && typeForm != "insert")
    //   expenseType = updateValue;
    // if (expenseType == "null" || expenseType == "")
    //   expenseType = "Please select option";

    return Column(children: [
      widgetTitleComboStyle(label),
      InkWell(
        child: widgetComboStyle(updateValue),
        onTap: () {
          _navigateAndDisplaySelection(context, type, label);
        },
      )
    ]);
  }
//////////////////////////

  Widget inputRequestDetailMultilineTextField() {
    return TextField(
      maxLines: 5,
      textCapitalization: TextCapitalization.sentences,
      decoration: FormsTemplate.textFieldDecoration("", ""),
    );
  }

  Widget inputRequestDetailTextFormFieldNumber() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: FormsTemplate.textFormFieldNumberDecoration(""),
      maxLines: 1,
    );
  }

  Widget textDetail() {
    return Container(
      child: Column(
        children: <Widget>[
          ListTile(
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "*ค่าน้ำมันเชื้อเพลิง",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "*ค่าทางด่วน",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "*ค่าจอดรถ",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "*ค่าตั๋วเครื่องบิน",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} // class widget
