class CategoryModel {
  final String image, name;

  CategoryModel({required this.image, required this.name});
}

List<CategoryModel> myCategories = [
  CategoryModel(
    image: 'assets/ramen.png',
    name: 'Ramen',
  ),
  CategoryModel(
    image: 'assets/burger.png',
    name: 'Burger',
  ),
  CategoryModel(
    image: 'assets/salad.png',
    name: 'Salad',
  ),
  CategoryModel(
    image: 'assets/pancake.png',
    name: 'Waffle',
  ),
];