import 'package:flutter/material.dart';
import '../widgets/top_app_bar.dart';
import '../widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sin background color - queremos que se vea la imagen
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true, // Permite que el body se extienda detrás del AppBar
      extendBody: true, // Permite que el body se extienda detrás del BottomNavBar
      
      // Imagen de fondo
      body: Stack(
        children: [
          /*
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/main_background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          */
          // Contenido de la pantalla (con espacios para AppBar y BottomNavBar)
          SafeArea(
            bottom: false, // No queremos SafeArea abajo para que el body vaya hasta abajo
            child: Column(
              children: [
                // Contenido scrolleable
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          'Home Screen',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: TopAppBar(),
      ),
      
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
      ),
    );
  }
}