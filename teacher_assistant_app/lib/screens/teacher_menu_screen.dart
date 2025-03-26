import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class TeacherMenuScreen extends StatelessWidget {
  const TeacherMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Menu',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.2,
        children: [
          _buildMenuCard(
            context,
            title: 'My Classroom',
            icon: '📚',
            color: const Color(0xFF4CAF50),
            onTap: () => context.push('/my-classes'),
          ),
          _buildMenuCard(
            context,
            title: 'AI Grade',
            icon: '✨',
            color: const Color(0xFF2196F3),
            onTap: () => context.push('/ai-grade'),
          ),
          _buildMenuCard(
            context,
            title: 'Analytics',
            icon: '📊',
            color: const Color(0xFF9C27B0),
            onTap: () => context.push('/analytics'),
          ),
          _buildMenuCard(
            context,
            title: 'Resources',
            icon: '🗂',
            color: const Color(0xFF795548),
            onTap: () => context.push('/resources'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF4200DB),
        unselectedItemColor: Colors.grey,
        currentIndex: 2, // Menu tab selected
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/teacher/home');
              break;
            case 3:
              context.push('/teacher/profile');
              break;
          }
        },
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String icon,
    required Color color,
    required VoidCallback onTap,
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
          onTap: onTap,
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
