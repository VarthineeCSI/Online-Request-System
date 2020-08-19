// * MainSecondPage
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-29
import 'package:flutter/material.dart';
import 'package:onlinerequestsystem/features/requests/presentation/lists/request_lists_page.dart';

class MainSecondPage extends StatefulWidget {
  static const routeName = '/MainSecondPage';

  @override
  State<StatefulWidget> createState() {
    return _MainSecondPageState();
  }
}

class _MainSecondPageState extends State<MainSecondPage> {
  Widget currentWidget = RequestListsPage();

  @override
  Widget build(BuildContext context) {
    return currentWidget;
  }

}
