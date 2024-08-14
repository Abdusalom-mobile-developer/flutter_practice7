import 'package:fancy_bottom_navigation_plus/fancy_bottom_navigation_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({
    super.key,
  });

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _key = GlobalKey<FormState>();
  String _emailAddress = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FancyBottomNavigationPlus(
        // barBackgroundColor: Colors.black,
        circleColor: Colors.grey,
        barBackgroundColor: Colors.white,
        titleStyle: TextStyle(color: Colors.black),
        tabs: [
          TabData(
            icon: Icon(
              Icons.home,
              // color: Colors.black,
            ),
            title: "Home",
          ),
          TabData(
              icon: Icon(
                Icons.person,
                // color: Colors.white,
              ),
              title: "Profile"),
          TabData(
              icon: Icon(
                Icons.shop,
                // color: Colors.white,
              ),
              title: "Market"),
          TabData(
              icon: Icon(
                Icons.settings,
                // color: Colors.white,
              ),
              title: "Settings"),
        ],
        onTabChangedListener: (position) {},
      ),
      floatingActionButton: SpeedDial(
        overlayColor: Colors.black,
        overlayOpacity: 0.6,
        foregroundColor: Colors.white,
        children: [
          SpeedDialChild(
            child: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Colors.purple,
            shape: CircleBorder(),
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.blue,
            shape: CircleBorder(),
            onTap: () {},
          ),
          SpeedDialChild(
            child: Icon(Icons.shop),
            label: "Shop",
            backgroundColor: Colors.grey,
            shape: CircleBorder(),
            onTap: () {},
          )
        ],
        backgroundColor: Colors.black,
        child: Icon(Icons.ac_unit),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 50, 30, 0),
        child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Log in",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email address",
                  ),
                  validator: (value) => (!value!.contains("@"))
                      ? "Please enter a valid email address"
                      : null,
                  onSaved: (newValue) => _emailAddress = newValue!,
                ),
                SizedBox(
                  height: 35,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  validator: (value) => (value!.length < 8)
                      ? "Please enter a valid password!"
                      : null,
                  onSaved: (newValue) => _password = newValue!,
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  width: 135,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25)),
                  child: TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    onPressed: () {
                      if (_key.currentState!.validate()) {
                        setState(() {
                          _key.currentState!.save();
                        });
                      }
                    },
                    child: Text("Log in"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Email: $_emailAddress",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text("Password: $_password",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ],
            )),
      ),
    );
  }
}
