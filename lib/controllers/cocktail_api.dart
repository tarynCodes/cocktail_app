import 'package:http/http.dart' as http;
import 'dart:convert';


  Future<String> fetchRandomCocktailName() async {
    final response = await http.get(
        Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> drinks = data['drinks'];

      if (drinks.isNotEmpty) {
        final String strDrink = drinks[0]['strDrink'];
        return strDrink;
      } else {
        return "No cocktails found";
      }
    } else {
      return "Error fetching data";
    }
  }


  Future<String> fetchRandomCocktailImage() async {
    final response = await http.get(
        Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> drinks = data['drinks'];

      if (drinks.isNotEmpty) {
        final String strDrink = drinks[0]['strDrinkThumb'];
        return strDrink;
      } else {
        return "No cocktails found";
      }
    } else {
      return "Error fetching data";
    }
  }