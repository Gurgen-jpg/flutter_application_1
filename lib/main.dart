import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/bloc/news/news_bloc.dart';
import 'package:flutter_application_1/screens/news/news_screen.dart';
import 'package:flutter_application_1/services/news_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => 
        NewsBloc(
          NewsService(
            Dio()))..add(LoadNews()),
      child: const MaterialApp(home: NewsScreen()),
  );
  }
}
