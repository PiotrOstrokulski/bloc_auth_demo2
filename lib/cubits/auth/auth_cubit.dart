import 'package:bloc/bloc.dart';
import 'package:bloc_auth_demo/get_it.dart';
import 'package:bloc_auth_demo/models/mocked_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  MockedRepo repo = locator.get<MockedRepo>();

  void authorize(String login, String password) {
    emit(AuthorizationLoading());
    final authorization = repo.authorization(login, password);
    if (authorization) {
      emit(Authorized());
    } else {
      emit(Unauthorized());
    }
  }
}
