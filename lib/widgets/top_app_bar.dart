import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/theme_provider.dart';
import '../providers/language_provider.dart';
import '../providers/user_provider.dart';
import '../utils/app_themes.dart';
import '../utils/app_localization.dart';
import 'dropdown_modal.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  final GlobalKey<State> _languageButtonKey = GlobalKey();
  final GlobalKey<State> _themeButtonKey = GlobalKey();
  final GlobalKey<State> _settingsButtonKey = GlobalKey();

  Offset _getButtonPosition(GlobalKey key) {
    final RenderBox renderBox =
        key.currentContext?.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);
    return Offset(offset.dx + renderBox.size.width / 2, offset.dy + renderBox.size.height);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botón de idioma
          _buildIconButton(
            context,
            Icons.language,
            key: _languageButtonKey,
            onPressed: () => _showLanguageModal(context),
          ),
          // Botón de tema
          _buildIconButton(
            context,
            Icons.wb_sunny,
            key: _themeButtonKey,
            onPressed: () => _showThemeModal(context),
          ),
          const SizedBox(width: 200),
          // Botón de configuración
          _buildIconButton(
            context,
            Icons.settings,
            key: _settingsButtonKey,
            onPressed: () => _showSettingsModal(context),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(
    BuildContext context,
    IconData icon, {
    required VoidCallback onPressed,
    GlobalKey? key,
  }) {
    return SizedBox(
      key: key,
      child: IconButton(
        icon: Icon(icon, color: Colors.black, size: 40),
        onPressed: onPressed,
      ),
    );
  }

  Widget _languageButton(
    BuildContext context,
    String code,
    String label,
    String currentLang,
  ) {
    final isSelected = code == currentLang;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: () {
          context.read<LanguageProvider>().setLanguage(code);
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onPrimary,
          minimumSize: const Size(double.infinity, 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.chicle(
            fontSize: 14,
            color: isSelected ? Colors.black : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }


  Widget _themeButton(
    BuildContext context,
    ThemeType themeType,
    String label,
    ThemeType currentTheme,
  ) {
    final isSelected = themeType == currentTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: () {
          context.read<ThemeProvider>().setTheme(themeType);
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? Theme.of(context).colorScheme.tertiary
              : Theme.of(context).colorScheme.secondary,
          minimumSize: const Size(double.infinity, 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.chicle(
            fontSize: 14,
            color: isSelected ? Colors.black : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _showLanguageModal(BuildContext context) {
    final langProvider = context.read<LanguageProvider>();
    final currentLang = langProvider.languageCode;
    final position = _getButtonPosition(_languageButtonKey);

    showDialog(
      context: context,
      builder: (context) => DropdownModal(
        position: position,
        width: 140,
        alignment: 'left', // ← AGREGUÉ ESTO
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _languageButton(context, 'en', 'English', currentLang),
            _languageButton(context, 'es', 'Español', currentLang),
            _languageButton(context, 'de', 'Deutsch', currentLang),
          ],
        ),
      ),
    );
  }

  void _showThemeModal(BuildContext context) {
    final themeProvider = context.read<ThemeProvider>();
    final currentTheme = themeProvider.themeType;
    final position = _getButtonPosition(_themeButtonKey);

    showDialog(
      context: context,
      builder: (context) => DropdownModal(
        position: position,
        width: 140,
        alignment: 'left', // ← AGREGUÉ ESTO
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _themeButton(context, ThemeType.normal, 'Normal', currentTheme),
            _themeButton(context, ThemeType.germany, 'Germany', currentTheme),
            _themeButton(context, ThemeType.mexico, 'Mexico', currentTheme),
          ],
        ),
      ),
    );
  }

  void _showSettingsModal(BuildContext context) {
    final langProvider = context.read<LanguageProvider>();
    final userProvider = context.read<UserProvider>(); // ← LEE AQUÍ AFUERA
    final translate = (String key) =>
        AppLocalization.translate(key, langProvider.languageCode);
    final position = _getButtonPosition(_settingsButtonKey);

    showDialog(
      context: context,
      builder: (context) => DropdownModal(
        position: position,
        width: 180,
        alignment: 'right',
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Full Reset
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  minimumSize: const Size(double.infinity, 42),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  translate('full_reset'),
                  style: GoogleFonts.chicle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            // Notifications toggle
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        translate('notifications'),
                        style: GoogleFonts.chicle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Checkbox(
                      checkColor: Theme.of(context).colorScheme.primary,
                      activeColor: Colors.black,
                      value: true,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              ),
            ),
            // Logout
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context); 
                userProvider.logout();
                Navigator.pushNamedAndRemoveUntil(context, '/select_user', (_) => false);
              },
              icon: const Icon(Icons.meeting_room_rounded, size: 18),
              label: Text(
                translate('logout'),
                style: GoogleFonts.chicle(
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 42),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}