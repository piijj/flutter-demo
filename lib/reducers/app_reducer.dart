import 'package:field_flutter/actions/menu_action.dart';
import 'package:field_flutter/models/app_state.dart';

AppState appReducer(AppState state, action) {
  if (action is SwitchActiveTab) {
    return AppState(activeTab: action.activeTab);
  }

  return AppState(activeTab: action.activeTab);
}
