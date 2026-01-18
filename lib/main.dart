import 'package:bloc/bloc.dart';
import 'package:expanzify/app.dart';
import 'package:expanzify/bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}
