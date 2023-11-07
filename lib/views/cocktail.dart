import "package:flutter/material.dart";

class CocktailPage extends StatelessWidget {
const CocktailPage ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title:const Text('cocktails')),
      body: const Center(),
    );
  }
}