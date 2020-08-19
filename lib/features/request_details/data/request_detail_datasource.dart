// * RequestDetailDataSource
// * @Author: Varthinee Teangthong
// * @Create Date: 2563-08-14
abstract class RequestDetailDataSource {
  Future<List> getRequestDetailList(String userCode);

  void addRequestDetail(List requestDetails);
}
