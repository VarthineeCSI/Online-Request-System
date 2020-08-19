import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/request_action/presentation/request_send_form_page.dart';
import 'package:onlinerequestsystem/features/requests/bloc/request.dart';
import 'package:onlinerequestsystem/features/requests/presentation/request_action_modal.dart';
import 'package:onlinerequestsystem/features/requests/presentation/form/request_form_widget.dart';
import 'package:onlinerequestsystem/ui/widgets/modal_bottom_sheet.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

class RequestFormPage extends StatelessWidget {
  RequestFormPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Request'),
        backgroundColor: HelperColorsTemplete.myCustomColor,
        actions: [
          IconButton(
            onPressed: () {
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => RequestSendFormPage());
              Navigator.of(context).push(materialPageRoute);
            },
            icon: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(
                Icons.close,
                size: 20,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => RequestSendFormPage());
              Navigator.of(context).push(materialPageRoute);
            },
            icon: CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                Icons.send,
                size: 20,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => showFloatingModalBottomSheet(
              context: context,
              builder: (context, scrollController) =>
                  ModalRequestAction(scrollController: scrollController),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: BlocProvider<RequestBloc>(
        create: (context) => getIt.get<RequestBloc>(),
        child: RequestFormWidget(),
      ),
    );
  }
}
