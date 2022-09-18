import 'package:flutter/material.dart';

import '../widget/recipe_list.dart';
import 'insert_recipe_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Recipe App")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InsertRecipeScreen()),
          );
        },
        child: Icon(Icons.add),

      ),
      body: const SafeArea(child: MyRecipesList()),
    );
  }
}


