import 'quotesjson.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
Future<quotesjson> fetchPost() async {
  final response = await http.get(Uri.parse('https://dummyjson.com/quotes'));

  if (response.statusCode == 200) {
    // If the call to the server was successful (returns OK), parse the JSON.
    return quotesjson.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful (response was unexpected), it throw an error.
    throw Exception('Failed to load post');
  }
}