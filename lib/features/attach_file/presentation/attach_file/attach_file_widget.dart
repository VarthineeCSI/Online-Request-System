// * Request Attach File
// * @Author: Varthinee Teangthong
// * @Create Date: 2563-07-30
// * @update Date: 2563-08-03

import 'package:flutter/material.dart';
import 'package:onlinerequestsystem/features/attach_file/presentation/addfile_action_modal.dart';
import 'package:onlinerequestsystem/features/attach_file/presentation/file_action_modal.dart';
import 'package:onlinerequestsystem/ui/widgets/modal_bottom_sheet.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

class AttachFile extends StatefulWidget {
  AttachFile({Key key}) : super(key: key);

  @override
  _AttachFileState createState() => _AttachFileState();
}

class _AttachFileState extends State<AttachFile> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add File'),
        backgroundColor: HelperColorsTemplete.myCustomColor,
      ),
      body: Card(
        elevation: 3.0,
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("File List"),
                    Spacer(),
                    fileButton(context),
                  ],
                ),
                _buildList1(context),
                _buildList1(context),
                _buildList1(context),
                _buildList1(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fileButton(BuildContext context) {
    return RaisedButton(
      color: HelperColorsTemplete.myCustomColor,
      child: Text(
        '+ Add File',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => showFloatingModalBottomSheet(
        context: context,
        builder: (context, scrollController) =>
            ModalAddFileAction(scrollController: scrollController),
      ),
    );
  }

  Widget _buildList1(
    BuildContext context,
  ) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Column(
        children: <Widget>[
          ListTile(
            trailing: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => showFloatingModalBottomSheet(
                    context: context,
                    builder: (context, scrollController) =>
                        ModalFileAction(scrollController: scrollController),
                  ),
                ),
              ],
            ),
            title: Text(
              "Fild1111111.PDF",
            ),
          ),
        ],
      ),
    );
  }
}
