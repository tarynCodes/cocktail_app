import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchRandomCocktailName() async {
  final response = await http
      .get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));

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

Future<String> fetchCocktailInfo(String cocktailName) async {
  try {
    final response = await http.get(Uri.parse(
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$cocktailName'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> drinks = data['drinks'];

      if (drinks.isNotEmpty) {
        final Map<String, dynamic> cocktail = drinks[0];
        final String strDrink = cocktail['strDrink'];

        final List<dynamic> ingredients = [
          cocktail['strIngredient1'],
          cocktail['strIngredient2'],
          cocktail['strIngredient3'],
          cocktail['strIngredient4'],
          cocktail['strIngredient5'],
          cocktail['strIngredient6'],
          cocktail['strIngredient7'],
          cocktail['strIngredient8'],
          cocktail['strIngredient9'],
          cocktail['strIngredient10'],
        ]
            .where((ingredient) => ingredient != null && ingredient.isNotEmpty)
            .toList();

        final List<dynamic> measures = [
          cocktail['strMeasure1'],
          cocktail['strMeasure2'],
          cocktail['strMeasure3'],
          cocktail['strMeasure4'],
          cocktail['strMeasure5'],
          cocktail['strMeasure6'],
          cocktail['strMeasure7'],
          cocktail['strMeasure8'],
          cocktail['strMeasure9'],
          cocktail['strMeasure10'],
        ].where((measure) => measure != null && measure.isNotEmpty).toList();

        final String strInstructions = cocktail['strInstructions'];

        List<String> ingredientsWithMeasures = List.generate(
          ingredients.length,
          (index) => "${measures[index]} ${ingredients[index]}",
        );

        String ingredientsString = ingredientsWithMeasures.join(', ');

        return "$strDrink, $ingredientsString, $strInstructions";
      } else {
        return "No cocktails found";
      }
    } else {
      return "HTTP request failed with status: ${response.statusCode}";
    }
  } catch (error) {
    return "Error fetching data: $error";
  }
}
