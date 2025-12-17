import 'package:flutter/material.dart';
import 'package:own_starbucks/app/app.dart';
import 'package:own_starbucks/bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => App());
}
