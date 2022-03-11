import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  var baseurl = '';
  var token = "";

//post data
  postData(data, apiUrl) async {
    var fullUrl = Uri.parse(baseurl + apiUrl);
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
