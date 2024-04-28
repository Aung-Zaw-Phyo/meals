import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriateMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriateMealsNotifier() : super([]);
  bool toggleMealFavoriateStatus(Meal meal) {
    final mealIsFavoriate = state.contains(meal);

    if (mealIsFavoriate) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriateMealsProvider =
    StateNotifierProvider<FavoriateMealsNotifier, List<Meal>>((ref) {
  return FavoriateMealsNotifier();
});
