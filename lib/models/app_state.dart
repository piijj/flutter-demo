class AppState {
  final int activeTab;

  AppState({required this.activeTab});

  AppState.initialState() : activeTab = 0;
}
