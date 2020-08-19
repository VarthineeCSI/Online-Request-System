 // * Request Modal ExtentDetail Action
// * @Author: Varthinee Teangthong 
// * @Create Date: 2563-08-14
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:onlinerequestsystem/features/attach_file/presentation/show_file/show_file_widget.dart';
import 'package:onlinerequestsystem/features/request_details/presentation/form/request_detail_form_page.dart';

class ModalExtentDetailAction extends StatelessWidget {
  final ScrollController scrollController;

  const ModalExtentDetailAction({Key key, this.scrollController}) : super(key: key);

  
  @override
   build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Detail'),
            leading: Icon(Icons.pageview),
            onTap: () {
              Navigator.of(context).pop();
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => RequestDetailFormPage(),
              );
              Navigator.of(context).push(materialPageRoute);
            },
          ),
          ListTile(
              title: Text('Edit'),
              leading: Icon(Icons.create),
              onTap: () {
                Navigator.of(context).pop();
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => RequestDetailFormPage(),
                );
                Navigator.of(context).push(materialPageRoute);
              }),
          ListTile(
            title: Text('Delete'),
            leading: Icon(Icons.delete),
            onTap: () {
              Navigator.of(context).pop();
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => ShowFile(),
              );
              Navigator.of(context).push(materialPageRoute);showAlertDialog(context);
            },
          ),
        
        ],
      ),
    ));
  }

}

showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget continueButton = FlatButton(
    child: Text("Delete"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("ConfirmDelete"),
    content: Text("Do you want to confirm delete detail?"),
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