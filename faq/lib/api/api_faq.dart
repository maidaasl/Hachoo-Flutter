import 'dart:convert';
import 'package:faq/models/question.dart';
import 'package:http/http.dart' as http;

Future<List<Question>?> fetchQuestion() async {
  final response = await http.get(Uri.parse('https://hachoo.herokuapp.com/Faq/json'));

  if (response.statusCode == 200) {
    return parseItem(response.body);
  } else {
    throw Exception('Failed to load Get');
  }
}

List<Question>? parseItem(String responseBody) {
  final List<Question> questions = [];
  final parsed = jsonDecode(responseBody) as List<dynamic>;
  for (var e in parsed) {
    questions.add(Question.fromJson(e));
  }

  return questions;
}
