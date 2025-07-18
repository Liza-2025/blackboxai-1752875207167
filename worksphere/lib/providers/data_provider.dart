import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Model for Employee data
class Employee {
  final String id;
  final String name;
  final String email;
  final String department;
  final String position;
  final String avatar;
  final String joinDate;
  final String status;
  final String phone;

  Employee({
    required this.id,
    required this.name,
    required this.email,
    required this.department,
    required this.position,
    required this.avatar,
    required this.joinDate,
    required this.status,
    required this.phone,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      department: json['department'] ?? '',
      position: json['position'] ?? '',
      avatar: json['avatar'] ?? '',
      joinDate: json['joinDate'] ?? '',
      status: json['status'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}

/// Model for Attendance data
class Attendance {
  final String id;
  final String employeeId;
  final String employeeName;
  final String date;
  final String? checkIn;
  final String? checkOut;
  final double hoursWorked;
  final String status;
  final String? location;

  Attendance({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.date,
    this.checkIn,
    this.checkOut,
    required this.hoursWorked,
    required this.status,
    this.location,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      id: json['id'] ?? '',
      employeeId: json['employeeId'] ?? '',
      employeeName: json['employeeName'] ?? '',
      date: json['date'] ?? '',
      checkIn: json['checkIn'],
      checkOut: json['checkOut'],
      hoursWorked: (json['hoursWorked'] ?? 0.0).toDouble(),
      status: json['status'] ?? '',
      location: json['location'],
    );
  }
}

/// Model for Leave data
class Leave {
  final String id;
  final String employeeId;
  final String employeeName;
  final String leaveType;
  final String startDate;
  final String endDate;
  final int days;
  final String reason;
  final String status;
  final String appliedDate;
  final String? approvedBy;

  Leave({
    required this.id,
    required this.employeeId,
    required this.employeeName,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.days,
    required this.reason,
    required this.status,
    required this.appliedDate,
    this.approvedBy,
  });

  factory Leave.fromJson(Map<String, dynamic> json) {
    return Leave(
      id: json['id'] ?? '',
      employeeId: json['employeeId'] ?? '',
      employeeName: json['employeeName'] ?? '',
      leaveType: json['leaveType'] ?? '',
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      days: json['days'] ?? 0,
      reason: json['reason'] ?? '',
      status: json['status'] ?? '',
      appliedDate: json['appliedDate'] ?? '',
      approvedBy: json['approvedBy'],
    );
  }
}

/// Provider for managing application data
class DataProvider with ChangeNotifier {
  List<Employee> _employees = [];
  List<Attendance> _attendance = [];
  List<Leave> _leaves = [];
  
  bool _isLoading = false;
  String? _errorMessage;
  
  List<Employee> get employees => _employees;
  List<Attendance> get attendance => _attendance;
  List<Leave> get leaves => _leaves;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  
  /// Initialize all data from JSON files
  Future<void> initializeData() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      await Future.wait([
        _loadEmployees(),
        _loadAttendance(),
        _loadLeaves(),
      ]);
    } catch (e) {
      _errorMessage = 'Failed to load data: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Load employees data from JSON
  Future<void> _loadEmployees() async {
    try {
      final String response = await rootBundle.loadString('assets/data/employees.json');
      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> employeeList = data['employees'] ?? [];
      
      _employees = employeeList
          .map((json) => Employee.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load employees: $e');
    }
  }
  
  /// Load attendance data from JSON
  Future<void> _loadAttendance() async {
    try {
      final String response = await rootBundle.loadString('assets/data/attendance.json');
      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> attendanceList = data['attendance'] ?? [];
      
      _attendance = attendanceList
          .map((json) => Attendance.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load attendance: $e');
    }
  }
  
  /// Load leaves data from JSON
  Future<void> _loadLeaves() async {
    try {
      final String response = await rootBundle.loadString('assets/data/leaves.json');
      final Map<String, dynamic> data = json.decode(response);
      final List<dynamic> leavesList = data['leaves'] ?? [];
      
      _leaves = leavesList
          .map((json) => Leave.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to load leaves: $e');
    }
  }
  
  /// Get attendance summary
  Map<String, dynamic> getAttendanceSummary() {
    final totalEmployees = _employees.length;
    final presentToday = _attendance.where((a) => a.status == 'Present').length;
    final absentToday = _attendance.where((a) => a.status == 'Absent').length;
    final totalHours = _attendance.fold<double>(0, (sum, a) => sum + a.hoursWorked);
    final averageHours = totalEmployees > 0 ? totalHours / totalEmployees : 0.0;
    
    return {
      'totalEmployees': totalEmployees,
      'presentToday': presentToday,
      'absentToday': absentToday,
      'averageHours': averageHours,
      'onTimePercentage': presentToday > 0 ? (presentToday / totalEmployees * 100) : 0.0,
    };
  }
  
  /// Get leave summary
  Map<String, dynamic> getLeaveSummary() {
    final totalLeaves = _leaves.length;
    final approvedLeaves = _leaves.where((l) => l.status == 'Approved').length;
    final pendingLeaves = _leaves.where((l) => l.status == 'Pending').length;
    final rejectedLeaves = _leaves.where((l) => l.status == 'Rejected').length;
    
    return {
      'totalLeaves': totalLeaves,
      'approvedLeaves': approvedLeaves,
      'pendingLeaves': pendingLeaves,
      'rejectedLeaves': rejectedLeaves,
    };
  }
  
  /// Get department distribution
  Map<String, int> getDepartmentDistribution() {
    final Map<String, int> distribution = {};
    
    for (final employee in _employees) {
      distribution[employee.department] = (distribution[employee.department] ?? 0) + 1;
    }
    
    return distribution;
  }
  
  /// Clear error message
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
