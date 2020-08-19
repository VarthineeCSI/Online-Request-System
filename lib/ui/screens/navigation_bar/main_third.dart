// * MainThirdPage
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-29
import 'package:flutter/material.dart';
import 'package:onlinerequestsystem/features/requests/presentation/lists/request_lists_page.dart';

class MainThirdPage extends StatefulWidget {
  static const routeName = '/MainThirdPage';

  @override
  State<StatefulWidget> createState() {
    return _MainThirdPageState();
  }
}

class _MainThirdPageState extends State<MainThirdPage> {
  Widget currentWidget = RequestListsPage();

  @override
  Widget build(BuildContext context) {
    return currentWidget;
  }

}
