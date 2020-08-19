import 'package:flutter/material.dart';
import 'helper.dart';

//get text color for select box (Combo)
Color getColor(String text) {
  if (text.length >= 6) {
    if (text.substring(0, 6) == "Please") {
      return Colors.grey;
    }
  }
  return Colors.black;
}

// style listtile for select box (Combo) 
Widget styleListTile(String value) {
  return ListTile(
    title: Text(
      value,
      style: TextStyle(
        fontSize: 13,
        color: getColor(value),
      ),
    ),
    trailing: Icon(
      Icons.arrow_drop_down,
      color: Colors.grey,
    ),
  );
}

// title for select box (Combo)
Widget widgetTitleComboStyle(String label) {
  return Container(
    alignment: AlignmentDirectional.centerStart,
    margin: EdgeInsets.only(left: 4),
    child: Text(
      label,
      style: TextStyle(fontWeight: FontWeight.w700),
    ),
  );
}

//widget combo for select box (Combo) 
Widget widgetComboStyle(String value) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Container(
      child: Card(
        child: ListTile(
          title: Text(
            value,
            style: TextStyle(
              fontSize: 13,
              color: getColor(value),
            ),
          ),
          trailing: Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
        ),
      ),
    ),
  );
}

//title date for date picker
Widget widgetTitleDatePickerStyle(String label) {
  return Container(
      alignment: AlignmentDirectional.centerStart,
      margin: EdgeInsets.only(left: 4),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.w700),
      ));
}

//widget date for date picker
Widget widgetDatePickerStyle(String value) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: Container(
      child: Card(
        child: ListTile(
          title: Text(
            value,
            style: TextStyle(
              fontSize: 13,
              color: getColor(value),
            ),
          ),
          trailing: Icon(
            Icons.arrow_drop_down,
            color: Colors.grey,
          ),
        ),
      ),
    ),
  );
}
