import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/me_model.dart';

class MeState {
  Me? me;

  MeState(this.me);
}

class MeEvent {}

class MeBloc extends Bloc<MeEvent, MeState> {
  MeBloc() : super(MeState(Me.getInstance()));

  @override
  Stream<MeState> mapEventToState(MeEvent event) async* {
    yield MeState(Me.getInstance());
  }
}
