import "package:flutter/material.dart";

class CocktailInfo extends StatelessWidget {
  const CocktailInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create your Cocktail!'),
      ),
      body: const Center(
        child: Text('HELLO '),
      ),
    );
  }
}