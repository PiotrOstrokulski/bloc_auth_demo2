part of 'data_cubit.dart';

@immutable
abstract class DataState {}

class DataInitial extends DataState {}

class DataLoaded extends DataState {
  DataLoaded(this.products);
  final List<Product> products;
}
