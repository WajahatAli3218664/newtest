import 'package:flutter/material.dart';
import 'package:icare/screens/login.dart';
import 'package:icare/screens/select_user_type.dart';
import 'package:icare/utils/imagePaths.dart';
import 'package:icare/utils/theme.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;

    if (!isDesktop) {
      // Mobile: Redirect to role selection
      return const SelectUserType();
    }

    // Desktop: Clean landing page
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1920),
          child: Row(
            children: [
              // Left side - Branding
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF001E6C),
                        Color(0xFF0036BC),
                        Color(0xFF035BE5),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          height: 140,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(32),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                              width: 2,
                            ),
                          ),
                          child: Image.asset(
                            ImagePaths.logo,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          'iCare',
                          style: TextStyle(
                            fontSize: 56,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            fontFamily: 'Gilroy-Bold',
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Your Virtual Healthcare Platform',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.8),
                            fontFamily: 'Gilroy-Medium',
                          ),
                        ),
                        const SizedBox(height: 60),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Column(
                            children: [
                              _buildFeature(Icons.medical_services_rounded, 'Connect with Doctors'),
                              const SizedBox(height: 24),
                              _buildFeature(Icons.science_rounded, 'Book Lab Tests'),
                              const SizedBox(height: 24),
                              _buildFeature(Icons.local_pharmacy_rounded, 'Order Medicines'),
                              const SizedBox(height: 24),
                              _buildFeature(Icons.school_rounded, 'Learn & Grow'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Right side - Actions
              Expanded(
                flex: 5,
                child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Container(
                      width: 480,
                      padding: const EdgeInsets.all(60),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Welcome to iCare',
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF0F172A),
                              fontFamily: 'Gilroy-Bold',
                              letterSpacing: -0.5,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Get started by selecting your role',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                              fontFamily: 'Gilroy-Medium',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 60),

                          // Get Started Button
                          SizedBox(
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => const SelectUserType()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Get Started',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Gilroy-Bold',
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Already have account
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                  fontFamily: 'Gilroy-Medium',
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                                  );
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Gilroy-Bold',
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 60),

                          // Info cards
                          Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8FAFC),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.verified_user_rounded, color: AppColors.primaryColor, size: 24),
                                    const SizedBox(width: 12),
                                    const Expanded(
                                      child: Text(
                                        'Secure & Private',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Gilroy-SemiBold',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Icon(Icons.support_agent_rounded, color: AppColors.primaryColor, size: 24),
                                    const SizedBox(width: 12),
                                    const Expanded(
                                      child: Text(
                                        '24/7 Support',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Gilroy-SemiBold',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(width: 16),
        Text(
          text,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.95),
            fontFamily: 'Gilroy-SemiBold',
          ),
        ),
      ],
    );
  }
}
