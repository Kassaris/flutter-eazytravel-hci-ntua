import 'package:flutter/material.dart';

import 'main.dart';
import 'page2.dart';

class TicketsWidget extends StatefulWidget {
  TicketsWidget({Key? key, required this.ticketsL}) : super(key: key);
  List<Ticket> ticketsL;
  @override
  _TicketsWidgetState createState() => _TicketsWidgetState();
}

class _TicketsWidgetState extends State<TicketsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.black),
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
            title: Text("Choose Date"),
          ),
          body: _buildTicketList(widget.ticketsL),
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

Widget _buildTicketList(_tickets) {
  return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: _tickets.length,
      itemBuilder: (content, index) {
        return ListTile(
            leading: Icon(Icons.airplane_ticket),
            title: Text(
                'DATE: ' +
                    _tickets[index].date +
                    ' DEPARTURE: ' +
                    _tickets[index].departure +
                    ' DESTINATION: ' +
                    _tickets[index].destination +
                    ' INFO: ' +
                    _tickets[index].info,
                style: TextStyle(decoration: TextDecoration.none)));
      });
}
