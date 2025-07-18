import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../services/auth_service.dart';

/// Provider for managing authentication state
class AuthProvider with ChangeNotifier {
  static const String _userKey = 'current_user';
  static const String _isLoggedInKey = 'is_logged_in';
  
  final AuthService _authService = AuthService();
  
  User? _currentUser;
  bool _isLoading = false;
  String? _errorMessage;
  
  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _currentUser != null;
  
  /// Initialize authentication state from shared preferences
  Future<void> initializeAuth() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool(_isLoggedInKey) ?? false;
      
      if (isLoggedIn) {
        final userEmail = prefs.getString('user_email');
        final userName = prefs.getString('user_name');
        final userRole = prefs.getString('user_role');
        final userDepartment = prefs.getString('user_department');
        
        if (userEmail != null && userName != null) {
          _currentUser = User(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            name: userName,
            email: userEmail,
            role: userRole ?? 'Employee',
            department: userDepartment ?? 'General',
          );
        }
      }
    } catch (e) {
      _errorMessage = 'Failed to initialize authentication';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Login with email and password
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();
    
    try {
      final user = await _authService.login(email, password);
      _currentUser = user;
      
      // Save to shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_isLoggedInKey, true);
      await prefs.setString('user_email', user.email);
      await prefs.setString('user_name', user.name);
      await prefs.setString('user_role', user.role);
      await prefs.setString('user_department', user.department);
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
  
  /// Logout current user
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      await _authService.logout();
      _currentUser = null;
      
      // Clear shared preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_isLoggedInKey);
      await prefs.remove('user_email');
      await prefs.remove('user_name');
      await prefs.remove('user_role');
      await prefs.remove('user_department');
      
    } catch (e) {
      _errorMessage = 'Failed to logout';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
  
  /// Get demo credentials for testing
  List<Map<String, String>> getDemoCredentials() {
    return _authService.getDemoCredentials();
  }
}
