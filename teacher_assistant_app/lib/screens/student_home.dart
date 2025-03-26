import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAEF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Home',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: const Icon(Icons.person, size: 20, color: Colors.grey),
            ),
            onPressed: () => context.push('/student/profile'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Text
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome, ',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF4200DB),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: 'Alok!',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF1D0060),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Your Tasks Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Tasks',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push('/student/tasks');
                    },
                    child: Text(
                      'View All',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF4200DB),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Horizontal Task List
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildTaskCard(
                      'DBMS\nUnit 1\nAssignment',
                      'Due Today',
                      const Color(0xFFFF7474),
                    ),
                    const SizedBox(width: 12),
                    _buildTaskCard(
                      'DBMS\nUnit 2\nAssignment',
                      'Due Tomorrow',
                      const Color(0xFFA6FF96),
                    ),
                    const SizedBox(width: 12),
                    _buildTaskCard(
                      'DBMS\nUnit 3\nAssignment',
                      'Due Today',
                      const Color(0xFFFF7474),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Progress Bar
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildProgressDot(const Color(0xFF88FF78)),
                        _buildProgressDot(const Color(0xFF88FF78)),
                        _buildProgressDot(const Color(0xFFD9D9D9)),
                        _buildProgressDot(const Color(0xFF88FF78)),
                        _buildProgressDot(const Color(0xFFD9D9D9)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '2/5 tasks completed',
                      style: GoogleFonts.inter(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Quick Actions Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
                children: [
                  _buildActionCard(
                    context,
                    title: 'Join Class',
                    icon: '+',
                    color: Colors.black,
                  ),
                  _buildActionCard(
                    context,
                    title: 'AI Grade',
                    icon: '✨',
                    color: const Color(0xFFFF5757),
                  ),
                  _buildActionCard(
                    context,
                    title: 'My Classrooms',
                    icon: '📚',
                    color: const Color(0xFF4B7BE5),
                  ),
                  _buildActionCard(
                    context,
                    title: 'Analytics',
                    icon: '📊',
                    color: const Color(0xFF6B4EFF),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1877F2), Color(0xFFEC4899), Color(0xFFFB8C15)],
            begin: Alignment(-0.36, -0.59),
            end: Alignment(1.26, 1.21),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        ),
        child: Icon(Icons.psychology, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF4200DB),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 2: // Menu tab
              context.go('/menu');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String title, String dueDate, Color statusColor) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: GoogleFonts.inter(
                color: Colors.black,
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 20,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(9),
                bottomRight: Radius.circular(9),
              ),
            ),
            child: Center(
              child: Text(
                dueDate,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressDot(Color color) {
    return Container(
      width: 30,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required String icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 20,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            switch (title) {
              case 'Join Class':
                context.push('/student/join-class');
                break;
              case 'AI Grade':
                context.push('/ai-grade');
                break;
              case 'My Classrooms':
                context.push('/my-classes');
                break;
              case 'Analytics':
                context.push('/analytics');
                break;
            }
          },
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  icon,
                  style: const TextStyle(
                    fontSize: 28,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
