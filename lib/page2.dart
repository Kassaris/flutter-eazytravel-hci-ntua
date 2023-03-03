import 'package:eazy_travel/ToSpage.dart';
import 'package:flutter/material.dart';
import 'nfc.dart';
import 'camera.dart';
import 'package:eazy_travel/main.dart';
import 'package:eazy_travel/page3.dart';
import 'page.dart';
import 'dart:async';
import 'package:notification_permissions/notification_permissions.dart';

bool light = true;
double _currentSliderPrimaryValue = 0.2;
bool checked = true;

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
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'SETTINGS',
                    style: TextStyle(fontSize: 14),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Divider(thickness: 1, color: Colors.black)),
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 20, left: 10),
                            child: Icon(Icons.notifications)),
                        Text("Enable Notifications"),
                        Flexible(child: MySwitch())
                      ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 50, left: 10),
                            child: Icon(Icons.volume_up)),
                        Text("Sound Volume"),
                        Flexible(child: MySlider())
                      ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Icon(Icons.report_outlined),
                        Text("Accelerometer Enabled"),
                        MyCheckbox()
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
                        Flexible(
                            child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity, minHeight: 50),
                                child: TextButton.icon(
                                    icon:
                                        Icon(Icons.phone, color: Colors.black),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SupportWidget()),
                                      );
                                    },
                                    label: Text("Contact Support",
                                        style:
                                            TextStyle(color: Colors.black)))))
                      ])),
            ],
          )),
        ));
  }
}

class CustomDrawerWidget extends StatelessWidget {
  CustomDrawerWidget({super.key, required this.tickets});
  List<Ticket> tickets;
  //
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey.shade300,
        child: SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 20),
                  child: Text(
                    'MENU',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Divider(thickness: 1, color: Colors.black)),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(children: <Widget>[
                    Flexible(
                        child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: double.infinity, minHeight: 50),
                            child: TextButton.icon(
                              icon: Icon(Icons.directions_bus,
                                  color: Colors.black), // Your icon here
                              label: Text('Search Stations',
                                  style: TextStyle(
                                      color: Colors.black)), // Your text here
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyScanner()),
                                );
                              },
                            )))
                  ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(children: <Widget>[
                    Flexible(
                        child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: double.infinity, minHeight: 50),
                            child: TextButton.icon(
                              icon: Icon(Icons.favorite,
                                  color: Colors.black), // Your icon here
                              label: Text('My Tickets',
                                  style: TextStyle(
                                      color: Colors.black)), // Your text here
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        TicketsWidget(ticketsL: tickets)));
                              },
                            )))
                  ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(children: <Widget>[
                    Flexible(
                        child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: double.infinity, minHeight: 50),
                            child: TextButton.icon(
                              icon: Icon(Icons.phone_android,
                                  color: Colors.black), // Your icon here
                              label: Text('Permissions',
                                  style: TextStyle(
                                      color: Colors.black)), // Your text here
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Noti()),
                                );
                              },
                            )))
                  ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Flexible(
                            child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minWidth: double.infinity, minHeight: 50),
                                child: TextButton.icon(
                                  icon: Icon(Icons.nfc_rounded,
                                      color: Colors.black), // Your icon here
                                  label: Text(
                                    'Scan Ticket',
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.right,
                                  ), // Your text here
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyHomePage(title: 'nfc')),
                                    );
                                  },
                                )))
                      ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(children: <Widget>[
                    Flexible(
                        child: ConstrainedBox(
                            constraints: const BoxConstraints(
                                minWidth: double.infinity, minHeight: 50),
                            child: TextButton.icon(
                              icon: Icon(Icons.info_rounded,
                                  color: Colors.black), // Your icon here
                              label: Text(
                                'Terms of Service',
                                style: TextStyle(color: Colors.black),
                              ), // Your text here
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const TOSscreenWidget()),
                                );
                              },
                            )))
                  ])),
            ],
          )),
        ));
  }
}

