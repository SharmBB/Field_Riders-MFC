import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  var baseurl = '';
   var baseur_1 = '';
  var token;
  // Auth Api
  var _urlAuth = 'https://dcaapi.moodfor.codes/rider/';
  var _urlLeaderBoard = 'https://dcaapi.moodfor.codes/';

//post data
  postData(data, apiUrl) async {
    var fullUrl = Uri.parse(_urlAuth + apiUrl);
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

//Forget
  updatePassword(data, apiUrl) async {
    var fullUrl = Uri.parse(_urlAuth + apiUrl);
    return await http.put(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  //LEaderBoard
  getLeaderBoard(apiUrl) async {
    var fullUrl = Uri.parse(_urlLeaderBoard + apiUrl);
    return await http.get(
      fullUrl,
    );
  }

//   _getToken() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     var token = localStorage.getString('token');
//     return token;
//   }

}
