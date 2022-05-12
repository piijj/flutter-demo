class AppState {
  final int activeTab;
  final int myTaskTab;

  AppState({required this.activeTab, required this.myTaskTab});

  AppState.initialState()
      : activeTab = 0,
        myTaskTab = 0;
}
