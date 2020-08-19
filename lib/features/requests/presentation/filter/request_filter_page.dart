import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/combos/bloc/combo.dart';
import 'package:onlinerequestsystem/features/requests/bloc/request.dart';
import 'package:onlinerequestsystem/features/requests/presentation/filter/request_filter_widget.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

// * Request RequestFilterPage
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-10
class RequestFilterPage extends StatelessWidget {
  RequestFilterPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Search Filters'),
        backgroundColor: HelperColorsTemplete.myCustomColor,
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: RequestFilterWidget(),
    );
  }
}
