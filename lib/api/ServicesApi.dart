import 'package:http/http.dart' as http;

class ServicesApi {
  Future<void> _displayPembimbing() async {
    var url = Uri.http("localhost", "/scr_wikrama/display_ps.php", {"q": "{http}"});
    var response = await http.get(url);

    print(response.body);
  }
}
