import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../data/isar_service.dart';
import '../data/recipe.dart';
import '../screens/recipe_details.dart';

class MyRecipesList extends StatefulWidget {
  const MyRecipesList({Key? key}) : super(key: key);

  @override
  _MyRecipesListState createState() => _MyRecipesListState();
}

class _MyRecipesListState extends State<MyRecipesList> {
  final service = IsarService();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: StreamBuilder<List<Recipe>>(
            stream: service.watchRecipe(),
            builder: (context, AsyncSnapshot<List<Recipe>> snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                final recipes = snapshot.data ?? [];
                if (recipes.isEmpty) {
                  return const Center(
                      child: Text(
                    "No Recipes to show \npress + button to add recipe ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ));
                }

                return ListView.builder(
                    itemCount: recipes.length,
                    itemBuilder: (BuildContext context, int index) {
                      final recipe = recipes[index];
                      return InkWell(
                        child: SizedBox(
                          child: Slidable(
                            actionPane: const SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            actions: <Widget>[
                              IconSlideAction(
                                  caption: 'Delete Recipe',
                                  color: Colors.white,
                                  foregroundColor: Colors.black,
                                  iconWidget: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onTap: () => service.deleteRecipe(recipe)),
                            ],
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                  caption: 'Delete Ingredients',
                                  color: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  iconWidget: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onTap: () => service.deleteRecipeIngredients(recipe)),
                            ],
                            child: Card(
                              elevation: 1.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: CachedNetworkImage(
                                        imageUrl: recipe.url ,
                                        height: height * 0.2,
                                        width: width * 0.2,
                                        fit: BoxFit.cover),
                                    title: Text(recipe.label ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                           await recipe.ingredients.load();
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => RecipeDetails(recipe: recipe)),);
                        },
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));

  }
}
