import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/request_action/bloc/request_action.dart';
import 'package:onlinerequestsystem/features/request_action/presentation/request_send_form_widget.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

// * Request RequestSendFormPage
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-11
class RequestSendFormPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Request Action'),
        backgroundColor: HelperColorsTemplete.myCustomColor,
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              showAlertDialog(context);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: BlocProvider<RequestActionBloc>(
        create: (context) => getIt.get<RequestActionBloc>(),
        child: RequestSendFormWidget(),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Alert"),
      content: Text("Do you want to confirm submit request?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
