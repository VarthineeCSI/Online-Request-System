// * Request Action Form Page
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-01-03
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:onlinerequestsystem/features/combos/presentation/combo_page.dart';
import 'package:onlinerequestsystem/features/request_action/bloc/request_action.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

class RequestSendFormWidget extends StatefulWidget {
  RequestSendFormWidget({Key key}) : super(key: key);

  @override
  _RequestSendFormWidgetState createState() => _RequestSendFormWidgetState();
}

class _RequestSendFormWidgetState extends State<RequestSendFormWidget> {
  @override
  void initState() {
    context.bloc<RequestActionBloc>().add(FetchRequestAction());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            decoration: BoxDecoration(
                color: HelperColorsTemplete.myCustomColorOpacity9),
            height: 150,
          ),
        ),
        _buildBody(context),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<RequestActionBloc, RequestActionState>(
      builder: (context, state) {
        if (state is RequestActionLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is RequestActionLoadedState) {
          return sectionRequestForm(context,state);
        }
        // return Center(child: Text('Something went wrong!'));
        return sectionRequestForm(context,state);
      },
    );
  }

  Widget sectionRequestForm(BuildContext context,RequestActionState state) {
    return Container(
      padding: EdgeInsets.all(10.00),
      child: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("Approve Request"),
                  ),
                  Divider(),
                  inputNextAction(),
                  SizedBox(height: 12),
                  inputNextPerson(),
                  SizedBox(height: 25),
                  inputActionNote()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputNextAction() {
    return TextFormField(
      readOnly: true,
      enableInteractiveSelection: true,
      textCapitalization: TextCapitalization.words,
      decoration: FormsTemplate.textFormFieldDecoration(
        Icon(Icons.info_outline),
        "Next Action",
        null,
      ),
      onSaved: (String value) {},
    );
  }

  Widget inputNextPerson() {
    return TextFormField(
      readOnly: true,
      enableInteractiveSelection: true,
      textCapitalization: TextCapitalization.words,
      decoration: FormsTemplate.textFormFieldDecoration(
        Icon(Icons.person),
        "Next Person",
        null,
      ),
      onSaved: (String value) {},
    );
  }

  Widget inputActionNote() {
    return TextField(
      maxLines: 5,
      textCapitalization: TextCapitalization.sentences,
      decoration: FormsTemplate.textFieldDecoration("Action Note", ""),
      onChanged: (text) => setState(() {}),
    );
  }

}
