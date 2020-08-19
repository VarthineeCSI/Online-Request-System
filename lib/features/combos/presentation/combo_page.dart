import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/combos/bloc/combo.dart';
import 'package:onlinerequestsystem/features/combos/presentation/combo_widget.dart';
import 'package:onlinerequestsystem/utils/helper.dart';
// * ComboPage
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
class ComboPage extends StatelessWidget {
  final String comboType;
  final String title;
  ComboPage(this.comboType, this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: HelperColorsTemplete.myCustomColor,
        title: new Text(this.title),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
      body: BlocProvider<ComboBloc>(
        create: (context) => getIt.get<ComboBloc>(),
        child: ComboWidget(comboType),
      ),
    );
  }
}
