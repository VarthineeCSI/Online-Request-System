// * Work Flow History
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-03
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/work_flow_history/bloc/workflow_history.dart';
import 'package:onlinerequestsystem/utils/helper.dart';
import 'package:onlinerequestsystem/utils/utils.dart';

class WorkFlowHistoryWidget extends StatefulWidget {
  WorkFlowHistoryWidget({Key key}) : super(key: key);
  @override
  _WorkFlowHistoryWidgetState createState() => _WorkFlowHistoryWidgetState();
}

class _WorkFlowHistoryWidgetState extends State<WorkFlowHistoryWidget> {
  List<dynamic> listStateWorkFlowHistory;
  String epNoCurrent;

  @override
  void initState() {
    this.epNoCurrent =
        getIt.get(instanceName: "SharedPreferences").getString('epNoCurrent');
    context
        .bloc<WorkFlowHistoryBloc>()
        .add(FetchWorkFlowHistory(this.epNoCurrent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                  color: HelperColorsTemplete.myCustomColorOpacity9),
              height: 150,
            ),
          ),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        semanticContainer: true,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
              alignment: Alignment.topLeft,
              child: Text(
                "Workflow History",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            Divider(
              color: Colors.black38,
            ),
            Flexible(
              child: getWorkflowList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget getWorkflowList() {
    return BlocBuilder<WorkFlowHistoryBloc, WorkFlowHistoryState>(
      builder: (context, state) {
        if (state is WorkFlowHistoryLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is WorkFlowHistoryLoadedState) {
          listStateWorkFlowHistory = state.items;
          return ListView.builder(
              padding: EdgeInsets.all(5),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: state.items.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildListTile(context, index);
              });
        }
        return Center(child: Text('Something went wrong!'));
      },
    );
  }

  _buildListTile(BuildContext context, int index) {
    Color backColor =
        Utils.colorFromHex(listStateWorkFlowHistory[index]['backColor']);
    String note = listStateWorkFlowHistory[index]['actionNote'];
    if (note == null) {
      note = "no comment";
    }

    return ListTile(
      trailing: RaisedButton(
        onPressed: () => {},
        color: backColor,
        child: Text(
          listStateWorkFlowHistory[index]['epStatusName'].toString(),
          style: TextStyle(color: Colors.black),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(listStateWorkFlowHistory[index]['actionBy'].toString()),
          Text(Utils.dateTimeFullFormat(
              listStateWorkFlowHistory[index]['actionDate'].toString())),
        ],
      ),
      subtitle: Text("Note: " + note),
    );
  }
}
