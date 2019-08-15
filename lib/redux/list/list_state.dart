import 'dart:collection';
class ListState{
  bool _init = false;
  Map<String, dynamic> _poolInfo = {};
  String _selected = '';
  ListState(
    this._init,
    this._poolInfo,
    this._selected,
    
  );
  factory ListState.initial(){
    return ListState(false, {}, "未选中");
  }
  bool get isInit => _init;
  Map<String, dynamic> get poolInfo => _poolInfo;
  // UnmodifiableListView<String> get list => UnmodifiableListView(_list);
  String get selected => _selected;
}