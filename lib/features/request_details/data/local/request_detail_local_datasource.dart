
// * RequestDetailLocalDataSource
// * @Author: Varthinee Teangthong
// * @Create Date: 2563-08-14
import '../request_detail_datasource.dart';

class RequestDetailLocalDataSource implements RequestDetailDataSource {
  static const NAME = "RequestDetailLocalDataSource";
  List _requestDetails = [];

  @override
  Future<List> getRequestDetailList(String userCode) => Future.value(_requestDetails);

  @override
  void addRequestDetail(List<dynamic> requestDetails) {
    _requestDetails = requestDetails;
  }
}
