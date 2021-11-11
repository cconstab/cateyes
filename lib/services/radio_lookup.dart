import 'package:cateyes/models/hamradio_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void lookupRadio(String atsign, String radio, PublicHamRadio hamRadio) async {
  print('waiting');
  http.Response result = await http.get(
      Uri.parse("http://localhost:8080/api?atp=public.ic7100.ai6bh@ai6bh"));
  // headers: {"Accept": "application/json",
  //           "Access-Control-Allow-Origin": "*",
  //           });
  // Uri.parse('https://wavi.ng/api?atp=public.$hamradio.ai6bh@$atsign&html'));
  print(result.body);

  var radioMap = jsonDecode(result.body);
  var radioJson = jsonDecode(radioMap[0]['public.$radio.$atsign']);
 hamRadio = PublicHamRadio.fromJson(radioJson);

}
