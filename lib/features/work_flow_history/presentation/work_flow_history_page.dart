import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/work_flow_history/bloc/workflow_history.dart';
import 'package:onlinerequestsystem/features/work_flow_history/presentation/work_flow_history_widget.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

// * Request WorkFlowHistoryPage
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-11
class WorkFlowHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Work Flow History'),
        backgroundColor: HelperColorsTemplete.myCustomColor,
      ),
      backgroundColor: Colors.white,
      body: BlocProvider<WorkFlowHistoryBloc>(
        create: (context) => getIt.get<WorkFlowHistoryBloc>(),
        child: WorkFlowHistoryWidget(),
      ),
    );
  }
}
