// * Request Show File
// * @Author: Varthinee
// * @Create Date: 2563-07-30
// * @update Date: 2563-08-03

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:onlinerequestsystem/utils/helper.dart';


class ShowFile extends StatefulWidget {
  @override
  _ShowFileState createState() => _ShowFileState();
}

class _ShowFileState extends State<ShowFile> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
//Explicit

//Method
////////////////////////////
  Widget confirmButtom() {
    return IconButton(
      icon: Icon(Icons.done),
      onPressed: () {
        showAlertDialog(context);
      },
      
    );
  }
////////////////////////
  
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Save"),
      onPressed: () {
        Navigator.of(context).pop();
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text("SaveFile"),
        ),);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm"),
      content: Text("Do you want to confirm uploadfile?"),
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

  
//////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attach File'),
        actions: <Widget>[confirmButtom()],
        backgroundColor: HelperColorsTemplete.myCustomColor,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
         child: Column(
           children: <Widget>[

                
           ],
         ),
      ),
    ));
  }


}
