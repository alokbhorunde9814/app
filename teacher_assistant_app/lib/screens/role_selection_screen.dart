import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String? selectedRole;

  void _handleGetStarted() {
    if (selectedRole != null) {
      if (selectedRole == 'student') {
        context.go('/student_login');
      } else {
        context.go('/teacher_login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Empower Your Learning\nwith Intelligent ',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF4200DB),
                        height: 1.3,
                      ),
                    ),
                    TextSpan(
                      text: 'AI ',
                      style: GoogleFonts.inter(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFF5677),
                        height: 1.3,
                      ),
                    ),
                    WidgetSpan(
                      child: Transform.translate(
                        offset: const Offset(0, -10),
                        child: const Icon(
                          Icons.rocket_launch,
                          color: Color(0xFFFF5677),
                          size: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Text(
                'Choose Your Role?',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => setState(() => selectedRole = 'student'),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        selectedRole == 'student'
                            ? const Color(0xFF4200DB)
                            : const Color(0xFF4200DB).withOpacity(0.7),
                        selectedRole == 'student'
                            ? const Color(0xFF6C3AEA)
                            : const Color(0xFF6C3AEA).withOpacity(0.7),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Student',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (selectedRole == 'student')
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => setState(() => selectedRole = 'teacher'),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: selectedRole == 'teacher'
                          ? const Color(0xFF4200DB)
                          : const Color(0xFF4200DB).withOpacity(0.3),
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Teacher',
                        style: GoogleFonts.inter(
                          color: selectedRole == 'teacher'
                              ? const Color(0xFF4200DB)
                              : const Color(0xFF4200DB).withOpacity(0.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (selectedRole == 'teacher')
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.check_circle,
                            color: selectedRole == 'teacher'
                                ? const Color(0xFF4200DB)
                                : const Color(0xFF4200DB).withOpacity(0.7),
                            size: 20,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: selectedRole != null ? _handleGetStarted : null,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: selectedRole != null
                          ? const Color(0xFFFF5677).withOpacity(0.1)
                          : Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Get Started',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: selectedRole != null
                                ? const Color(0xFFFF5677)
                                : Colors.grey,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          color: selectedRole != null
                              ? const Color(0xFFFF5677)
                              : Colors.grey,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
