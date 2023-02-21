import 'package:eazy_travel/page.dart';
import 'package:flutter/material.dart';
import 'page2.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'dart:convert' show utf8;

bool isNfcAvalible = true;

void main() {
  //WidgetsFlutterBinding.ensureInitialized(); // Required for the line below
  //isNfcAvalible = await NfcManager.instance.isAvailable();
  runApp(const easyTravel());
}

class easyTravel extends StatelessWidget {
  const easyTravel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'easyTravel',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.deepPurple,
      ),
      home: TaskListScreenWidget(),
    );
  }
}

class TaskListScreenWidget extends StatefulWidget {
  const TaskListScreenWidget({Key? key}) : super(key: key);

  @override
  _TaskListScreenWidgetState createState() => _TaskListScreenWidgetState();
}

class _TaskListScreenWidgetState extends State<TaskListScreenWidget> {
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
          drawer: CustomDrawerWidget(),
          endDrawer: Padding(
            padding: EdgeInsets.only(bottom: 200, left: 200),
            child: CustomEndDrawerWidget(),
          ),
          appBar: AppBar(
            backgroundColor: Colors.grey,
            elevation: 0,
            centerTitle: true,
            leading: Padding(
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
            ],
            title: Text("HOME"),
          ),
          body: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(40.0),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Departure',
                          border: OutlineInputBorder(borderSide: BorderSide())),
                    )),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Destination',
                          border: OutlineInputBorder(borderSide: BorderSide())),
                    )),
                Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Colors.deepPurple.shade900)),
                        onPressed: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ViewEditTaskWidget()))
                            },
                        child: const Text(
                          'Search',
                        )),
                  ],
                ))
              ]))),
      bottomNavigationBar: BottomAppBar(
          height: 70,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
                  child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.account_circle_sharp,
                              size: 30.0)))),
              Padding(
                  padding: EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
                  child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.home, size: 30.0)))),
              Padding(
                  padding: EdgeInsets.fromLTRB(50.0, 0, 50.0, 0),
                  child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.circle_notifications,
                              size: 30.0)))),
            ],
          ),
          color: Colors.grey),
    );
  }
}
