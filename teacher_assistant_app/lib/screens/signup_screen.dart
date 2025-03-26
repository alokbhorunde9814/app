import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  final String userType; // 'student' or 'teacher'

  const SignUpScreen({
    super.key,
    required this.userType,
  });

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
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    Opacity(
                      opacity: 0.83,
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.outfit(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Full Name Field
              Positioned(
                left: 35,
                top: 216,
                child: Text(
                  'Full Name :',
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 244,
                child: Container(
                  width: 333,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xFF8B5CF6),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your Full Name',
                      hintStyle: GoogleFonts.outfit(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
              ),
              // Email Field
              Positioned(
                left: 35,
                top: 298,
                child: Text(
                  'Email ID :',
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 326,
                child: Container(
                  width: 333,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xFF8B5CF6),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your Email ID',
                      hintStyle: GoogleFonts.outfit(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
              ),
              // Password Field
              Positioned(
                left: 35,
                top: 380,
                child: Text(
                  'Password :',
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 408,
                child: Container(
                  width: 333,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xFF8B5CF6),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      hintStyle: GoogleFonts.outfit(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
              ),
              // Confirm Password Field
              Positioned(
                left: 35,
                top: 462,
                child: Text(
                  'Confirm Password :',
                  style: GoogleFonts.outfit(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Positioned(
                left: 30,
                top: 490,
                child: Container(
                  width: 333,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xFF8B5CF6),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Re-Enter Password',
                      hintStyle: GoogleFonts.outfit(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
              ),
              // Create Account Button
              Positioned(
                left: 115,
                top: 565,
                child: InkWell(
                  onTap: () {
                    // Handle account creation
                  },
                  child: Container(
                    width: 164,
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
                        'Create Account',
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
              // Or continue with text
              Positioned(
                left: 128,
                top: 619,
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
                top: 648,
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
