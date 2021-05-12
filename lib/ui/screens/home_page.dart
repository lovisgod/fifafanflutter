
import 'package:sportfan/domain/menu_items.dart';
import 'package:sportfan/ui/screens/people.dart';
import 'package:sportfan/ui/screens/post_page.dart';
import 'package:sportfan/ui/screens/profile.dart';
import 'package:sportfan/ui/screens/groups.dart';
import 'package:sportfan/ui/screens/updateProfile.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'SPORTFANS',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (result) {
              _performSelection(result, context);
            },
            padding: EdgeInsets.zero,
            // initialValue: choices[_selection],
            itemBuilder: (BuildContext context) {
              return choices.map((String choice) {
                return  PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );}
              ).toList();
            },
          )
        ],
      ),
      body: FifaFanStateFulWidget(),
    );
  }

  void _performSelection(String value, BuildContext context) {
     if (value == "Update Profile") {
       Navigator.push(
         context,
         MaterialPageRoute(builder: (context) => UpdateProfile()),
       );
     }
     if (value == "Search a User") {

     }
     if (value == "Search Group") {

     }  if (value == "Log-Out") {

     }
  }
}

/// This is the stateful widget that the main application instantiates.
class FifaFanStateFulWidget extends StatefulWidget {
  FifaFanStateFulWidget({Key key}) : super(key: key);

  @override
  _FifaFanStateFulWidgetState createState() => _FifaFanStateFulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _FifaFanStateFulWidgetState extends State<FifaFanStateFulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    PostPage(),
    Profile(),
    People(),
    GroupsListPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          children:  _widgetOptions,
          index: _selectedIndex,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wc),
            title: Text('People'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Groups'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
