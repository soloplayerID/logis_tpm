import 'package:flutter/material.dart';

import '../screen/home_screen.dart';
import '../screen/login_screen.dart';

final routes = {
  '/': (BuildContext context) => const Login(),
  '/home': (BuildContext context) => const Home(),
};
