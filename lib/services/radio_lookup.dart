import 'package:cateyes/models/hamradio_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<PublicHamRadio> lookupRadio(
    String atsign, String radio, PublicHamRadio hamRadio) async {
  print('waiting');
  print('Atsign:$atsign');
  print('Radio:$radio');
  String lookup = 'https://wavi.ng/api?atp=public.$radio.ai6bh@$atsign';
  print(lookup);
  http.Response result = await http.get(Uri.parse(lookup));
  // headers: {"Accept": "application/json",
  //    headers: {       "Access-Control-Allow-Origin": "*",
  //         });
  // Uri.parse('https://wavi.ng/api?atp=public.$radio.ai6bh@$atsign&html'));
  //print(result.body);

  var radioMap = jsonDecode(result.body);
  var radioJson = jsonDecode(radioMap[0]['public.$radio.ai6bh']);
  print(radioJson);
  hamRadio = PublicHamRadio.fromJson(radioJson);
  print(hamRadio.vfoaFrequency);
  return hamRadio;
}
