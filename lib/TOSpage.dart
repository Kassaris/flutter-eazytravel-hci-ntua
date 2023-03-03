import 'package:eazy_travel/page.dart';
import 'package:flutter/material.dart';
import 'page2.dart';
import 'page.dart';

void main() {
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
        primarySwatch: Colors.blue,
      ),
      home: TOSscreenWidget(),
    );
  }
}

class TOSscreenWidget extends StatefulWidget {
  const TOSscreenWidget({Key? key}) : super(key: key);

  @override
  _TOSscreen createState() => _TOSscreen();
}

class _TOSscreen extends State<TOSscreenWidget> {
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
          // drawer: CustomDrawerWidget(),
          //  endDrawer: Padding(
          //   padding: EdgeInsets.only(bottom: 200, left: 200),
          //    child: CustomEndDrawerWidget(),
          //  ),
          appBar: AppBar(
            backgroundColor: Colors.grey,
            elevation: 0,
            centerTitle: true,
            /*  leading: Padding(
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
            title: Text("Terms of Service"),
          ),
          body: Center(
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                Text("1.Agreement to Terms"),
                Text("By viewing or using this Website, which can be accessed"),
                Text("through our mobile application eazyTravel ,"),
                Text(
                    "you are agreeing to be bound by all these Website's Terms of Use"),
                Text("and agree with any applicable local laws."),
                Text(
                    "If you disagree with any of these terms, you are prohibited"),
                Text("from accessing this Website or using the Service."),
                Text("All materials in this Website are protected by "),
                Text(
                    "trade mark law and copyright. For purposes of this Terms of Use,"),
                Text(
                    " the terms “company”, “we” and “our” efers to the Company."),
                Text("2. Privacy policy"),
                Text("By agreeing with the terms of service you consent "),
                Text(
                    "to donate all your properties to eazyTravel LLC for a greater cause."),
                Text(
                    "If you disagree you will be charged with a 10.000€ fine."),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Form(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                      Center(
                          child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.deepPurple.shade200)),
                              onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title:
                                          const Text('You have been scammed'),
                                      content: const Text(
                                          'You agreed to give us 10,000\$ from your personal bank account. '),
                                      actions: <Widget>[
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                Colors.deepPurple.shade900,
                                          ),
                                          onPressed: () => Navigator.pop(
                                              context, 'I Undestand'),
                                          child: const Text('I Understand'),
                                        ),
                                      ],
                                    ),
                                  ),
                              child: const Text(
                                'I Disagree',
                              )),
                          Padding(
                            padding: EdgeInsets.all(20),
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.deepPurple.shade900)),
                              onPressed: () => {Navigator.pop(context)},
                              child: const Text(
                                'I Agree',
                              ))
                        ],
                      ))
                    ]))
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
