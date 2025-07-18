import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/top_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: const TopNavbar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                children: [
                  // Hero Section
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 24 : 48,
                      vertical: isMobile ? 48 : 80,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primary,
                          AppColors.secondary,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo with reduced spacing
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              'WS',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16), // Reduced from typical 32
                        
                        // Title
                        Text(
                          'Welcome to WorkSphere',
                          style: TextStyle(
                            fontSize: isMobile ? 28 : 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        
                        // Subtitle
                        Text(
                          'Your comprehensive HR assistant solution',
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 20,
                            color: Colors.white.withOpacity(0.9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 32),
                        
                        // CTA Button
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return const LoginModal();
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.primary,
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 32 : 48,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  // Features Section
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 24 : 48,
                      vertical: isMobile ? 48 : 80,
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Text(
                          'Enterprise-Ready Features',
                          style: AppTextStyles.headline2,
                        ),
                        const SizedBox(height: 48),
                        
                        // Feature Grid
                        LayoutBuilder(
                          builder: (context, constraints) {
                            final crossAxisCount = isMobile ? 1 : 3;
                            final childAspectRatio = isMobile ? 2.5 : 1.5;
                            
                            return GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: crossAxisCount,
                              childAspectRatio: childAspectRatio,
                              mainAxisSpacing: 24,
                              crossAxisSpacing: 24,
                              children: [
                                _buildFeatureCard(
                                  icon: Icons.people_outline,
                                  title: 'Employee Management',
                                  description: 'Comprehensive employee records and profiles',
                                ),
                                _buildFeatureCard(
                                  icon: Icons.calendar_today_outlined,
                                  title: 'Attendance & Leave',
                                  description: 'Track attendance and manage leave requests',
                                ),
                                _buildFeatureCard(
                                  icon: Icons.analytics_outlined,
                                  title: 'HR Analytics',
                                  description: 'Data-driven insights for better decisions',
                                ),
                                _buildFeatureCard(
                                  icon: Icons.assessment_outlined,
                                  title: 'Performance Tracking',
                                  description: 'Monitor and improve employee performance',
                                ),
                                _buildFeatureCard(
                                  icon: Icons.poll_outlined,
                                  title: 'Surveys & Feedback',
                                  description: 'Collect employee feedback and insights',
                                ),
                                _buildFeatureCard(
                                  icon: Icons.folder_outlined,
                                  title: 'Document Management',
                                  description: 'Secure document storage and sharing',
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  
                  // Footer
                  Container(
                    padding: const EdgeInsets.all(32),
                    color: AppColors.lightGrey,
                    child: const Center(
                      child: Text(
                        '© 2024 WorkSphere. All rights reserved.',
                        style: AppTextStyles.bodyText2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
            color: AppColors.primary,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTextStyles.headline3,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: AppTextStyles.bodyText2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
