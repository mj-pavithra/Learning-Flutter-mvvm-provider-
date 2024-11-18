import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../view/home_screen.dart';
import '../view/cart_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => CartScreen(),
    ),
  ],
);

