import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomMenu extends StatefulWidget {
  // ignore: public_member_api_docs
  const BottomMenu({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  BottomMenuState createState() => BottomMenuState();
}

class BottomMenuState extends State<BottomMenu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 1:
        {
          Navigator.pushNamed(context, '/tasks');
        }
        break;
      case 2:
        {
          Navigator.pushNamed(context, '/maps');
        }
        break;
      default:
        {
          Navigator.pushNamed(context, '/');
        }
        break;
    }

    setState(() {
      debugPrint('$index');
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      currentIndex: _selectedIndex,
      backgroundColor: Colors.white,
      selectedItemColor: const Color.fromRGBO(18, 120, 236, 1),
      unselectedItemColor: const Color.fromRGBO(102, 112, 148, 1),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      showUnselectedLabels: true,
      iconSize: 14,
      onTap: _onItemTapped,
    );
  }
}
