// * Main
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-29

import 'package:flutter/material.dart';
import 'package:onlinerequestsystem/features/authentication/presentation/login_page.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:onlinerequestsystem/ui/screens/launcher.dart';
import 'di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GlobalConfiguration().loadFromAsset("app_settings");
  await ServiceLocator.register();
  runApp(MyAppPage());
}

// * MyApp This widget is the root of your application.
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-29
class MyAppPage extends StatefulWidget {
  MyAppPage({Key key}) : super(key: key);

  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  Widget currentWidget = Center(child: CircularProgressIndicator());
  @override
  void initState() {
    super.initState();
    checkAuth(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GlobalConfiguration().getString("AppName").toString(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
            // ignore: deprecated_member_use
            title: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: currentWidget,
    );
  }

  Future checkAuth(BuildContext context) async {
    final userCode =
        getIt.get(instanceName: "SharedPreferences").getString('userCode');
    setState(() {
      if (userCode == "470228") {
        currentWidget = Launcher();
      } else {
        currentWidget = LoginPage();
      }
    });
  }
}
