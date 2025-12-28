import 'package:savomart/presentation/screen/cart_screen/cart_screen.dart';
import 'package:savomart/presentation/screen/category_screen/category_screen.dart';
import 'package:savomart/presentation/screen/home_screen/home_screen.dart';
import 'package:savomart/presentation/screen/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
enum Screens { home, categories, cart, profile }

List<Widget> screens = const [
 HomeScreen(),
 CategoryScreen(),
 CartScreen(),
 ProfileScreen()
];
