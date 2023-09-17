import 'package:bloc_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:bloc_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:bloc_app/pages/sign_in/bloc/sign_in_states.dart';
import 'package:bloc_app/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                      child: reusableText("or use ur email account to login"),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 66.h,
                      ),
                      padding: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("email"),
                          SizedBox(
                            height: 4.h,
                          ),
                          buildTextField("put ur email", "email", "user",
                              (value) {
                            context.read<SignInBloc>().add(
                                  EmailEvent(value),
                                );
                          }),
                          reusableText("password"),
                          SizedBox(
                            height: 4.h,
                          ),
                          buildTextField("put ur password", "password", "lock",
                              (value) {
                            context.read<SignInBloc>().add(
                                  PasswordEvent(value),
                                );
                          }),
                        ],
                      ),
                    ),
                    forgotPassword(),
                    buildLogInAndRegButton("login", "login"),
                    buildLogInAndRegButton("register", "register"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
