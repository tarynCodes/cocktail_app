import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> fetchRandomCocktail() async {
  final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));
  
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load cocktail');
  }
}