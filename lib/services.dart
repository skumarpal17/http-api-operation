import 'modelClass.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Services{

  Future<ModelClass> fetchAlbum() async {
    final response =
    await http.get(Uri.https('jsonplaceholder.typicode.com', '/posts'));

    // Appropriate action depending upon the
    // server response
    if (response.statusCode == 200) {
      return ModelClass.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }


  Future<ModelClass> postData(String name, String job) async {
    var response = await http.post(Uri.https('jsonplaceholder.typicode.com', '/posts'),
        body: {'title': name, 'body': job});
    var data = response.body;
    print(data);

    if (response.statusCode == 201) {
      String responseString = response.body;
      return ModelClass.fromJson(jsonDecode(responseString));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}