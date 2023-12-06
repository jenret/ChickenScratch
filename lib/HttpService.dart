import 'package:http/http.dart' as http;

class HttpService {
  // remember to change to actual api
  final String userAPI = 'https://www.pictureofhotdog.com/home-margot';

  //Future<List<Note>> getUserNotes(String userId);

  Future<String> checkConnected() async {
    final response = await http.get(Uri.parse(userAPI));

    if (response.statusCode == 200) {
      return 'Connected to API';
    } else {
      throw "Unable to connect to API";
    }
  }

  // Future<List<Note>> getUserNotes(String userId) async {
  //   //final notes = await call api get user notes
  //
  //   return notes;
  // }
}