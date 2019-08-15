import 'dart:async';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:yudada_pondmanager_demo_dart/redux/state.dart';
import 'package:yudada_pondmanager_demo_dart/utils/middleware1.dart';
import 'list_action.dart';

ThunkAction<AppState> fetchList = (Store<AppState> store) async {
 HttpUtils.request(
      "pools",
      data: {},
      success: (res){
        print('midddle');
        print(res['data']);
        store.dispatch(FetchListAction(res));
      }
    );
};