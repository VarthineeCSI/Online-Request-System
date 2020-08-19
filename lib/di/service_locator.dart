import 'package:get_it/get_it.dart';
import 'package:onlinerequestsystem/features/authentication/login_locator.dart';
import 'package:onlinerequestsystem/features/combos/combo_locator.dart';
import 'package:onlinerequestsystem/features/request_action/request_action_locator.dart';
import 'package:onlinerequestsystem/features/request_details/request_detail_locator.dart';
import 'package:onlinerequestsystem/features/requests/request_locator.dart';
import 'package:onlinerequestsystem/features/work_flow_history/workflow_history_locator.dart';
import 'package:onlinerequestsystem/features/work_flow_status/workflow_status_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  static register() {
    getIt.registerSingletonAsync(
      () => SharedPreferences.getInstance(),
      instanceName: "SharedPreferences",
    );
    LoginLocator.register();
    ComboLocator.register();
    RequestLocator.register();
    RequestActionLocator.register();
    RequestDetailLocator.register();
    WorkFlowHistoryLocator.register();
    WorkFlowStatusLocator.register();
  }
}
