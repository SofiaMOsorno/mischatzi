import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'providers/language_provider.dart';
import 'providers/user_provider.dart';
import 'screens/user_selection_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            title: 'mischatzi',
            theme: themeProvider.themeData,
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'lib/asets/images/main_background.png',
                    fit: BoxFit.cover,
                  ),
                  child ?? const SizedBox.shrink(),
                ],
              );
            },
            home: Builder(
              builder: (context) {
                final userProvider = Provider.of<UserProvider>(context);
                              
                if (userProvider.isLoading) {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }
                
                if (userProvider.isUserSelected) {
                  return const HomeScreen();
                } else {
                  return const UserSelectionScreen();
                }
              },
            ),
            routes: {
              '/home': (context) => const HomeScreen(),
              '/select_user': (context) => const UserSelectionScreen(),
            },
          );
        },
      ),
    );
  }
}