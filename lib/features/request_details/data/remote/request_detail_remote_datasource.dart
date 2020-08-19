

// * RequestDetailRemoteDataSource
// * @Author: Varthinee Teangthong
// * @Create Date: 2563-08-14

import 'package:onlinerequestsystem/features/request_details/data/remote/request_detail_api.dart';

import '../request_detail_datasource.dart';

class RequestDetailRemoteDataSource implements RequestDetailDataSource {
  static const NAME = "RequestDetailRemoteDataSource";
  final RequestDetailApi requestDetailApi;

  RequestDetailRemoteDataSource(this.requestDetailApi);

  @override
  Future<List> getRequestDetailList(String userCode) => requestDetailApi.getRequestDetailList(userCode);

  @override
  void addRequestDetail(List<dynamic> requestDetails) {}
}
