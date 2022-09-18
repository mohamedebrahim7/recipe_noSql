import 'package:isar/isar.dart';
import 'package:isar_db_tutorial/data/ingredients.dart';
import 'package:isar_db_tutorial/data/recipe.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  late Future<Isar> _db;

  IsarService() {
    _db = openDB();
  }


  Future<void> insertRecipe(Recipe newRecipe) async {
    final isar = await _db;
    await isar.writeTxn((isar) async {
      newRecipe.id = await isar.recipes.put(newRecipe);// insert & update
      //dont forget to call save and load methodes for IsarLinks
      await newRecipe.ingredients.save();
    });  }




  Stream<List<Recipe>> watchRecipe() async* {
    final isar = await _db;
    yield* isar.recipes.where().watch(initialReturn: true);
    }

  Future<void> cleanDb() async {
    final isar = await _db;
    await isar.writeTxn((isar) => isar.clear());
  }

  Future<void> deleteRecipe(Recipe recipe) async {
    final isar = await _db;
    await isar.writeTxn((isar) => isar.recipes.delete(recipe.id!));
  }

  Future<void> deleteRecipeIngredients(Recipe recipe) async {
    final isar = await _db;
    await isar.writeTxn((isar) async {
      await recipe.ingredients.reset();
    });
  }


  Future<Isar> openDB() async {
    final dir = await getApplicationSupportDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
       schemas: [RecipeSchema,IngredientsSchema],
        directory: dir.path
      );
    }

    return Future.value(Isar.getInstance());
  }
}
