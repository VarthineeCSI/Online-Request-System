import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/requests/bloc/request.dart';
import 'package:onlinerequestsystem/features/requests/presentation/filter/request_filter_page.dart';
import 'package:onlinerequestsystem/features/requests/presentation/lists/request_lists_widget.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

// * Request RequestListsPage
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-13
class RequestListsPage extends StatelessWidget {
  RequestListsPage();
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      appBar: new AppBar(
        title: Text('View Online Request Lists'),
        key: scaffoldKey,
        automaticallyImplyLeading: false,
        backgroundColor: HelperColorsTemplete.myCustomColor,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => RequestFilterPage());
              Navigator.of(context).push(materialPageRoute);
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                  color: HelperColorsTemplete.myCustomColorOpacity9),
              height: 200,
            ),
          ),
          BlocProvider<RequestListBloc>(
            create: (context) => getIt.get<RequestListBloc>(),
            child: RequestListsWidget(),
          ),
        ],
      ),
    );
  }
}
