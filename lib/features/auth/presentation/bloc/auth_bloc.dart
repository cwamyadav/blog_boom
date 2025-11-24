import 'package:blogging/features/auth/domain/usecases/user_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBloc({required UserSignUp userSignup})
      : _userSignUp = userSignup,
        super(AuthInitial()) {
    on<AuthSignup>((event, emit) async {
      final res = await _userSignUp(UserSignUpParams(
        email: event.email,
        password: event.password,
        name: event.name,
      ));
      res.fold(
        (failure) => emit(AuthFailure(failure.messages)),// both place same name any want,
        (uid) => emit(AuthSuccess(uid)),
      );
    });
  }
}
