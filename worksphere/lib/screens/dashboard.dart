import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/sidebar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedSection = 'HR Analytics';

  void updateSection(String section) {
    setState(() {
      selectedSection = section;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (isMobile) {
            return _buildMobileLayout();
          } else {
            return _buildDesktopLayout();
          }
        },
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Sidebar(
          selectedSection: selectedSection,
          onSectionChange: updateSection,
        ),
        Expanded(
          child: _buildMainContent(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WorkSphere'),
        backgroundColor: AppColors.primary,
      ),
      drawer: Sidebar(
        selectedSection: selectedSection,
        onSectionChange: updateSection,
        isMobile: true,
      ),
      body: _buildMainContent(),
    );
  }

  Widget _buildMainContent() {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[200]!,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Text(
                selectedSection,
                style: AppTextStyles.headline2,
              ),
            ],
          ),
        ),
        
        // Main Content
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HR Analytics Section
                if (selectedSection == 'HR Analytics') ...[
                  _buildHRAnalyticsSection(),
                  const SizedBox(height: 32),
                ],
                
                // User Analytics Section
                if (selectedSection == 'User Analytics') ...[
                  _buildUserAnalyticsSection(),
                  const SizedBox(height: 32),
                ],
                
                // Other sections
                _buildSectionContent(selectedSection),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHRAnalyticsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'HR Analytics Dashboard',
          style: AppTextStyles.headline3,
        ),
        const SizedBox(height: 16),
        
        // Stats Cards
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;
            
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1.5,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildStatCard(
                  title: 'Total Employees',
                  value: '1,247',
                  icon: Icons.people_outline,
                  color: AppColors.primary,
                ),
                _buildStatCard(
                  title: 'Active Today',
                  value: '1,189',
                  icon: Icons.check_circle_outline,
                  color: Colors.green,
                ),
                _buildStatCard(
                  title: 'On Leave',
                  value: '58',
                  icon: Icons.beach_access_outlined,
                  color: Colors.orange,
                ),
                _buildStatCard(
                  title: 'New Hires',
                  value: '12',
                  icon: Icons.person_add_outlined,
                  color: Colors.blue,
                ),
              ],
            );
          },
        ),
        
        const SizedBox(height: 24),
        
        // Charts Section
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildChartCard(
                title: 'Attendance Trends',
                child: _buildAttendanceChart(),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: _buildChartCard(
                title: 'Department Distribution',
                child: _buildDepartmentChart(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUserAnalyticsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Employee Analytics Dashboard',
          style: AppTextStyles.headline3,
        ),
        const SizedBox(height: 16),
        
        // Engagement Metrics
        LayoutBuilder(
          builder: (context, constraints) {
            final crossAxisCount = constraints.maxWidth < 600 ? 2 : 4;
            
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1.5,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildStatCard(
                  title: 'Engagement Score',
                  value: '8.7/10',
                  icon: Icons.sentiment_satisfied_alt_outlined,
                  color: Colors.purple,
                ),
                _buildStatCard(
                  title: 'Satisfaction Rate',
                  value: '92%',
                  icon: Icons.thumb_up_outlined,
                  color: Colors.green,
                ),
                _buildStatCard(
                  title: 'Training Hours',
                  value: '156',
                  icon: Icons.school_outlined,
                  color: Colors.indigo,
                ),
                _buildStatCardNow let me create the dashboard screen with the left sidebar and dynamic content area:

<create_file>
<path>worksphere/lib/screens/dashboard.dart</path>
<content>
import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/analytics_charts.dart';
import '../utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedSection = 'HR Analytics';

  void _onSectionChange(String section) {
    setState(() {
      selectedSection = section;
    });
  }

  Widget _buildContent() {
    switch (selectedSection) {
      case 'Profile':
        return _buildProfile();
      case 'Attendance':
        return _buildAttendance();
      case 'Leave':
        return _buildLeave();
      case 'Teams':
        return _buildTeams();
      case 'HR Analytics':
        return _buildHRAnalytics();
      case 'User Analytics':
        return _buildUserAnalytics();
      case 'Documents':
        return _buildDocuments();
      case 'Kudos':
        return _buildKudos();
      case 'Surveys':
        return _buildSurveys();
      default:
        return Center(child: Text('Section not found'));
    }
  }

  Widget _buildProfile() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Profile',
            style: AppTextStyles.headline2,
          ),
          const SizedBox(height: 24),
          _buildProfileCard(),
        ],
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'John Doe',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Senior Software Engineer',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          _buildProfileDetail('Email', 'john.doe@worksphere.com'),
          _buildProfileDetail('Department', 'Engineering'),
          _buildProfileDetail('Manager', 'Jane Smith'),
          _buildProfileDetail('Start Date', 'January 15, 2022'),
        ],
      ),
    );
  }

  Widget _buildProfileDetail(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildAttendance() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Attendance',
            style: AppTextStyles.headline2,
          ),
          const SizedBox(height: 24),
          _buildAttendanceStats(),
          const SizedBox(height: 24),
          _buildAttendanceTable(),
        ],
      ),
    );
  }

  Widget _buildAttendanceStats() {
    return Row(
      children: [
        _buildStatCard('Present Today', '1,189', Colors.green),
        const SizedBox(width: 16),
        _buildStatCard('Absent', '58', Colors.red),
        const SizedBox(width: 16),
        _buildStatCard('Late', '23', Colors.orange),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceTable() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Attendance',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          DataTable(
            columns: const [
              DataColumn(label: Text('Employee')),
              DataColumn(label: Text('Date')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Time')),
            ],
            rows: [
              DataRow(cells: [
                const DataCell(Text('John Doe')),
                const DataCell(Text('2024-01-15')),
                DataCell(
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('Present', style: TextStyle(color: Colors.green)),
                  ),
                ),
                const DataCell(Text('9:00 AM')),
              ]),
              DataRow(cells: [
                const DataCell(Text('Jane Smith')),
                const DataCell(Text('2024-01-15')),
                DataCell(
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('Absent', style: TextStyle(color: Colors.red)),
                  ),
                ),
                const DataCell(Text('-')),
              ]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLeave() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Leave Management',
            style: AppTextStyles.headline2,
          ),
          const SizedBox(height: 24),
          _buildLeaveStats(),
          const SizedBox(height: 24),
          _buildLeaveRequests(),
        ],
      ),
    );
  }

  Widget _buildLeaveStats() {
    return Row(
      children: [
        _buildStatCard('Total Leave Days', '15', Colors.blue),
        const SizedBox(width: 16),
        _buildStatCard('Used', '8', Colors.orange),
        const SizedBox(width: 16),
        _buildStatCard('Remaining', '7', Colors.green),
      ],
    );
  }

  Widget _buildLeaveRequests() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Leave Requests',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Leave Request ${index + 1}'),
                subtitle: Text('From: Jan ${index + 10}, 2024'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTeams() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Teams',
            style: AppTextStyles.headline2,
          ),
          const SizedBox(height: 24),
          _buildTeamGrid(),
        ],
      ),
    );
  }

  Widget _buildTeamGrid() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildTeamCard('Engineering', 45, Colors.blue),
        _buildTeamCard('HR', 12, Colors.green),
        _buildTeamCard('Sales', 28, Colors.orange),
        _buildTeamCard('Marketing', 15, Colors.purple),
        _buildTeamCard('Finance', 8, Colors.red),
        _buildTeamCard('Operations', 20, Colors.teal),
      ],
    );
  }

  Widget _buildTeamCard(String name, int members, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$members members',
            style: TextStyle(color: color.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  Widget _buildHRAnalytics() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'HR Analytics',
            style: AppTextStyles.headline2,
          ),
          const SizedBox(height: 24),
          const AnalyticsCharts(),
        ],
      ),
    );
  }

  Widget _buildUserAnalytics() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Employee Analytics',
            style: AppTextStyles.headline2,
          ),
          const SizedBox(height: 24),
          _buildEngagementMetrics(),
          const SizedBox(height: 24),
          _buildPerformanceChart(),
        ],
      ),
    );
  }

  Widget _buildEngagementMetrics() {
    return Row(
      children: [
        _buildStatCard('Engagement Score', '8.7/10', Colors.purple),
        const SizedBox(width: 16),
        _buildStatCard('Satisfaction Rate', '92%', Colors.green),
        const SizedBox(width: 16),
        _buildStatCard('Training Hours', '156', Colors.blue),
      ],
    );
  }

  Widget _buildPerformanceChart() {
    return Container(
      height: 400,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Performance Trends',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Center(
              child: Text('Performance analytics chart will be displayed here'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDocuments() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Documents',
            style: AppTextStyles.headline2,
          ),
          const SizedBox(height: 24),
          _buildDocumentList(),
        ],
      ),
    );
  }

  Widget _buildDocumentList() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Documents',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.description, color: Colors.blue),
                title: Text('Document ${index + 1}.pdf'),
                subtitle: Text('Uploaded on Jan ${index + 10}, 2024'),
                trailing: IconButton(
                  icon: const Icon(Icons.download),
                  onPressed: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildKudos() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Kudos',
            style: AppTextStyles.headline2,
          ),
          const SizedBox(height: 24),
          _buildKudosFeed(),
        ],
      ),
    );
  }

  Widget _buildKudosFeed() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recent Kudos',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: const Icon(Icons.favorite, color: Colors.red),
                  title: Text('Kudos to ${['John', 'Jane', 'Mike'][index]}'),
                  subtitle: Text('Great work on the ${['project', 'presentation', 'report'][index]}!'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSurveys() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Surveys',
            style: AppTextStyles.headline2,
          ),
          const SizedBox(height: 24),
          _buildSurveyList(),
        ],
      ),
    );
  }

  Widget _buildSurveyList() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Active Surveys',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: const Icon(Icons.poll, color: Colors.blue),
                  title: Text(['Employee Satisfaction', 'Work Environment'][index]),
                  subtitle: Text('${[85, 92][index]}% completed'),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Take Survey'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: isMobile ? AppBar(title: const Text('WorkSphere Dashboard')) : null,
      drawer: isMobile
          ? Sidebar(
              selectedSection: selectedSection,
              onSectionChange: (section) {
                Navigator.pop(context);
                _onSectionChange(section);
              },
              isMobile: true,
            )
          : null,
      body: Row(
        children: [
          if (!isMobile)
            Sidebar(
              selectedSection: selectedSection,
              onSectionChange: _onSectionChange,
            ),
          Expanded(
            child: Container(
              color: AppColors.background,
              child: _buildContent(),
            ),
          ),
        ],
      ),
    );
  }
}
