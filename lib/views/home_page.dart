import 'package:cocktail_app/views/cocktail_info_page.dart';
import "package:flutter/material.dart";
import 'package:cocktail_app/models/cocktail_api.dart';
import 'package:cocktail_app/controllers/cocktail_viewer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String cocktailName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 200),
            const Text(
              "[ Taryns_Cocktails ]",
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CocktailInfo(cocktailName: cocktailName)),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(top: 150),
                child: CocktailNameWidget(cocktailName: cocktailName),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Text(
                "Like the Sound of this? Click on the cocktail for more info!",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 70),
              height: 75,
              child: ElevatedButton(
                onPressed: () async {
                  final newCocktailName = await fetchRandomCocktailName();
                  setState(() {
                    cocktailName = newCocktailName;
                  });
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.indigo),
                ),
                child: const Text("Click for your Next Favourite Cocktail!"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
