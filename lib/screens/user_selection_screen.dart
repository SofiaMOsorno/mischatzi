import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/user_model.dart';
import '../providers/user_provider.dart';

class UserSelectionScreen extends StatelessWidget {
  const UserSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary.withOpacity(0.2),
              Theme.of(context).colorScheme.secondary.withOpacity(0.2),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tarjeta Sofi
                _buildUserCard(context, UserProfile.sofi),
                const SizedBox(height: 30),
                // Barra negra con "Who are you?"
                Container(
                  width: double.infinity,
                  color: const Color.fromARGB(127, 0, 0, 0),
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: Text(
                      'Who are you?',
                      style: GoogleFonts.calistoga(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Tarjeta Jannis
                _buildUserCard(context, UserProfile.jannis),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserCard(BuildContext context, UserProfile user) {
    return GestureDetector(
      onTap: () {
        context.read<UserProvider>().selectUser(user);
        Navigator.of(context).pushReplacementNamed('/home');
      },
      child: Container(
        width: 380,
        height: 250,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.55),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [            
            const SizedBox(height: 25),
            // Nombre del usuario EN MAYÚSCULAS
            Text(
              user.displayName.toUpperCase(),
              style: GoogleFonts.calistoga(
                fontSize: 88,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}