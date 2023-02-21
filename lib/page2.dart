import 'package:flutter/material.dart';

class CustomEndDrawerWidget extends StatefulWidget {
  const CustomEndDrawerWidget({Key? key}) : super(key: key);

  @override
  _CustomEndDrawerWidgetState createState() => _CustomEndDrawerWidgetState();
}

class _CustomEndDrawerWidgetState extends State<CustomEndDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey.shade300,
        child: SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    'SETTINGS',
                    style: TextStyle(fontSize: 14),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Divider(thickness: 1, color: Colors.black)),
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(Icons.notifications),
                        Text("Push Notifications"),
                        //Switch())
                      ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(Icons.nfc),
                        Text("NFC Enabled"),
                        // Switch())
                      ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(Icons.volume_up),
                        Text("Sound Volume"),
                        //Slider())
                      ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Divider(thickness: 1, color: Colors.black)),
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(Icons.report_outlined),
                        Text("Accelerometer Enabled"),
                        // Checkbox()
                      ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(Icons.phone),
                        Text("Contact Support")
                      ])),
            ],
          )),
        ));
  }
}
