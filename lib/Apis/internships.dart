import 'package:http/http.dart' as http;

class Internships {
  List<Map<String, dynamic>> Internshipslist = [];

  Future<dynamic> getdata() async {
    final response = await http
        .get(Uri.parse("https://internshala.com/flutter_hiring/search"));

    return response.body;
  }
}
