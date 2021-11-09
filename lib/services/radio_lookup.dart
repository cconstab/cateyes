import 'package:http/http.dart' as http;

lookupRadio(String atsign, String hamradio) async {

return http.get(Uri.parse('https://wavi.ng/api?atp=$hamradio.ai6bh@$atsign&html=true'));
}
