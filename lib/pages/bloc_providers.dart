import 'package:bloc_app/pages/register/bloc/register_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in/bloc/sign_in_blocs.dart';
import 'welcome/bloc/welocme_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          lazy: true,
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => RegisterBloc(),
        )
      ];
}
