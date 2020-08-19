// * Work Flow Status
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-31
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/work_flow_status/bloc/workflow_status.dart';
import 'package:onlinerequestsystem/utils/helper.dart';
import 'package:onlinerequestsystem/utils/utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

class WorkFlowStatusWidget extends StatefulWidget {
  WorkFlowStatusWidget({Key key}) : super(key: key);

  @override
  _WorkFlowStatusWidgetState createState() => _WorkFlowStatusWidgetState();
}

class _WorkFlowStatusWidgetState extends State<WorkFlowStatusWidget> {
  List<dynamic> listStateWorkFlowStatus;
  String epNoCurrent;

  @override
  void initState() {
    this.epNoCurrent =
        getIt.get(instanceName: "SharedPreferences").getString('epNoCurrent');
    context
        .bloc<WorkFlowStatusBloc>()
        .add(FetchWorkFlowStatus(this.epNoCurrent));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(child: getWorkflowList()),
        ],
      ),
    );
  }

  Widget getWorkflowList() {
    return BlocBuilder<WorkFlowStatusBloc, WorkFlowStatusState>(
      builder: (context, state) {
        if (state is WorkFlowStatusLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is WorkFlowStatusLoadedState) {
          listStateWorkFlowStatus = state.items;
          return Container(
            padding: EdgeInsets.only(top: 0),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Center(
              child: ListView.builder(
                  padding: EdgeInsets.all(20),
                  itemCount: listStateWorkFlowStatus.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: _buildTimelineTile(context, index));
                  }),
            ),
          );
        }
        return Center(child: Text('Something went wrong!'));
      },
    );
  }

  _buildTimelineTile(BuildContext context, int index) {
    print("_buildTimelineTile: " + index.toString());
    var epStatusName =
        listStateWorkFlowStatus[index]['epStatusName'].toString();

    var userName = listStateWorkFlowStatus[index]['userName'].toString().trim();
    var array_userName = [];
    array_userName = userName.split(",");
    userName = "";
    for (var i = 0; i < array_userName.length; i++) {
      if (i > 0) userName += "\n";
      userName += array_userName[i].trim();
    }

    var backColor = listStateWorkFlowStatus[index]['backColor'].toString();

    var actionNote = listStateWorkFlowStatus[index]['actionNote'];
    if(actionNote == "") actionNote =null;

    var submitDate = listStateWorkFlowStatus[index]['submitDate'];
    if (submitDate == null) {
      submitDate = "Pending approval...";
    } else {
      submitDate = Utils.dateTimeFullFormat(
          listStateWorkFlowStatus[index]['submitDate'].toString());
    }

    if (index == 0) {
      return TimelineTile(
        alignment: TimelineAlign.manual,
        lineX: 0.1,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          width: 45,
          color: Utils.colorFromHex(backColor),
          padding: EdgeInsets.all(6),
        ),
        rightChild: _RightChild(
          title: epStatusName,
          message: userName,
          time: submitDate,
          note: actionNote,
          color: backColor,
        ),
        topLineStyle: LineStyle(
          color: HelperColorsTemplete.myCustomColor,
        ),
      );
    } else if (index > 0) {
      return TimelineTile(
        alignment: TimelineAlign.manual,
        lineX: 0.1,
        indicatorStyle: IndicatorStyle(
          width: 45,
          color: Utils.colorFromHex(backColor),
          padding: EdgeInsets.all(6),
        ),
        rightChild: _RightChild(
          title: epStatusName,
          message: userName,
          time: submitDate,
          note: actionNote,
          color: backColor,
        ),
        topLineStyle: LineStyle(
          color: HelperColorsTemplete.myCustomColor,
        ),
      );
    } else if (index == listStateWorkFlowStatus.length) {
      return TimelineTile(
        alignment: TimelineAlign.manual,
        lineX: 0.1,
        isLast: true,
        indicatorStyle: IndicatorStyle(
          width: 45,
          color: Utils.colorFromHex(backColor),
          padding: EdgeInsets.all(6),
        ),
        rightChild: _RightChild(
          title: epStatusName,
          message: userName,
          time: submitDate,
          note: actionNote,
          color: backColor,
        ),
        topLineStyle: LineStyle(
          color: HelperColorsTemplete.myCustomColor,
        ),
      );
    }
  }
}

class _RightChild extends StatelessWidget {
  const _RightChild({
    Key key,
    this.title,
    this.message,
    this.time,
    this.note,
    this.color,
    this.disabled = false,
  }) : super(key: key);

  final String title;
  final String message;
  final String time;
  final String note;
  final String color;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ActionChip(
                      shape: StadiumBorder(
                        side: BorderSide(color: Utils.colorFromHex("#F5F5F5")),
                      ),
                      backgroundColor: Utils.colorFromHex(color),
                      label: Text(
                        title,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.schedule, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      message,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                note != null 
                    ? Row(
                        children: <Widget>[
                          Icon(
                            Icons.note,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Note: $note",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
