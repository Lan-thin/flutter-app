import 'package:yudada_pondmanager_demo_dart/redux/list/list_state.dart';

class AppState{
  ListState listState;
  AppState(this.listState);
  factory AppState.initial(){
    return AppState(ListState.initial());
  }
}