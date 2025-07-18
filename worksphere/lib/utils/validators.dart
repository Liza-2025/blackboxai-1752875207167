bool isValidEmail(String email) {
  final RegExp emailRegEx = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
  return emailRegEx.hasMatch(email);
}

enum PasswordStrength { Weak, Medium, Strong }

PasswordStrength getPasswordStrength(String password) {
  if (password.length < 6) return PasswordStrength.Weak;
  
  bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
  bool hasLowercase = RegExp(r'[a-z]').hasMatch(password);
  bool hasNumbers = RegExp(r'[0-9]').hasMatch(password);
  bool hasSpecialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password);
  
  int strengthScore = 0;
  if (hasUppercase) strengthScore++;
  if (hasLowercase) strengthScore++;
  if (hasNumbers) strengthScore++;
  if (hasSpecialCharacters) strengthScore++;
  
  if (password.length >= 8 && strengthScore >= 3) {
    return PasswordStrength.Strong;
  } else if (password.length >= 6 && strengthScore >= 2) {
    return PasswordStrength.Medium;
  } else {
    return PasswordStrength.Weak;
  }
}

String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Email is required';
  }
  if (!isValidEmail(email)) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? validatePassword(String? password) {
  if (password == null || password.isEmpty) {
    return 'Password is required';
  }
  if (password.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}
