import '../main.dart';

class Me {
  static Me? _me;
  static bool isUpdating = false;

  static Me? getInstance() {
    _me ??= Me();
    return _me;
  }

  static setInstance(Me? me) {
    _me = me;
    //BlocProvider.of<MeBloc>(MyApp.navigatorKey.currentState!.context).add(MeEvent());
  }

  static isLogged() {
    return sharedPreferences.getBool('user_saved') ?? false;
  }
}
