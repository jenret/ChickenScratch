import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpService {
  // remember to change to actual api
  final String userAPI = 'https://www.pictureofhotdog.com/home-margot';

  Future<String> checkConnected() async {
    final response = await http.get(Uri.parse(userAPI));

    if (response.statusCode == 200) {
      return 'Connected to API';
    } else {
      throw "Unable to connect to API";
    }
  }
}