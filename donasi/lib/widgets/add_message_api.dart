import 'dart:convert';
import 'package:donasi/models/all_message.dart';
import 'package:http/http.dart' as http;

Future<dynamic> addNewMessage(Fields fields) async {
  var url = Uri.parse('http://127.0.0.1:8000/donasi/add-message-api');
  var response = await http.post(
      url,
      headers: {
        "Access-Control_Allow_Origin": "*",
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(fields)
  );
  return jsonDecode(response.body)["success"];
}