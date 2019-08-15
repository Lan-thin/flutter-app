import 'list_action.dart';
import 'list_state.dart';

ListState listReducer(ListState pre, dynamic action){
  if(action is FetchListAction){
    return ListState(true, action.poolInfo,pre.selected);
  }
  if(action is SelectItemAction){
    return ListState(pre.isInit, pre.poolInfo, action.selected);
  }
  return pre;
}