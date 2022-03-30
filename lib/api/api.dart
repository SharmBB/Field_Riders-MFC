import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  var baseurl = '';
  var token ;
  // Auth Api
  var _urlAuth = 'http://mangakiku-api.moodfor.codes/api/';

//post data
  postData(data, apiUrl) async {
    var fullUrl = Uri.parse(baseurl + apiUrl);
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  //Login api
  authData(data, apiUrl) async {
    var fullUrl = Uri.parse(_urlAuth + apiUrl);
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
