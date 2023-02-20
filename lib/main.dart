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
        title: Text('easyTravel'),
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
              title: Text('Clear All'),
            )),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/camera.png'),
              tooltip: 'Nfc Mode'),
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/camera.png'),
              tooltip: 'Camera Mode')
        ],
      ),
      //body: () {},
      bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(onPressed: () {}, icon: const Icon(null))
            ],
          ),
          color: Colors.blue),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
          backgroundColor: Colors.teal,
          tooltip: 'Add Task'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
