import 'package:isar/isar.dart';

import 'ingredients.dart';


part 'recipe.g.dart';

@Collection()
class Recipe {
  int? id;
  late String label;
  late String url;
  final ingredients = IsarLinks<Ingredients>();
}