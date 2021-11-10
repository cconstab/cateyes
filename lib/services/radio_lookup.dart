import 'package:http/http.dart' as http;

Future<String> lookupRadio(String atsign, String hamradio) async {
  print('waiting');
  http.Response result = await 
  http.get(Uri.parse("https://wavi.ng/api?atp=public.ic7100.ai6bh@ai6bh"),
      headers: {"Accept": "application/json",
                "Access-Control-Allow-Origin": "*",
                });
  // Uri.parse('https://wavi.ng/api?atp=public.$hamradio.ai6bh@$atsign&html'));
  print(result.body);
  
  return result.body;
}
