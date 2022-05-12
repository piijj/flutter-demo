import 'package:field_flutter/actions/menu_action.dart';
import 'package:field_flutter/models/app_state.dart';

AppState appReducer(AppState state, action) {
  if (action is SwitchActiveTab) {
    return AppState(activeTab: action.activeTab, myTaskTab: state.myTaskTab);
  }

  if (action is SwitchMyTaskTab) {
    return AppState(activeTab: state.activeTab, myTaskTab: action.myTaskTab);
  }

  return state;
}
