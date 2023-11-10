import 'package:flutter/material.dart';

class CocktailNameWidget extends StatefulWidget {
  final String cocktailName;
  
  const CocktailNameWidget({super.key, required this.cocktailName});

  @override
  // ignore: library_private_types_in_public_api
  _CocktailNameWidgetState createState() => _CocktailNameWidgetState();
}

class _CocktailNameWidgetState extends State<CocktailNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.cocktailName,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
    );
  }
}