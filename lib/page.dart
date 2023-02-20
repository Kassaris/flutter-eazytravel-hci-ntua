import 'package:flutter/material.dart';

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
