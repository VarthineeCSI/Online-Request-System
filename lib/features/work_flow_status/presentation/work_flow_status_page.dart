import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/work_flow_status/bloc/workflow_status.dart';
import 'package:onlinerequestsystem/features/work_flow_status/presentation/work_flow_status_widget.dart';
import 'package:onlinerequestsystem/utils/helper.dart';
import 'package:onlinerequestsystem/utils/utils.dart';

// * Request WorkFlowStatusPage
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-11
class WorkFlowStatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Work Flow Status'),
        backgroundColor: HelperColorsTemplete.myCustomColor,
      ),
      backgroundColor: Utils.colorFromHex("#F5F5F5"),
      body: BlocProvider<WorkFlowStatusBloc>(
        create: (context) => getIt.get<WorkFlowStatusBloc>(),
        child: WorkFlowStatusWidget(),
      ),
    );
  }
}
