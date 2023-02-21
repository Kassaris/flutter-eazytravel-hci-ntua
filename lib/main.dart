import 'package:eazy_travel/page.dart';
import 'package:flutter/material.dart';
import 'page2.dart';

void main() {
  runApp(const easyTravel());
}

class easyTravel extends StatelessWidget {
  const easyTravel({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'easyTravel',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
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
            padding: EdgeInsets.only(bottom: 250, left: 200),
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

            /*Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings_rounded),
                    tooltip: 'Nfc Mode'),
              )
            ],
                               PopupMenuButton<int>(
                      icon: const Icon(Icons.settings_rounded),
                      itemBuilder: (context) => <PopupMenuEntry<int>>[
                            const PopupMenuItem(
                                child: ListTile(
                              title: Text('Clear All'),
                            )),
                            
                            const PopupMenuItem(
                                child: ListTile(
                              title: Text('Clear All'),
                            )),
                            const PopupMenuItem(
                                child: ListTile(
                              title: Text('Clear All'),
                            )),
                            const PopupMenuItem(
                                child: ListTile(
                              title: Text('Clear All',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black)),
                            )),
                          ])*/
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
            title: Text("Home"),
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
                              icon: Icon(Icons.info_rounded,
                                  color: Colors.black), // Your icon here
                              label: Text(
                                'Terms of Service',
                                style: TextStyle(color: Colors.black),
                              ), // Your text here
                              onPressed: () {},
                            )))
                  ])),
            ],
          )),
        ));
  }
}
