import 'dart:async';
import '../models/user.dart';
import '../utils/validators.dart';

class AuthService {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  User? _currentUser;
  User? get currentUser => _currentUser;

  // Mock user data for demonstration
  final Map<String, String> _mockUsers = {
    'admin@worksphere.com': 'Admin123!',
    'hr@worksphere.com': 'Hr123!',
    'employee@worksphere.com': 'Employee123!',
    'manager@worksphere.com': 'Manager123!',
  };

  Future<User> login(String email, String password) async {
    // Validate input
    if (email.isEmpty || password.isEmpty) {
      throw Exception("Email and password cannot be empty");
    }

    if (!isValidEmail(email)) {
      throw Exception("Please enter a valid email address");
    }

    if (password.length < 6) {
      throw Exception("Password must be at least 6 characters long");
    }

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // Check mock credentials
    if (_mockUsers.containsKey(email) && _mockUsers[email] == password) {
      // Create user based on email
      String name = _getUserNameFromEmail(email);
      String role = _getUserRoleFromEmail(email);
      String department = _getUserDepartmentFromEmail(email);

      _currentUser = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        email: email,
        role: role,
        department: department,
      );

      return _currentUser!;
    } else {
      throw Exception("Invalid email or password");
    }
  }

  String _getUserNameFromEmail(String email) {
    switch (email) {
      case 'admin@worksphere.com':
        return 'Admin User';
      case 'hr@worksphere.com':
        return 'HR Manager';
      case 'employee@worksphere.com':
        return 'John Employee';
      case 'manager@worksphere.com':
        return 'Team Manager';
      default:
        return 'User';
    }
  }

  String _getUserRoleFromEmail(String email) {
    switch (email) {
      case 'admin@worksphere.com':
        return 'Administrator';
      case 'hr@worksphere.com':
        return 'HR Manager';
      case 'manager@worksphere.com':
        return 'Manager';
      default:
        return 'Employee';
    }
  }

  String _getUserDepartmentFromEmail(String email) {
    switch (email) {
      case 'admin@worksphere.com':
        return 'Administration';
      case 'hr@worksphere.com':
        return 'Human Resources';
      case 'manager@worksphere.com':
        return 'Management';
      default:
        return 'General';
    }
  }

  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentUser = null;
  }

  bool isLoggedIn() {
    return _currentUser != null;
  }

  // Get demo credentials for testing
  List<Map<String, String>> getDemoCredentials() {
    return [
      {'email': 'admin@worksphere.com', 'password': 'Admin123!'},
      {'email': 'hr@worksphere.com', 'password': 'Hr123!'},
      {'email': 'employee@worksphere.com', 'password': 'Employee123!'},
      {'email': 'manager@worksphere.com', 'password': 'Manager123!'},
    ];
  }
}
