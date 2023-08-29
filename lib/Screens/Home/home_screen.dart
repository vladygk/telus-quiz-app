import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telus_character_quiz/Screens/Home/nav_state.dart';
import 'package:telus_character_quiz/shared/routes.dart';
import 'package:telus_character_quiz/shared/theme.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<NavState>(context);

    return Scaffold(
      appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: ImageIcon(
              AssetImage(
                'assets/logo.png',
              ),
            ),
          ),
          title: const Center(
              child: Text(
            'Telus personality quiz',
            style: TextStyle(fontSize: 21),
          ))),
      body: navPages[state.currentNavIndex],
      bottomNavigationBar: NavBar(),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<NavState>(context);
    return BottomNavigationBar(
      currentIndex: state.currentNavIndex,
      onTap: (index) {
        state.currentNavIndex = index;
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home page'),
    );
  }
}



//  Center(
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0), color: green),
//             height: 100,
//             width: 260,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Welcome to the Telus quiz',
//                   style: TextStyle(fontSize: 20),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 10,
//                   ),
//                   child: ElevatedButton(
//                     child: const Text(
//                       'Start  quiz!',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     onPressed: () {},
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//         //bottomNavigationBar:
//       ),