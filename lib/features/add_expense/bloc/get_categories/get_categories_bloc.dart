import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'get_categories_event.dart';
part 'get_categories_state.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  final ExpenseRepository expenseRepository;
  GetCategoriesBloc({required this.expenseRepository})
    : super(GetCategoriesInitial()) {
    on<GetCategories>((event, emit) async {
      emit(GetCategoriesLoading());
      try {
        final categories = await expenseRepository.getCategory();
        emit(GetCategoriesSuccess(categories: categories));
      } catch (e) {
        emit(GetCategoriesFailure(message: e.toString()));
      }
    });
  }
}
