import 'package:expanzify/app_view.dart';
import 'package:expanzify/features/add_expense/bloc/create_category/create_category_bloc.dart';
import 'package:expanzify/features/add_expense/bloc/get_categories/get_categories_bloc.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CreateCategoryBloc(expenseRepository: FirebaseExpenseRepo()),
        ),
        BlocProvider(
          create: (context) =>
              GetCategoriesBloc(expenseRepository: FirebaseExpenseRepo()),
        ),
      ],
      child: MyAppView(),
    );
  }
}
