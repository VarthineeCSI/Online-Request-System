// * Request Input Request Detail
// * @Author: Varthinee
// * @Create Date: 2563-08-03
// * @๊Update Date: 2563-08-04
// * @Update Date: 2563-08-14

import 'package:flutter/material.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/request_details/presentation/form/request_detail_form_widget.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

class RequestDetailFormPage extends StatelessWidget {
  RequestDetailFormPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Request No. : ' + getIt.get(instanceName: "SharedPreferences").getString("epNoCurrent")),
        backgroundColor: HelperColorsTemplete.myCustomColor,
      ),
      backgroundColor: Colors.white,
      body: RequestDetailFormWidget(),
    );
  }
}
