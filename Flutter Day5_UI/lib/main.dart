import 'package:flutter/material.dart';
import 'package:lab_flutter_day5/final_project_shop_ui/home.dart';
import 'package:lab_flutter_day5/final_project_shop_ui/product_details.dart';
import 'package:lab_flutter_day5/final_project_shop_ui/user_profile.dart';
import 'package:lab_flutter_day5/task1.dart';
import 'package:lab_flutter_day5/task10.dart';
import 'package:lab_flutter_day5/task2.dart';
import 'package:lab_flutter_day5/task3.dart';
import 'package:lab_flutter_day5/task4.dart';
import 'package:lab_flutter_day5/task5.dart';
import 'package:lab_flutter_day5/task6.dart';
import 'package:lab_flutter_day5/task7.dart';
import 'package:lab_flutter_day5/task8.dart';
import 'package:lab_flutter_day5/task9.dart';

void main() {
  runApp(MaterialApp(home: ActionCard()));
}

//task1
ProfileCard profileCard = ProfileCard();

//task2
ContactList contactList = ContactList();

//task3
ProductGrid productGrid = ProductGrid();

//task4
HorizontalCategory horizontalCategory = HorizontalCategory();

//task5
TravelCard travelCard = TravelCard();

//task6
RecipeCard recipeCard = RecipeCard();

//task7
ProductList productList = ProductList();

//task8
DashboardGrid dashboardGrid = DashboardGrid();

//task9
AboutMe aboutMe = AboutMe();

//task10
ActionCard actionCard = ActionCard();

ProductDetailsPage product = ProductDetailsPage(
  image: 'assets/images/smartphone.jpg',
  title: 'Smart Phone',
  description: 'phone with 128gb , fast charging',
  price: '\$1000',
);

HomePage home = HomePage();
ProfilePage profile = ProfilePage();
