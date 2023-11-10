import 'package:flutter/material.dart';
import 'package:cocktail_app/models/cocktail_api.dart';

class CocktailInfo extends StatefulWidget {
  final String cocktailName;

  const CocktailInfo({Key? key, required this.cocktailName}) : super(key: key);

  @override
  State<CocktailInfo> createState() => _CocktailInfoState();
}

class _CocktailInfoState extends State<CocktailInfo> {
  String cocktailInfo = '';

  @override
  void initState() {
    super.initState();
    fetchAndSetCocktailInfo(widget.cocktailName);
  }

  Future<void> fetchAndSetCocktailInfo(String cocktailName) async {
    try {
      String result = await fetchCocktailInfo(cocktailName);
      setState(() {
        cocktailInfo = result;
      });
    } catch (error) {
      setState(() {
        cocktailInfo = "Error fetching data: $error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Make Your cocktail"),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Text(
            cocktailInfo,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
