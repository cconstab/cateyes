import 'package:flutter/material.dart';
import 'dart:html';

import 'package:cateyes/theme/ui_theme.dart';
import 'package:cateyes/services/radio_lookup.dart';

Map<String, String> getParams() {
  var uri = Uri.dataFromString(window.location.href);
  Map<String, String> params = uri.queryParameters;
  print(params.toString());
  return (params);
}

void main() {
  Map<String, String> params = getParams();

  runApp(MyApp(params));
}

class MyApp extends StatelessWidget {
  final Map<String, String> params;
  const MyApp(this.params, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAT',
      theme: ThemeData(
          primarySwatch: Colors.green,
          backgroundColor: UItheme.richBlackFOGRA29),
      home: MyHomePage(params),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Map<String, String> params;
  const MyHomePage(this.params, {Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? atsign;
  String? radio;
  String message = '';

  @override
  initState() {
    super.initState();
    Map<String, String> params = widget.params;
    print(params.toString());
    atsign = params['atsign'];
    radio = params['radio'];
    print('atsign:$atsign  radio:$radio');
    if (atsign == null || radio == null) {
      message = 'RADIO OR @SIGN NOT FOUND';
    } else {
      message = lookupRadio(atsign.toString(),radio.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UItheme.richBlackFOGRA29,
      body: Center(
        child: SizedBox(
          width: 600,
          height: 50,
          // ignore: prefer_const_constructors
          child: Text(message,
              style: const TextStyle(
                  fontFamily: 'LED',
                  fontSize: 40,
                  letterSpacing: 5,
                  color: Colors.green)),
        ),
      ),
    );
  }
}
