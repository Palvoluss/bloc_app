import 'package:bloc_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:bloc_app/pages/sign_in/bloc/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    //handlers
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
  }
//methods

  void _emailEvent(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
