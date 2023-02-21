import 'package:eazy_travel/ToSpage.dart';
import 'package:flutter/material.dart';
import 'nfc.dart';

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
                            padding: EdgeInsets.only(right: 20, left: 10),
                            child: Icon(Icons.nfc)),
                        Text("Enable NFC Scanning"),
                        MySwitch()
                      ])),
              Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(right: 20, left: 10),
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
                                    minWidth: double.infinity, minHeight: 40),
                                child: TextButton.icon(
                                    icon:
                                        Icon(Icons.phone, color: Colors.black),
                                    onPressed: () {},
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
  const CustomDrawerWidget({super.key});

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
                              onPressed: () {},
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
                              onPressed: () {},
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
                              icon: Icon(Icons.price_check,
                                  color: Colors.black), // Your icon here
                              label: Text('Special Offers',
                                  style: TextStyle(
                                      color: Colors.black)), // Your text here
                              onPressed: () {},
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
                                  icon: Icon(Icons.rate_review,
                                      color: Colors.black), // Your icon here
                                  label: Text(
                                    'Reviews',
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.right,
                                  ), // Your text here
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              MyHomePage(title: "srg")),
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
  const MyCheckbox({super.key});

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

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
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
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
  bool light = true;

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
  double _currentSliderPrimaryValue = 0.2;
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
