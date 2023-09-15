import 'package:bloc_app/app_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitStates()) {}
}
