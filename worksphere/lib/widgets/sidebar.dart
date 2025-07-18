import 'package:flutter/material.dart';
import '../utils/constants.dart';

class Sidebar extends StatelessWidget {
  final String selectedSection;
  final ValueChanged<String> onSectionChange;
  final bool isMobile;

  const Sidebar({
    Key? key,
    required this.selectedSection,
    required this.onSectionChange,
    this.isMobile = false,
  }) : super(key: key);

  final List<Map<String, dynamic>> sections = [
    {'title': 'Profile', 'icon': Icons.person_outline},
    {'title': 'Attendance', 'icon': Icons.calendar_today_outlined},
    {'title': 'Leave', 'icon': Icons.beach_access_outlined},
    {'title': 'Teams', 'icon': Icons.groups_outlined},
    {'title': 'HR Analytics', 'icon': Icons.analytics_outlined},
    {'title': 'User Analytics', 'icon': Icons.bar_chart_outlined},
    {'title': 'Documents', 'icon': Icons.folder_outlined},
    {'title': 'Kudos', 'icon': Icons.favorite_outline},
    {'title': 'Surveys', 'icon': Icons.poll_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Drawer(
        child: _buildSidebarContent(context),
      );
    }

    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
      ),
      child: _buildSidebarContent(context),
    );
  }

  Widget _buildSidebarContent(BuildContext context) {
    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.05),
            border: Border(
              bottom: BorderSide(
                color: Colors.grey[200]!,
                width: 1,
              ),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'WS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              const Text(
                'WorkSphere',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        
        // Navigation Items
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: sections.length,
            itemBuilder: (context, index) {
              final section = sections[index];
              final isSelected = section['title'] == selectedSection;
              
              return ListTile(
                leading: Icon(
                  section['icon'],
                  color: isSelected ? AppColors.primary : Colors.grey[600],
                ),
                title: Text(
                  section['title'],
                  style: TextStyle(
                    color: isSelected ? AppColors.primary : Colors.grey[800],
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
                selected: isSelected,
                selectedTileColor: AppColors.primary.withOpacity(0.1),
                onTap: () => onSectionChange(section['title']),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 4,
                ),
              );
            },
          ),
        ),
        
        // Footer
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey[200]!,
                width: 1,
              ),
            ),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                onTap: () {},
                contentPadding: EdgeInsets.zero,
              ),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text('Logout'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
