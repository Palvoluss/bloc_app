import 'package:bloc_app/pages/register/bloc/register_blocs.dart';
import 'package:bloc_app/pages/register/bloc/register_events.dart';
import 'package:bloc_app/pages/register/bloc/register_states.dart';
import 'package:bloc_app/pages/register/register_controler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widget.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("sign up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: reusableText("join the matrix, give us ur info"),
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
                          reusableText("username"),
                          buildTextField("put ur username", "email", "user",
                              (value) {
                            context.read<RegisterBloc>().add(
                                  UserNameEvent(value),
                                );
                          }),
                          reusableText("email"),
                          buildTextField("put ur email", "email", "user",
                              (value) {
                            context.read<RegisterBloc>().add(
                                  EmailEvent(value),
                                );
                          }),
                          reusableText("password"),
                          buildTextField("put ur password", "password", "lock",
                              (value) {
                            context.read<RegisterBloc>().add(
                                  PasswordEvent(value),
                                );
                          }),
                          reusableText("confirm password"),
                          buildTextField(
                              "ensure u've put ur password", "password", "lock",
                              (value) {
                            context.read<RegisterBloc>().add(
                                  RePasswordEvent(value),
                                );
                          }),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25.h),
                      child: reusableText(
                          "u're joining the matrix, u'll accept everything"),
                    ),
                    buildLogInAndRegButton("sign up", "login", () {
                      // Navigator.of(context).pushNamed("register");
                      RegisterController(context: context)
                          .handleEmailRegister();
                    }),
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
