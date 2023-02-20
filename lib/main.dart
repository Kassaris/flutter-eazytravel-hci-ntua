import 'package:eazy_travel/page.dart';
import 'package:flutter/material.dart';

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
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextButton(
          onPressed: () {},
          child: Text('eazyTravel',
              style: TextStyle(
                  fontSize: 30, fontFamily: 'Pacifico', color: Colors.black)),
        ),
      ),
      body: Column(children: [
        AppBar(
          backgroundColor: Colors.grey,
          elevation: 0,
          centerTitle: true,
          leading: PopupMenuButton<int>(
            icon: const Icon(Icons.menu),
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
                    style: TextStyle(fontSize: 15, color: Colors.black)),
              )),
            ],
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings_rounded),
                tooltip: 'Nfc Mode'),
          ],
          title: Text("Home"),
        ),
        Form(
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
            ]))
      ]),
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
