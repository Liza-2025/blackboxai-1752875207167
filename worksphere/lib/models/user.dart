class User {
  final String id;
  final String name;
  final String email;
  final String role;
  final String department;
  final String profileImage;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.role = 'Employee',
    this.department = 'General',
    this.profileImage = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? 'Employee',
      department: json['department'] ?? 'General',
      profileImage: json['profileImage'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'department': department,
      'profileImage': profileImage,
    };
  }

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    String? department,
    String? profileImage,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      department: department ?? this.department,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
