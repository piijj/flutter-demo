import 'package:field_flutter/actions/menu_action.dart';
import 'package:field_flutter/colors.dart';
import 'package:field_flutter/models/models.dart';
import 'package:field_flutter/selectors/app_selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_redux_hooks/flutter_redux_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomMenu extends HookWidget {
  const BottomMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dispatch = useDispatch<AppState>();
    final activeTabIndex =
        useSelector<AppState, int>((state) => activeTabSelector(state));
    return BottomNavigationBar(
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
      currentIndex: activeTabIndex,
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primaryPressed,
      unselectedItemColor: AppColors.label,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      showUnselectedLabels: true,
      iconSize: 14,
      onTap: (int menuIndex) => dispatch(SwitchActiveTab(activeTab: menuIndex)),
    );
  }
}
