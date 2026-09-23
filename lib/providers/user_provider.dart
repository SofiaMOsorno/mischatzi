import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserProfile? _currentUser;
  bool _isLoading = true;

  UserProfile? get currentUser => _currentUser;
  bool get isUserSelected => _currentUser != null;
  bool get isLoading => _isLoading;

  UserProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    _isLoading = true;
    notifyListeners();
    
    await Future.delayed(const Duration(milliseconds: 500));
    
    final prefs = await SharedPreferences.getInstance();
    final userType = prefs.getString('currentUser');
    
    if (userType == 'sofi') {
      _currentUser = UserProfile.sofi;
    } else if (userType == 'jannis') {
      _currentUser = UserProfile.jannis;
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> selectUser(UserProfile user) async {
    _currentUser = user;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('currentUser', user.displayName.toLowerCase());
    notifyListeners();
  }

  Future<void> logout() async {
    _currentUser = null;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('currentUser');
    notifyListeners();
  }
}