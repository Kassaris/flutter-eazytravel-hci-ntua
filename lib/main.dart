import 'package:eazy_travel/page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:eazy_travel/page2.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'camera.dart';
import 'page2.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

late List<CameraDescription> cameras;
late bool isNfcAvalible = true;

late CameraDescription firstCamera;
Future<void> main() async {
  /*
//import scanner package file

  //bool isAvailable = await NfcManager.instance.isAvailable();

  WidgetsFlutterBinding.ensureInitialized(); 
  cameras = await availableCameras();
  firstCamera = cameras.first;

  */
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
      home: EazyTravelScreenWidget(),
    );
  }
}

class EazyTravelScreenWidget extends StatefulWidget {
  const EazyTravelScreenWidget({Key? key}) : super(key: key);

  @override
  _EazyTravelScreenWidgetState createState() => _EazyTravelScreenWidgetState();
}

class _EazyTravelScreenWidgetState extends State<EazyTravelScreenWidget> {
  List<Ticket> _tickets = <Ticket>[];
  void _Fun(departureController, destinationController, dateEditingController,
      formKey) async {
    if (formKey.currentState!.validate()) {
      final trip = Trip(
          departure: departureController.text,
          destination: destinationController.text,
          date: dateEditingController.text);
      Ticket? result = await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AvailableTripsWidget(mytrip: trip)));
      _formKey.currentState!.reset();
      if (result != null) {
        _tickets.add(result);
        print(_tickets);
      }
    }
  }

  final _formKey = GlobalKey<FormState>();
  final _departureController = TextEditingController();
  final _destinationController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TextEditingController _dateEditingController = TextEditingController();

  @override
  void dispose() {
    _departureController.dispose();
    _destinationController.dispose();
    super.dispose();
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
          drawer: CustomDrawerWidget(tickets: _tickets), //tickets: _tickets
          endDrawer: Padding(
            padding: EdgeInsets.only(bottom: 200, left: 150),
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
            title: Text("Home"),
          ),
          body: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Form(
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Center(
                                child: Text('Departure:',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)))),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Departure',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide())),
                              controller: _departureController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Departure cannot be empty';
                                }
                                return null;
                              },
                            )),
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: Center(
                                child: Text(
                              'Destination:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ))),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Destination',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide())),
                              controller: _destinationController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Destination cannot be empty';
                                }
                                return null;
                              },
                            )),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Flexible(
                                child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.date_range,
                                        color: Colors.deepPurple.shade700,
                                      ),
                                      hintText: 'Date',
                                    ),
                                    controller: _dateEditingController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Date cannot be empty';
                                      }
                                      return null;
                                    },
                                    onTap: () {
                                      _selectDate(context);
                                    })),
                            Flexible(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.deepPurple.shade900)),
                                    onPressed: () => _Fun(
                                        _departureController,
                                        _destinationController,
                                        _dateEditingController,
                                        _formKey),
                                    child: const Text(
                                      'Search',
                                    ))),
                          ],
                        ))
                      ])))),
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

  _selectDate(BuildContext context) async {
    DateTime? result = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2023, 12),
        builder: (BuildContext context, picker) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.grey,
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.grey[300],
            ),
            child: picker!,
          );
        });

    if (result != null) {
      _selectedDate = result;
      _dateEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _dateEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class Trip {
  String departure;
  String destination;
  String date;
  Trip({
    required this.departure,
    required this.destination,
    required this.date,
  });
}

class Ticket extends Trip {
  String info;
  Ticket({
    required super.departure,
    required super.destination,
    required super.date,
    required this.info,
  });
}

class MyScanner extends StatefulWidget {
  @override
  _MyScannerState createState() => _MyScannerState();
}

class _MyScannerState extends State<MyScanner> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
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
            title: Text("Scan Station Codes"),
          ),
          body: Builder(builder: (BuildContext context) {
            return Container(
                alignment: Alignment.center,
                child: Flex(
                    direction: Axis.vertical,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.deepPurple.shade900)),
                          onPressed: () => scanBarcodeNormal(),
                          child: Text('Start barcode scan')),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.deepPurple.shade900)),
                          onPressed: () => scanQR(),
                          child: Text('Start QR scan')),
                      Text('Scan result : $_scanBarcode\n',
                          style: TextStyle(fontSize: 20))
                    ]));
          })),
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
