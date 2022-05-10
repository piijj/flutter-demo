import 'package:field_flutter/actions/menu_action.dart';
import 'package:field_flutter/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redux/redux.dart';

class _ViewModel {
  final int activeTab;
  final Function(int activeTab) onItemTapped;

  _ViewModel({required this.activeTab, required this.onItemTapped});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      activeTab: store.state.activeTab,
      onItemTapped: (int activeTab) {
        store.dispatch(SwitchActiveTab(activeTab: activeTab));
      },
    );
  }
}

class BottomMenu extends StatefulWidget {
  @override
  BottomMenuState createState() => BottomMenuState();
}

class BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
        converter: (Store<AppState> store) => _ViewModel.fromStore(store),
        builder: (context, _ViewModel vm) => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.house),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.listCheck),
                  label: 'My Tasks',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.map),
                  label: 'Maps',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.bell),
                  label: 'Notifications',
                ),
              ],
              currentIndex: vm.activeTab,
              backgroundColor: Colors.white,
              selectedItemColor: const Color.fromRGBO(18, 120, 236, 1),
              unselectedItemColor: const Color.fromRGBO(102, 112, 148, 1),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              showUnselectedLabels: true,
              iconSize: 14,
              onTap: (int menuIndex) => {vm.onItemTapped(menuIndex)},
            ));
  }
}
