// * RequestDetail RequestDetailListsPage
// * @Author: Varthinee Teangthong
// * @Create Date: 2563-08-14

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/request_details/bloc/request_detail.dart';
import 'package:onlinerequestsystem/features/request_details/presentation/lists/request_detail_lists_widget.dart';

class RequestDetailListPage extends StatelessWidget {
  RequestDetailListPage();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RequestDetailListBloc>(
      create: (context) => getIt.get<RequestDetailListBloc>(),
      child: RequestDetailListsWidget(),
    );
  }
}
