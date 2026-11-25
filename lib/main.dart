import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const LittleHafizApp());
}
