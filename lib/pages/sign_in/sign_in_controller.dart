import 'package:bloc_app/common/widgets/flutter_toast.dart';
import 'package:bloc_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSigIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "u need to fill email");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "u need to fill password");
          return;
        }
        try {
          final credential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
          if (credential.user != null) {
            toastInfo(msg: "u do exist");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
            return;
          }
          if (credential.user == null) {
            toastInfo(msg: "u do not exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "u need to verify ur email");
            return;
          }
          var user = credential.user;
          if (user != null) {
          } else {
            toastInfo(msg: "u do not belong to the matrix");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            toastInfo(msg: "u do not exist");
          } else if (e.code == "wrong-password") {
            toastInfo(msg: "u need to remember ur password");
          } else if (e.code == "invalid-email") {
            toastInfo(msg: "u need to use ur best email");
          }
        }
      }
    } catch (e) {}
  }
}
