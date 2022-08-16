import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> getApts() async {
  // Uri url = Uri.encodeFull("http://13.209.7.179:8000/getApts");
  var getUri = Uri(
    scheme: 'http',
    host: '3.34.48.212',
    port: 8000,
    path: '/getApts',
  );

  // print(getUri);

  var response = await http.get(getUri);
  int statusCode = response.statusCode;
  if (statusCode == 200) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  } else {
    return ['null'];
  }
}
