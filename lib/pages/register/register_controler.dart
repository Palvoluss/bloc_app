import 'package:bloc_app/common/widgets/flutter_toast.dart';
import 'package:bloc_app/pages/register/bloc/register_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBlocs>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "username can not be empty");
      return;
    }

    if (email.isEmpty) {
      toastInfo(msg: "email name can not be empty");
      return;
    }

    if (password.isEmpty) {
      toastInfo(msg: "password name can not be empty");
      return;
    }

    if (rePassword.isEmpty) {
      toastInfo(msg: "rePassword name can not be empty");
      return;
    }

    try {
      final credenital = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credenital.user != null) {
        await credenital.user?.sendEmailVerification();
        await credenital.user?.updateDisplayName(userName);
        toastInfo(msg: "check ur mailbox");

        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: "weak-password");
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: "email-already-in-use");
      } else if (e.code == "invalid-email") {
        toastInfo(msg: "email-already-in-use");
      }
    }
  }
}
