// * @Author: Varthinee Teangthong
// * @Create Date: 2563-07-31
// * @Update Date: 2563-08-14
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:onlinerequestsystem/features/request_details/bloc/request_detail.dart';
import 'package:onlinerequestsystem/features/request_details/presentation/request_detail_extent_action_modal.dart';
import 'package:onlinerequestsystem/ui/widgets/modal_bottom_sheet.dart';
import 'package:onlinerequestsystem/utils/helper.dart';
import 'package:onlinerequestsystem/utils/utils.dart';

class RequestDetailListsWidget extends StatefulWidget {
  RequestDetailListsWidget({Key key}) : super(key: key);

  @override
  _RequestDetailListsWidgetState createState() =>
      _RequestDetailListsWidgetState();
}

class _RequestDetailListsWidgetState extends State<RequestDetailListsWidget> {
  List<dynamic> listStateRequestDetail;

  @override
  void initState() {
    context.bloc<RequestDetailListBloc>().add(FetchRequestDetailList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            alignment: Alignment.topLeft,
            child: Text(
              "Reqest Detail Lists",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ),
          Divider(
            color: Colors.black38,
          ),
          Container(
            child: requestDetailList(),
          ),
        ],
      ),
    );
  }

  Widget requestDetailList() {
    return BlocBuilder<RequestDetailListBloc, RequestDetailListState>(
      builder: (context, state) {
        if (state is RequestDetailListLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is RequestDetailListLoadedState) {
          listStateRequestDetail = state.items;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.all(3),
            itemCount: state.items.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildListTile(context, index);
            },
          );
        }
        return Center(child: Text('Something went wrong!'));
      },
    );
  }

  @override
  Widget _buildListTile(BuildContext context, int index) {
    return ListTile(
      onTap: () {},
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () => showFloatingModalBottomSheet(
              context: context,
              builder: (context, scrollController) =>
                  ModalExtentDetailAction(scrollController: scrollController),
            ),
          ),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActionChip(
            backgroundColor: Utils.colorFromHex("#F5F5F5"),
            label: Text(
              listStateRequestDetail[index]['expenseNo'].toString(),
            ),
            onPressed: () {},
            avatar: CircleAvatar(
              child: Text(listStateRequestDetail[index]['epLineNo'].toString()),
            ),
          ),
          Text(
            listStateRequestDetail[index]['expenseDescription'].toString(),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "Total Amount (Inc.Vat): " +
                listStateRequestDetail[index]['sumTotalAmount'].toString(),
          ),
          SizedBox(
            height: 3,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(listStateRequestDetail[index]['remark']
              .replaceAll('<br/>', '\n')),
        ],
      ),
    );
  }
}
