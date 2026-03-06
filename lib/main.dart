import 'package:flutter/material.dart';
import 'package:ilyasa_033_tugas5/app.dart';
import 'package:ilyasa_033_tugas5/providers/registration_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RegistrationProvider(),
      child: const MainApp(),
    ),
  );
}