class MyCheckbox extends StatefulWidget {
  MyCheckbox({Key? key}) : super(key: key);
  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  //bool checked = true;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.black;
      }
      return Colors.deepPurple.shade700;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: checked,
      onChanged: (value) {
        setState(() {
          checked = value!;
        });
      },
    );
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  //bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.deepPurple.shade700,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  // double _currentSliderPrimaryValue = 0.2;
  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: Colors.deepPurple.shade700,
      inactiveColor: Colors.white,
      max: 1,
      value: _currentSliderPrimaryValue,
      label: _currentSliderPrimaryValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentSliderPrimaryValue = value;
        });
      },
    );
  }
}

class MyElevatedButton extends StatefulWidget {
  MyElevatedButton(
      {Key? key,
      required this.buttonColor,
      required this.isDisabled,
      required this.val})
      : super(key: key);
  Color buttonColor;
  bool isDisabled;
  Ticket? val;

  @override
  _MyElevatedButtonState createState() => _MyElevatedButtonState();
}

class _MyElevatedButtonState extends State<MyElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.isDisabled
            ? () {}
            : () {
                Navigator.pop(context, widget.val);
              },
        style: ElevatedButton.styleFrom(backgroundColor: widget.buttonColor),
        child: Text("Book", style: TextStyle(color: Colors.white)));
  }
}

class Noti extends StatefulWidget {
  @override
  _NotiState createState() => _NotiState();
}

class _NotiState extends State<Noti> with WidgetsBindingObserver {
  late Future<String> permissionStatusFuture;

  var permGranted = "granted";
  var permDenied = "denied";
  var permUnknown = "unknown";

  @override
  void initState() {
    super.initState();
    // set up the notification permissions class
    // set up the future to fetch the notification data
    permissionStatusFuture = getCheckNotificationPermStatus();
    // With this, we will be able to check if the permission is granted or not
    // when returning to the application
    WidgetsBinding.instance.addObserver(this);
  }

  /// When the application has a resumed status, check for the permission
  /// status
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        permissionStatusFuture = getCheckNotificationPermStatus();
      });
    }
  }

  /// Checks the notification permission status
  Future<String> getCheckNotificationPermStatus() {
    return NotificationPermissions.getNotificationPermissionStatus()
        .then((status) {
      switch (status) {
        case PermissionStatus.denied:
          return permDenied;
        case PermissionStatus.granted:
          return permGranted;
        case PermissionStatus.unknown:
          return permUnknown;

        default:
          return '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextButton(
          onPressed: () {},
          child: Text('eazyTravel',
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Pacifico', color: Colors.black)),
        ),
      ),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          centerTitle: true,
          title: Text("Permissions"),
        ),
        body: Center(
            child: Container(
          margin: EdgeInsets.all(20),
          child: FutureBuilder(
            future: permissionStatusFuture,
            builder: (context, snapshot) {
              // if we are waiting for data, show a progress indicator
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('error while retrieving status: ${snapshot.error}');
              }

              if (snapshot.hasData) {
                var textWidget = Text(
                  "The permission  is ${snapshot.data}",
                  style: TextStyle(fontSize: 20),
                  softWrap: true,
                  textAlign: TextAlign.center,
                );
                // The permission is granted, then just show the text
                if (snapshot.data == permGranted) {
                  return textWidget;
                }

                // else, we'll show a button to ask for the permissions
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    textWidget,
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Colors.deepPurple.shade900)),
                      child: Text(
                          "Give Permission for Notifications".toUpperCase()),
                      onPressed: () {
                        // show the dialog/open settings screen
                        NotificationPermissions.requestNotificationPermissions(
                                iosSettings: const NotificationSettingsIos(
                                    sound: true, badge: true, alert: true))
                            .then((_) {
                          // when finished, check the permission status
                          setState(() {
                            permissionStatusFuture =
                                getCheckNotificationPermStatus();
                          });
                        });
                      },
                    )
                  ],
                );
              }
              return Text("No permission yet");
            },
          ),
        )),
      ),
      bottomNavigationBar: BottomAppBar(
          height: 70,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                  fit: FlexFit.tight,
                  child: Center(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.home, size: 30)))),
            ],
          ),
          color: Colors.grey),
    );
  }
}
