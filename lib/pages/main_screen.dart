import 'package:flutter/material.dart';
import 'package:weekend_course/pages/card_screen.dart';
import 'package:weekend_course/pages/favorite_screen.dart';
import 'package:weekend_course/pages/history_screen.dart';
import 'package:weekend_course/pages/home_screen.dart';
import 'package:weekend_course/pages/privacy_screen.dart';
import 'package:weekend_course/pages/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
 int _selectIndex = 0;

 final List<Widget> pages =  [
   HomeScreen(),
   CardScreen(),
   FavoriteScreen(),
   HistoryScreen(),
   ProfileScreen(),

 ];
 void _showSnackerBar(BuildContext context){
   final snackBar = SnackBar(
     behavior: SnackBarBehavior.floating,
     content: Text("You got notified :)"),
     action: SnackBarAction(label: "View", onPressed: (){}),
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
   );
   ScaffoldMessenger.of(context).showSnackBar(snackBar);
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: const Text("Home Page",
       style: TextStyle(color: Colors.white),
       ),
       foregroundColor: Colors.white,
       actions: [
         IconButton(
             onPressed: ()=> _showSnackerBar(context),
             icon: const Icon(Icons.notifications_active_outlined))
       ],

       backgroundColor: Theme.of(context).colorScheme.primary
     ),
      drawer: NavigationDrawer(
          children: [
            DrawerHeader(
                child:CircleAvatar(child: Text("Name"),)

            ),
            ListTile(
              title: Text("Privacy"),
              leading: Icon(Icons.privacy_tip_outlined),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyScreen()));
              }

            )

        ]),
      body: pages[_selectIndex],
      bottomNavigationBar: NavigationBar(
          indicatorColor: Theme.of(context).colorScheme.primaryContainer,
          elevation: 1,
          height: 80,
          animationDuration:Duration(seconds: 1),
          shadowColor: Colors.red,
          selectedIndex: _selectIndex,
          destinations:  <Widget>[
            NavigationDestination(
                icon: Icon(Icons.home_filled),
                label: 'Home',
                 selectedIcon: Icon(Icons.home_filled, color: Theme.of(context).colorScheme.primary,),),
            NavigationDestination(
                icon: Icon(Icons.add_card),
                label: 'Card',
                selectedIcon: Icon(Icons.add_card, color: Theme.of(context).colorScheme.primary,),),
            NavigationDestination(
                icon: Icon(Icons.favorite_border),
                label: 'Favorite',
                 selectedIcon: Icon(Icons.favorite_border, color: Theme.of(context).colorScheme.primary,),),

            NavigationDestination(
                icon: Icon(Icons.history_edu_outlined),
                label: 'History',
                 selectedIcon: Icon(Icons.history_edu_outlined,color: Theme.of(context).colorScheme.primary,),
            ),
            NavigationDestination(
                icon: Icon(Icons.person),
                label: 'Profile',
                selectedIcon:  Icon(Icons.person,color: Theme.of(context).colorScheme.primary,),
            ),

          ],
      onDestinationSelected: (index){
           setState(() {
             _selectIndex = index;
           });

    },
      ),

    );
  }
}
