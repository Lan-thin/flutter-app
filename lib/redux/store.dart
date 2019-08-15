import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import './state.dart';
import './reducer.dart';

Store<AppState> createStore(){
  return Store(appReducer,initialState: AppState.initial(), middleware: [
    thunkMiddleware
  ]);
}