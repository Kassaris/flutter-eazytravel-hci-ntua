import 'package:flutter/material.dart';

import 'main.dart';
import 'page2.dart';
import 'page3.dart';

class AvailableTripsWidget extends StatefulWidget {
  AvailableTripsWidget({Key? key, required this.mytrip}) : super(key: key);
  final Trip mytrip;
  String _option = '';
  Color _buttonColor = Colors.grey;
  bool _isDisabled = true;

  @override
  _AvailableTripsWidgetState createState() => _AvailableTripsWidgetState();
}

class _AvailableTripsWidgetState extends State<AvailableTripsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          /*leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.black),*/
          title: TextButton(
            onPressed: () {},
            child: Text('eazyTravel',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Pacifico', color: Colors.black)),
          ),
        ),
        body: Scaffold(
          //drawer: CustomDrawerWidget(),
          //  endDrawer: Padding(
          //  padding: EdgeInsets.only(bottom: 200, left: 200),
          //   child: CustomEndDrawerWidget(),
          //  ),
          appBar: AppBar(
            backgroundColor: Colors.grey,
            elevation: 0,
            centerTitle: true,
            /*leading: Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Builder(builder: (BuildContext context) {
                  return IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  );
                })),
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: Builder(builder: (BuildContext context) {
                    return IconButton(
                      icon: Icon(Icons.settings_rounded),
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    );
                  }))
            ],*/
            title: Text("Choose Date"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 60, bottom: 15),
                  child: Center(
                      child: Text('DEPARTURE: ' + widget.mytrip.departure,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)))),
              Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 30),
                  child: Center(
                      child: Text('DESTINATION: ' + widget.mytrip.destination,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)))),
              Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 30),
                  child: Center(
                      child: Text('DATE: ' + widget.mytrip.date,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)))),
              Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: ListTile(
                    title: const Text(
                        'Time: 13:30, Ticket Price: 20€, Number of Stops: 1, Points Gathered: 1000'),
                    leading: Radio<String?>(
                      value:
                          'Time: 13:30, Ticket Price: 20€, Number of Stops: 1, Points Gathered: 1000',
                      activeColor: Colors.deepPurple.shade700,
                      groupValue: widget._option,
                      onChanged: (String? value) {
                        setState(() {
                          widget._option =
                              'Time: 13:30, Ticket Price: 20€, Number of Stops: 1, Points Gathered: 1000';
                          widget._buttonColor = Colors.deepPurple.shade700;
                          widget._isDisabled = false;
                        });
                      },
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: ListTile(
                    title: const Text(
                        'Time: 17:30, Ticket Price: 10€, Number of Stops: 5, Points Gathered: 2000'),
                    leading: Radio<String?>(
                      value:
                          'Time: 17:30, Ticket Price: 10€, Number of Stops: 5, Points Gathered: 2000',
                      activeColor: Colors.deepPurple.shade700,
                      groupValue: widget._option,
                      onChanged: (String? value) {
                        setState(() {
                          widget._option =
                              'Time: 17:30, Ticket Price: 10€, Number of Stops: 5, Points Gathered: 2000';
                          widget._buttonColor = Colors.deepPurple.shade700;
                          widget._isDisabled = false;
                        });
                      },
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: MyElevatedButton(
                      buttonColor: widget._buttonColor,
                      isDisabled: widget._isDisabled,
                      val: Ticket(
                        date: widget.mytrip.date,
                        departure: widget.mytrip.departure, // widget._option,
                        info: widget._option, //widget._option,
                        destination: widget.mytrip.destination,
                      ))) // widget._option))),
            ],
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
        ));
  }
}

class SupportWidget extends StatefulWidget {
  const SupportWidget({Key? key}) : super(key: key);

  @override
  _Support createState() => _Support();
}

class _Support extends State<SupportWidget> {
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
            title: Text("Support"),
          ),
          body: Center(
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                Text("You can contact us through the following options:"),
                Text("Support hours: 09:00 - 17:00"),
                Text("Support@eazytravel.fake"),
                Text("+30 211 0333 333")
              ]))),
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
        ));
  }
}
/*
class OffersWidget extends StatefulWidget {
  const OffersWidget({Key? key}) : super(key: key);

  @override
  _Offers createState() => _Offers();
}

class _Offers extends State<OffersWidget> {
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
            title: Text("Offers"),
          ),
          body: Center(
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[Text('Offers')]))),
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
        ));
  }
}*/

class ViewEditTaskWidget extends StatefulWidget {
  const ViewEditTaskWidget({Key? key}) : super(key: key);

  @override
  _ViewEditTaskWidgetState createState() => _ViewEditTaskWidgetState();
}

class _ViewEditTaskWidgetState extends State<ViewEditTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('View/Edit Task'),
        ),
        body: Form(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Title',
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    minLines: 10,
                    maxLines: 10,
                    decoration: const InputDecoration(
                        hintText: 'Desription',
                        border: OutlineInputBorder(borderSide: BorderSide())),
                  )),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/images/camera.png'),
                        tooltip: 'Camera',
                      ),
                      const Flexible(fit: FlexFit.tight, child: SizedBox()),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel',
                                  style: TextStyle(color: Colors.blue)),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.white)))),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Save',
                                  style: TextStyle(color: Colors.white)),
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.blue))))
                    ],
                  )),
            ])));
  }
}
