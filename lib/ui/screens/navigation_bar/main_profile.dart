// * Profile Page
// * @Author: Jiramate Phuaphan
// * @Create Date: 2563-07-29
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/features/authentication/presentation/login_page.dart';
import 'package:onlinerequestsystem/features/requests/presentation/form/request_form_page.dart';
import 'package:onlinerequestsystem/utils/helper.dart';
import 'package:onlinerequestsystem/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  static const routeName = '/ProfilePage';

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  final image = 'assets/images/mobile-app-development-company.png';
  final image2 = 'assets/images/employees.png';

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    print("userCode: " +
        getIt.get(instanceName: "SharedPreferences").getString('userCode'));
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      backgroundColor: Utils.colorFromHex("#F5F5F5"),
      key: scaffoldKey,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          SizedBox(
            height: 520,
            width: double.infinity,
            child: const DecoratedBox(
              decoration: const BoxDecoration(
                  color: HelperColorsTemplete.myCustomColor),
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 45,
                ),
                Container(
                  width: 222.0,
                  child: Image.asset('assets/images/csi-logo.png'),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  GlobalConfiguration().getString('AppName').toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 30),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(16.0, 200.0, 16.0, 16.0),
            child: Column(
              children: <Widget>[
                cardProfile(),
                SizedBox(height: 50.0),
                cardMenu(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardProfile() {
    return Card(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.only(top: 16.0),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 96.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "No. 470228",
                        style: Theme.of(context).textTheme.title,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        title: Text("Mr. Phoomsak Lumprasert"),
                        subtitle: Text("Organization MAT"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          ActionChip(
                            backgroundColor: Utils.colorFromHex("#F5F5F5"),
                            avatar: CircleAvatar(child: Text("5"),),
                            label: Text(
                              "Request",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          ActionChip(
                            backgroundColor: Utils.colorFromHex("#F5F5F5"),
                            avatar: CircleAvatar(child: Text("4"),),
                            label: Text(
                              "Approved",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(image2), fit: BoxFit.cover)),
            margin: EdgeInsets.fromLTRB(16, 27, 0, 0),
          ),
        ],
      ),
    );
  }

  Widget cardMenu() {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("Menu"),
                ),
                Divider(),
                ListTile(
                  title: Text("Create Online Request Form"),
                  leading: Icon(
                    Icons.add_box,
                    color: HelperColorsTemplete.myCustomColor,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: HelperColorsTemplete.myCustomColor,
                  ),
                  onTap: () {
                    getIt.get(instanceName: "SharedPreferences").setString(
                          "typeForm",
                          "insert",
                        );
                    MaterialPageRoute materialPageRoute = MaterialPageRoute(
                        builder: (BuildContext context) => RequestFormPage());
                    Navigator.of(context).push(materialPageRoute);
                  },
                ),
                ListTile(
                  title: Text("Logout", style: TextStyle(color: Colors.grey)),
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Colors.grey,
                  ),
                  trailing: Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    routeToLogin();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void routeToLogin() async {
    getIt.get(instanceName: "SharedPreferences").clear();
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => LoginPage(),
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }
} // _ProfilePageState
