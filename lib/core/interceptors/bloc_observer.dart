import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template my_bloc_observer}
class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    // Add your custom logic to handle the event
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // Add your custom logic to handle the state change
    log('${bloc.runtimeType}, change: $change', name: 'BlocObserver');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    // Add your custom logic to handle errors
    log(
      'bloc: ${bloc.runtimeType}, error: $error, stackTrace: $stackTrace',
      name: 'BlocObserver',
    );
  }
}
