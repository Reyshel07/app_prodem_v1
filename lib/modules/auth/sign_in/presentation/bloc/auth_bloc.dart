import 'package:app_prodem_v1/core/networking/base_api_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/entities.dart';
import '../../domain/repositories/repositories.dart';
import '../../../../../utils/secure_hive.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SignInResponseRepository repository;
  AuthBloc(this.repository) : super(AuthInitial()) {
    on<SignInEvent>(signIn);
  }

  Future<void> signIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await repository.signIn(
        event.username,
        event.password,
        event.chanel,
        event.aditionalItems,
      );

      final token = response.data!.token;
      if (token.isNotEmpty) {
        await SecureHive.writeToken(token);
      }

      emit(AuthSuccess("Inicio de sesión exitoso"));
    } on BaseApiException catch (error) {
      switch (error.key) {
        case "api_logic_error":
          emit(AuthError(error.message));
        case "dio_unexpected":
          emit(AuthError("Ocurrio un error, no tiene internet"));
      }
    }
  }
}
