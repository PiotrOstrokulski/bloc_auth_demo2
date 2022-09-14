import 'package:bloc/bloc.dart';
import 'package:bloc_auth_demo/get_it.dart';
import 'package:bloc_auth_demo/models/mocked_repo.dart';
import 'package:bloc_auth_demo/models/product.dart';
import 'package:meta/meta.dart';

part 'data_state.dart';

class DataCubit extends Cubit<DataState> {
  DataCubit() : super(DataInitial());

  MockedRepo repo = locator.get<MockedRepo>();

  void loadData(String token) {
    //token gdyby byl potrzebny  ¯\_(ツ)_/¯
    final products = repo.readProducts();
    emit(DataLoaded(products));
  }
}
