import 'package:flutter/material.dart';

class CocktailNameWidget extends StatefulWidget {
  final String cocktailName;
  
  CocktailNameWidget({required this.cocktailName});

  @override
  _CocktailNameWidgetState createState() => _CocktailNameWidgetState();
}

class _CocktailNameWidgetState extends State<CocktailNameWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.cocktailName,
      style: TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
    );
  }
}