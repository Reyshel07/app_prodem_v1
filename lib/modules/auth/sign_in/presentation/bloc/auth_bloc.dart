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

      // Guardar token en Hive cifrado si viene en la respuesta
      final token = response.data.token;
      if (token.isNotEmpty) {
        await SecureHive.writeToken(token);
      }

      emit(AuthSuccess("Inicio de sesión exitoso"));
    } catch (e) {
      emit(AuthError('error'));
    }
  }
}
