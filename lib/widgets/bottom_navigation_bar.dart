import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap, 
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.transparent,
      elevation: 0, // Sin sombra
      selectedItemColor: Theme.of(context).colorScheme.tertiary,
      unselectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(size: 42), // Iconos más grandes
      unselectedIconTheme: const IconThemeData(size: 42), // Iconos más grandes
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_frames_outlined),
          // house_rounded, house_sharp
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          //icon: Icon(Icons.theaters_sharp),
          label: '',
        ),
        BottomNavigationBarItem(
          //icon: Icon(Icons.view_list_rounded),
          icon: Icon(Icons.list_alt_rounded),
          label: '',
        ),
      ],
    );
  }
}
//volunteer_activism ?? whatshot_rounded ?? wc