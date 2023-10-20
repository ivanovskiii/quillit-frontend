import 'package:flutter/cupertino.dart';
import 'package:quillit_frontend/screens/loginScreen.dart';

void main(){
  runApp(const CupertinoApp(home: LoginScreen(),
  ));
}


// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context){
//     return CupertinoApp(home: CupertinoApp(home: MainPage(), theme: CupertinoThemeData(primaryColor: CupertinoColors.black),));
//   }
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => CupertinoTabScaffold(
//     tabBar: CupertinoTabBar(
//       items: const [
//         BottomNavigationBarItem(
//           label: 'Home', 
//           icon: Icon(CupertinoIcons.home),
//           ),
//           BottomNavigationBarItem(
//           label: 'Search', 
//           icon: Icon(CupertinoIcons.search),
//           ),
//           BottomNavigationBarItem(
//           label: 'Notifications', 
//           icon: Icon(CupertinoIcons.bell),
//           ),
//           BottomNavigationBarItem(
//           label: 'Profile', 
//           icon: Icon(CupertinoIcons.person),
//           ),
//       ],
//     ),
//     tabBuilder: (context, index){
//       return Container();
//     },
//     );
// }
