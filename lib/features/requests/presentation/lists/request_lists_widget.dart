// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-31
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/requests/bloc/form/request_form_bloc.dart';
import 'package:onlinerequestsystem/features/requests/bloc/request.dart';
import 'package:onlinerequestsystem/features/requests/presentation/form/request_form_page.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

class RequestListsWidget extends StatefulWidget {
  RequestListsWidget({Key key}) : super(key: key);

  @override
  _RequestListsWidgetState createState() => _RequestListsWidgetState();
}

class _RequestListsWidgetState extends State<RequestListsWidget> {
  ScrollController scrollController = ScrollController();
  int amountListView = 15;

  List<dynamic> stateRequest;

  @override
  void initState() {
    context.bloc<RequestListBloc>().add(FetchDefaultRequestList());
    super.initState();
    scrollController.addListener(() {
      if (stateRequest.length > 15) {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          setState(() {
            amountListView = amountListView + 15;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return requestLists(context);
  }

  Widget requestLists(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            BlocBuilder<RequestListBloc, RequestListState>(
              builder: (context, state) {
                if (state is RequestListLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is RequestListLoadedState) {
                  stateRequest = state.items;
                  if (state.items.length < 15) {
                    amountListView = state.items.length;
                  }
                  return Container(
                    padding: EdgeInsets.only(top: 75),
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: ListView.builder(
                        controller: scrollController,
                        padding: EdgeInsets.all(3),
                        itemCount: amountListView,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildCardList(context, index);
                        }),
                  );
                }
                return Center(child: Text('Something went wrong!'));
              },
            ),
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: _buildSearch()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: TextField(
        onTap: () {},
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          hintText: "Search Filters",
          suffixIcon: Material(
            elevation: 2.0,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            child: Icon(Icons.search),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildCardList(BuildContext context, int index) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: InkWell(
        onTap: () {
          routeToRequestForm(stateRequest[index]['epNo'].toString());
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ActionChip(
                  label: Text(
                    stateRequest[index]['epNo'].toString(),
                    style: TextStyle(
                        color: HelperColorsTemplete.myCustomColor, ///////////
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  onPressed: () {},
                  avatar: CircleAvatar(
                    child: Icon(Icons.info, size: 15),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(Icons.bookmark_border, color: Colors.grey),
                    Text(
                      stateRequest[index]['expenseType'].toString(),
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money, color: Colors.grey),
                    Text(
                      stateRequest[index]['totalLineAmount'].toString() +
                          " " +
                          stateRequest[index]['epCurrency'].toString(),
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ActionChip(
                  label: Text(
                    stateRequest[index]['epStatusName'].toString(),
                    style: TextStyle(
                        color: HelperColorsTemplete.myCustomColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  onPressed: () {},
                  avatar: CircleAvatar(
                    child: Icon(
                      Icons.clear_all,
                      size: 15,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(Icons.date_range, color: Colors.grey),
                    Text(
                      stateRequest[index]['createDate']
                          .split("T")[0]
                          .toString(),
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(Icons.edit, color: Colors.grey),
                    Text(
                      stateRequest[index]['requester'].toString(),
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<Null> routeToRequestForm(String epNo) async {
    getIt.get(instanceName: "SharedPreferences").setString(
          "epNoCurrent",
          epNo,
        );
    getIt.get(instanceName: "SharedPreferences").setString(
          "typeForm",
          "update",
        );
    MaterialPageRoute materialPageRoute = MaterialPageRoute(
      builder: (BuildContext context) => RequestFormPage(),
    );
    Navigator.of(context).push(materialPageRoute);
  }
}
