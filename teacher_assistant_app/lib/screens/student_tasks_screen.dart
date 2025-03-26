import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentTasksScreen extends StatelessWidget {
  const StudentTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFAEF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Your Tasks',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Section
            Container(
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
                  Text(
                    'Progress',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  LinearProgressIndicator(
                    value: 0.4, // 2/5 tasks completed
                    backgroundColor: const Color(0xFFD9D9D9),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF88FF78)),
                    borderRadius: BorderRadius.circular(5),
                    minHeight: 8,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '2/5 tasks completed',
                    style: GoogleFonts.inter(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tasks List
            Text(
              'All Tasks',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildTaskCard(
                    'DBMS Unit 1 Assignment',
                    'Due Today',
                    const Color(0xFFFF7474),
                    'Complete the database design assignment covering basic concepts and normalization.',
                  ),
                  const SizedBox(height: 12),
                  _buildTaskCard(
                    'DBMS Unit 2 Assignment',
                    'Due Tomorrow',
                    const Color(0xFFA6FF96),
                    'Submit the SQL queries assignment covering joins and subqueries.',
                  ),
                  const SizedBox(height: 12),
                  _buildTaskCard(
                    'DBMS Unit 3 Assignment',
                    'Due Today',
                    const Color(0xFFFF7474),
                    'Complete the transaction management and concurrency control assignment.',
                  ),
                  const SizedBox(height: 12),
                  _buildTaskCard(
                    'DBMS Unit 4 Assignment',
                    'Due Next Week',
                    const Color(0xFFFFD700),
                    'Submit the database recovery and backup assignment.',
                  ),
                  const SizedBox(height: 12),
                  _buildTaskCard(
                    'DBMS Final Project',
                    'Due in 2 Weeks',
                    const Color(0xFF87CEEB),
                    'Complete and submit the final database project implementation.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskCard(
      String title, String dueDate, Color statusColor, String description) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        dueDate,
                        style: GoogleFonts.inter(
                          color: statusColor.computeLuminance() > 0.5
                              ? Colors.black87
                              : statusColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    color: Colors.black54,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 4,
            decoration: BoxDecoration(
              color: statusColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
