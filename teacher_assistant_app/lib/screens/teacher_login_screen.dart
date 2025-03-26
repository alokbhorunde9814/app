import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherLoginScreen extends StatelessWidget {
  const TeacherLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: 393,
          height: 852,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              // Back Button and Title
              Positioned(
                left: 30,
                top: 83,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => context.go('/'),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Teacher Login',
                      style: GoogleFonts.outfit(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Main Text
              Positioned(
                left: 30,
                top: 339,
                child: SizedBox(
                  width: 274,
                  child: Text(
                    'Create and manage your virtual classrooms with AI assistance.',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF4200DB),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              // Email Input
              Positioned(
                left: 30,
                top: 511,
                child: Container(
                  width: 333,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your Email',
                      hintStyle: GoogleFonts.outfit(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
              ),
              // Password Input
              Positioned(
                left: 30,
                top: 562,
                child: Container(
                  width: 333,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter a Password',
                      hintStyle: GoogleFonts.outfit(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
              ),
              // Forgot Password Link
              Positioned(
                left: 235,
                top: 602,
                child: TextButton(
                  onPressed: () {
                    // Handle forgot password
                  },
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.outfit(
                      color: const Color(0xFF1C005C),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              // Sign In Button
              Positioned(
                left: 204,
                top: 631,
                child: InkWell(
                  onTap: () {
                    // Add login logic here
                    context.go('/teacher/home');
                  },
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: ShapeDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.00, 0.50),
                        end: Alignment(1.00, 0.50),
                        colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                      ),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFFE5E7EB)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Sign in',
                        style: GoogleFonts.outfit(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Sign Up Button
              Positioned(
                left: 70,
                top: 631,
                child: InkWell(
                  onTap: () {
                    context.go('/signup/teacher');
                  },
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xFF8B5CF6),
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.outfit(
                          color: const Color(0xFFEC4899),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Or continue with text
              Positioned(
                left: 128,
                top: 680,
                child: Text(
                  'Or continue with',
                  style: GoogleFonts.outfit(
                    color: const Color(0xFF1C005C),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Social Login Buttons
              Positioned(
                left: 167,
                top: 709,
                child: Row(
                  children: [
                    // Google Button
                    Container(
                      width: 20,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg',
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Facebook Button
                    Container(
                      width: 20,
                      height: 20,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
