// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-31
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinerequestsystem/features/attach_file/presentation/attach_file/attach_file_widget.dart';
import 'package:onlinerequestsystem/features/request_details/presentation/form/request_detail_form_page.dart';

import 'package:onlinerequestsystem/features/work_flow_history/presentation/work_flow_history_page.dart';
import 'package:onlinerequestsystem/features/work_flow_status/presentation/work_flow_status_page.dart';

class ModalRequestAction extends StatelessWidget {
  final ScrollController scrollController;

  const ModalRequestAction({Key key, this.scrollController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('Add Detail'),
            leading: Icon(Icons.add_circle),
            onTap: () {
              Navigator.of(context).pop();
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => RequestDetailFormPage(),
              );
              Navigator.of(context).push(materialPageRoute);
            },
          ),
          ListTile(
              title: Text('Attach File'),
              leading: Icon(Icons.file_upload),
              onTap: () {
                MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => AttachFile(),
                );
                Navigator.of(context).push(materialPageRoute);
              }),
          ListTile(
            title: Text('Flow Status'),
            leading: Icon(Icons.timeline),
            onTap: () {
              Navigator.of(context).pop();
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => WorkFlowStatusPage(),
              );
              Navigator.of(context).push(materialPageRoute);
            },
          ),
          ListTile(
            title: Text('Flow History'),
            leading: Icon(Icons.history),
            onTap: () {
              Navigator.of(context).pop();
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => WorkFlowHistoryPage(),
              );
              Navigator.of(context).push(materialPageRoute);
            },
          ),
        ],
      ),
    ));
  }
}

class InputRequestDetailPage {
}
