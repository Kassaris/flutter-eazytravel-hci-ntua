import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'dart:convert' show utf8;
import 'main.dart';

/// Global flag if NFC is avalible

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _serialNumber = 0;
  bool listenerRunning = false;
  bool writeSerialNumber = false;

  void _ticketNumber() {
    setState(() {
      _serialNumber;
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
          title: Text("Scan Ticket"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _getNfcWidgets(),
            ],
          ),
        ),
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
    );
  }

  Widget _getNfcWidgets() {
    if (isNfcAvalible) {
      final nfcRunning = listenerRunning;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.deepPurple.shade900),
            onPressed: nfcRunning ? null : _listenForNFCEvents,
            child: Text(true
                ? listenerRunning
                    ? 'NFC is turned on'
                    : 'Enable NFC'
                : 'yerj'),
          ),
          TextButton(
            style: TextButton.styleFrom(
                foregroundColor: Colors.deepPurple.shade900),
            onPressed: writeSerialNumber ? null : _writeNfcTag,
            child: Text(writeSerialNumber
                ? 'Waiting for ticket to be scanned'
                : 'Scan Ticket'),
          ),
        ],
      );
    } else
      return Text('Turn NFC on');
  }

  //quick message
  void _alert(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        duration: const Duration(
          seconds: 2,
        ),
      ),
    );
  }

  Future<void> _listenForNFCEvents() async {
    if (listenerRunning == false) {
      //reading nfc in the background, starting it one time is all we need

      _alert(
        'NFC is enabled, approach phone',
      );
      //Update button states
      setState(() {
        listenerRunning = true;
      });

      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          bool succses = false;
          //Try to convert the raw tag data to NDEF
          final ndefTag = Ndef.from(tag);
          //If the data could be converted we will get an object
          if (ndefTag != null) {
            // If we want to write the current counter vlaue we will replace the current content on the tag
            if (writeSerialNumber) {
              //Ensure the write flag is off again
              setState(() {
                writeSerialNumber = false;
              });
              //Create a 1Well known tag with en as language code and 0x02 encoding for UTF8
              final ndefRecord =
                  NdefRecord.createText(_ticketNumber.toString());
              //Create a new ndef message with a single record
              final ndefMessage = NdefMessage([ndefRecord]);
              //Write it to the tag, tag must still be "connected" to the device
              try {
                //Any existing content will be overrwirten
                await ndefTag.write(ndefMessage);
                _alert('TIcket ready to be scanned');
                succses = true;
              } catch (e) {
                _alert("Writting failed, press 'Scan Ticket' again");
              }
            }
            //The NDEF Message was already parsed, if any
            else if (ndefTag.cachedMessage != null) {
              var ndefMessage = ndefTag.cachedMessage!;
              //Each NDEF message can have multiple records, we will use the first one in our example
              if (ndefMessage.records.isNotEmpty &&
                  ndefMessage.records.first.typeNameFormat ==
                      NdefTypeNameFormat.nfcWellknown) {
                //If the first record exists as 1:Well-Known we consider this tag as having a value for us
                final wellKnownRecord = ndefMessage.records.first;

                ///Payload for a 1:Well Known text has the following format:
                ///[Encoding flag 0x02 is UTF8][ISO language code like en][content]
                if (wellKnownRecord.payload.first == 0x02) {
                  //Now we know the encoding is UTF8 and we can skip the first byte
                  final languageCodeAndContentBytes =
                      wellKnownRecord.payload.skip(1).toList();
                  //Note that the language code can be encoded in ASCI, if you need it be carfully with the endoding
                  final languageCodeAndContentText =
                      utf8.decode(languageCodeAndContentBytes);
                  //Cutting of the language code
                  final payload = languageCodeAndContentText.substring(2);
                  //Parsing the content to int
                  final storedSerial = int.tryParse(payload);
                  if (storedSerial != null) {
                    succses = true;
                    _alert('ticket No. saved');
                    setState(() {
                      _serialNumber = storedSerial;
                    });
                  }
                }
              }
            }
          }
          if (succses == false) {
            _alert(
              'Ticket was not valid',
            );
          }
        },
      );
    }
  }

  @override
  void dispose() {
    try {
      NfcManager.instance.stopSession();
    } catch (_) {}
    super.dispose();
  }

  void _writeNfcTag() {
    setState(() {
      writeSerialNumber = true;
    });

    _alert('Approach phone');

    _listenForNFCEvents();
  }
}
