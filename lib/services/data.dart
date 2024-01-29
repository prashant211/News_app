import 'package:news_app/models/catgeory_model.dart';
List<CategoryModel> getCategories(){

  List<CategoryModel> category = [];

  CategoryModel categoryModel =  CategoryModel();

  categoryModel.categoryName = 'Business';
  categoryModel.image = 'assets/images/buisness.jpg';
  category.add(categoryModel);

   categoryModel =  CategoryModel();

  categoryModel.categoryName = 'Entertainment';
  categoryModel.image = 'assets/images/entertainment.jpg';
  category.add(categoryModel);

   categoryModel =  CategoryModel();

  categoryModel.categoryName = 'General';
  categoryModel.image = 'assets/images/general.jpg';
  category.add(categoryModel);

   categoryModel =  CategoryModel();

  categoryModel.categoryName = 'Health';
  categoryModel.image = 'assets/images/health.jpg';
  category.add(categoryModel);

   categoryModel =  CategoryModel();

  categoryModel.categoryName = 'Sports';
  categoryModel.image = 'assets/images/sports.jpg';
  category.add(categoryModel);


  return category;

}