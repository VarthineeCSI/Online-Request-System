
// * RequestDetailRepository
// * @Author: Varthinee Teagthong
// * @Create Date: 2563-08-14

import 'package:onlinerequestsystem/features/request_details/data/request_detail_datasource.dart';

abstract class RequestDetailRepository {
  Future<List> getRequestDetailList(String typeRequestDetail);
}

class DefaultRequestDetailRepository implements RequestDetailRepository {
  final RequestDetailDataSource requestDetailRemoteDataSource;
  final RequestDetailDataSource requestDetailLocalDataSource;

  DefaultRequestDetailRepository(this.requestDetailRemoteDataSource, this.requestDetailLocalDataSource);

  Future<List> getRequestDetailList(String typeRequestDetail) async {
    final requestDetails = await requestDetailLocalDataSource.getRequestDetailList(typeRequestDetail);
    if (requestDetails.length == 0) {
      final requestDetailList = await requestDetailRemoteDataSource.getRequestDetailList(typeRequestDetail);
      requestDetailLocalDataSource.addRequestDetail(requestDetailList);
      return requestDetailList;
    }
    return requestDetails;
  }
}
