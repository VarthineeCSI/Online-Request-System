import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/combos/bloc/combo.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

// * ComboWidget
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-08-07
class ComboWidget extends StatefulWidget {
  final String comboType;
  static String tag = 'contactlist-page';

  ComboWidget(this.comboType);

  @override
  _ComboWidgetState createState() => _ComboWidgetState(this.comboType);
}

class _ComboWidgetState extends State<ComboWidget> {
  TextEditingController controller = new TextEditingController();
  final String comboType;

  _ComboWidgetState(this.comboType);

  @override
  void initState() {
    if (this.comboType == "GetMiscCombo") {
      context.bloc<ComboBloc>().add(FetchComboWithFieldName(this.comboType, "DocStatus"));
    } else if (this.comboType == "GetItemComboByText") {
      context.bloc<ComboBloc>().add(
            FetchComboWithDocType(
              this.comboType,
              "2",
              getIt
                  .get(instanceName: "SharedPreferences")
                  .getString("docTypeIDCurrent"),
            ),
          );
    } else {
      context.bloc<ComboBloc>().add(FetchCombo(this.comboType));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return comboLists();
  }

  Widget comboLists() {
    return Column(
      children: <Widget>[
        new Container(
          color: HelperColorsTemplete.myCustomColor,
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Card(
              child: new ListTile(
                leading: new Icon(Icons.search),
                title: new TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                      hintText: 'Search', border: InputBorder.none),
                  onChanged: onSearchTextChanged,
                ),
                trailing: new IconButton(
                  icon: new Icon(Icons.cancel),
                  onPressed: () {
                    controller.clear();
                    onSearchTextChanged('');
                  },
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<ComboBloc, ComboState>(builder: (context, state) {
          if (state is ComboLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ComboLoadedState) {
            return new Expanded(
                child: new ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return new Card(
                  margin: const EdgeInsets.all(0.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(
                          context, state.items[index].comboName.toString());
                    },
                    child: new ListTile(
                      title: new Text(state.items[index].comboName.toString() +
                          state.items[index].comboDetail.toString()),
                    ),
                  ),
                );
              },
            ));
          }
          return Center(child: Text('Something went wrong!'));
        })
      ],
    );
  }

  onSearchTextChanged(String text) async {
    context.bloc<ComboBloc>().add(SearchTextChanged(text));
  }
}
