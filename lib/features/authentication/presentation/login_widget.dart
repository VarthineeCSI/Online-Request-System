import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:onlinerequestsystem/di/service_locator.dart';
import 'package:onlinerequestsystem/ui/screens/launcher.dart';
import 'package:onlinerequestsystem/ui/widgets/wave_clipper.dart';
import 'package:onlinerequestsystem/utils/helper.dart';

class LoginWidget extends StatefulWidget {
  LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        buildHeader(),
        SizedBox(
          height: 30,
        ),
        inputUsername(),
        SizedBox(
          height: 20,
        ),
        inputPassword(),
        SizedBox(
          height: 25,
        ),
        btnLogin(),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "FORGOT PASSWORD ?",
            style: TextStyle(
                color: HelperColorsTemplete.myCustomColor,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Don't have an Account ? ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
            Text("Contact IT Support ",
                style: TextStyle(
                    color: HelperColorsTemplete.myCustomColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    decoration: TextDecoration.underline)),
          ],
        )
      ],
    );
  }

  Widget buildHeader() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper2(),
          child: Container(
            child: Column(),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(color: Color.fromRGBO(5, 116, 133, 0.5)),
          ),
        ),
        ClipPath(
          clipper: WaveClipper3(),
          child: Container(
            child: Column(),
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(color: Color.fromRGBO(5, 116, 133, 0.7)),
          ),
        ),
        ClipPath(
          clipper: WaveClipper1(),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 260.0,
                  child: Image.asset('assets/images/csi-logo.png'),
                ),
                SizedBox(
                  height: 20,
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
            width: double.infinity,
            height: 300,
            decoration:
                BoxDecoration(color: HelperColorsTemplete.myCustomColor),
          ),
        ),
      ],
    );
  }

  Widget inputUsername() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: TextField(
          onChanged: (String value) {},
          cursorColor: Colors.deepOrange,
          decoration: InputDecoration(
              hintText: "Username",
              prefixIcon: Material(
                elevation: 0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Icon(
                  Icons.person,
                  color: HelperColorsTemplete.myCustomColor,
                ),
              ),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
        ),
      ),
    );
  }

  Widget inputPassword() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: TextField(
          onChanged: (String value) {},
          cursorColor: Colors.deepOrange,
          decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Material(
                elevation: 0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Icon(
                  Icons.lock,
                  color: HelperColorsTemplete.myCustomColor,
                ),
              ),
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
        ),
      ),
    );
  }

  Widget btnLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: HelperColorsTemplete.myCustomColor),
        child: FlatButton(
          child: Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
          ),
          onPressed: () {
            getIt
                .get(instanceName: "SharedPreferences")
                .setString("userCode", "470228");
            checkAuth(context);
          },
        ),
      ),
    );
  }

  Future checkAuth(BuildContext context) async {
    final userCode =
        getIt.get(instanceName: "SharedPreferences").getString('userCode');
    if (userCode == "470228") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Launcher()));
    }
  }
} // class
