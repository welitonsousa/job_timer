import 'package:bloc/bloc.dart';

final class EventTal {}

class RegisterBloc extends Cubit<EventTal> {
  RegisterBloc() : super(EventTal());
}
