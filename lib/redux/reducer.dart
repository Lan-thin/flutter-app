import './state.dart';
import './list/list_reducer.dart';
AppState appReducer(AppState state, dynamic action){
  return AppState(listReducer(state.listState, action));
}