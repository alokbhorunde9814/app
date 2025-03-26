import 'package:flutter/material.dart';

class TeacherHome extends StatelessWidget {
  const TeacherHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Text
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome, ',
                      style: TextStyle(
                        color: Color(0xFF4200DB),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Prof Laukik!',
                      style: TextStyle(
                        color: Color(0xFF1D0060),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Grading Overview Text
              Text(
                'Grading Overview',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              // Status Cards Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatusCard(
                      '5', 'Graded', Color(0xFFC9FFE5), Color(0xFF059669)),
                  _buildStatusCard(
                      '2', 'Pending', Color(0xFFFFF4C9), Color(0xFFD97706)),
                  _buildStatusCard(
                      '1', 'Late', Color(0xFFFFD3D3), Color(0xFFDC2626)),
                ],
              ),
              const SizedBox(height: 16),

              // Progress Bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FractionallySizedBox(
                      widthFactor: 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF8B5CF6), Color(0xFFEC4899)],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '70% Completed',
                    style: TextStyle(
                      color: Color(0xFF4B5563),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Assignments Queue
              _buildSectionCard(
                'Assignments Queue',
                [
                  _buildAssignmentItem('DBMS Report', '5 Submissions',
                      'Pending', Color(0xFFD97706)),
                  _buildAssignmentItem(
                      'ML Quiz', '7 Submissions', 'Graded', Color(0xFF059669)),
                ],
              ),
              const SizedBox(height: 16),

              // Quick Actions Grid
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: [
                  _buildActionCard('Create', Icons.add),
                  _buildActionCard('Ask AI', Icons.psychology),
                  _buildActionCard('Analytics', Icons.bar_chart),
                  _buildActionCard('Bulk Grade', Icons.grading),
                ],
              ),
              const SizedBox(height: 16),

              // AI-Powered Feedback
              _buildSectionCard(
                'AI-Powered Feedback',
                [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFECF5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '5 students struggled with SQL Joins',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'AI Suggests: ',
                                style: TextStyle(
                                  color: Color(0xFF8B5CF6),
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: 'Extra materials & class recap',
                                style: TextStyle(
                                  color: Color(0xFF0042FF),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Student Performance
              _buildSectionCard(
                'Student Performance',
                [
                  _buildStudentItem('Rahul', 'Weak in DBMS', Color(0xFFFEF2F2),
                      Color(0xFFDC2626)),
                  _buildStudentItem('Priya', 'Excelling in AI',
                      Color(0xFFECFDF5), Color(0xFF059669)),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildStatusCard(
      String number, String label, Color bgColor, Color textColor) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            number,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget _buildAssignmentItem(
      String title, String submissions, String status, Color statusColor) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFE7EFF7),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                submissions,
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFEDEDED)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentItem(
      String name, String status, Color bgColor, Color statusColor) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                status,
                style: TextStyle(
                  color: statusColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Generated by: https://www.figma.com/community/plugin/842128343887142055/
class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Frame6(),
        ]),
      ),
    );
  }
}

class Frame6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 644,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(),
          child: Stack(
            children: [
              Positioned(
                left: 24,
                top: 0,
                child: Container(
                  width: 266,
                  height: 29,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome, ',
                                style: TextStyle(
                                  color: const Color(0xFF4200DB),
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              TextSpan(
                                text: 'Prof Laukik !',
                                style: TextStyle(
                                  color: const Color(0xFF1D0060),
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 35,
                child: Container(
                  width: 360,
                  height: 990,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 20,
                        top: 147,
                        child: Container(
                          width: 326,
                          height: 10,
                          decoration: ShapeDecoration(
                            color: const Color(0xFFF3F4F6),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: const Color(0xFFE5E7EB)),
                              borderRadius: BorderRadius.circular(9999),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 228.19,
                                  height: 10,
                                  decoration: ShapeDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(0.00, 0.50),
                                      end: Alignment(1.00, 0.50),
                                      colors: [
                                        const Color(0xFF8B5CF6),
                                        const Color(0xFFEC4899)
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: const Color(0xFFE5E7EB)),
                                      borderRadius: BorderRadius.circular(9999),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 165,
                        child: Container(
                          width: 326,
                          height: 20,
                          decoration: ShapeDecoration(
                            color: Colors.black.withValues(alpha: 0),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: const Color(0xFFE5E7EB)),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 1,
                                child: SizedBox(
                                  width: 102,
                                  height: 17,
                                  child: Text(
                                    '70% Completed',
                                    style: TextStyle(
                                      color: const Color(0xFF4B5563),
                                      fontSize: 14,
                                      fontFamily: 'Rubik',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2,
                        top: 186,
                        child: Container(
                          width: 358,
                          height: 220,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: const Color(0xFFE5E7EB)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 16,
                                top: 16,
                                child: Container(
                                  width: 326,
                                  height: 28,
                                  decoration: ShapeDecoration(
                                    color: Colors.black.withValues(alpha: 0),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: const Color(0xFFE5E7EB)),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 1,
                                        top: 3,
                                        child: SizedBox(
                                          width: 194,
                                          height: 22,
                                          child: Text(
                                            'Assignments Queue',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16,
                                top: 56,
                                child: Container(
                                  width: 326,
                                  height: 148,
                                  decoration: ShapeDecoration(
                                    color: Colors.black.withValues(alpha: 0),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: const Color(0xFFE5E7EB)),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 326,
                                          height: 68,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFE7EFF7),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color:
                                                      const Color(0xFFB5BAC4)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 12,
                                                top: 12,
                                                child: Container(
                                                  width: 101.88,
                                                  height: 44,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black
                                                        .withValues(alpha: 0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: const Color(
                                                              0xFFE5E7EB)),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 2,
                                                        child: SizedBox(
                                                          width: 99,
                                                          height: 19,
                                                          child: Text(
                                                            'DBMS Report',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Rubik',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 25,
                                                        child: SizedBox(
                                                          width: 95,
                                                          height: 17,
                                                          child: Text(
                                                            '5 Submissions',
                                                            style: TextStyle(
                                                              color: const Color(
                                                                  0xFF6B7280),
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Rubik',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 240.41,
                                                top: 24,
                                                child: Container(
                                                  width: 73.59,
                                                  height: 20,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black
                                                        .withValues(alpha: 0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: const Color(
                                                              0xFFE5E7EB)),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 18,
                                                        top: 1,
                                                        child: SizedBox(
                                                          width: 54,
                                                          height: 17,
                                                          child: Text(
                                                            'Pending',
                                                            style: TextStyle(
                                                              color: const Color(
                                                                  0xFFD97706),
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Rubik',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 1.75,
                                                        child: Container(
                                                          width: 14,
                                                          height: 14,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 14,
                                                                height: 14,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: Colors
                                                                      .black
                                                                      .withValues(
                                                                          alpha:
                                                                              0),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: const Color(
                                                                            0xFFE5E7EB)),
                                                                  ),
                                                                ),
                                                                child: Stack(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 80,
                                        child: Container(
                                          width: 326,
                                          height: 68,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFE7EFF7),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color:
                                                      const Color(0xFFE5E7EB)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 12,
                                                top: 12,
                                                child: Container(
                                                  width: 96.47,
                                                  height: 44,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black
                                                        .withValues(alpha: 0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: const Color(
                                                              0xFFE5E7EB)),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 2,
                                                        child: SizedBox(
                                                          width: 58,
                                                          height: 19,
                                                          child: Text(
                                                            'ML Quiz',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Rubik',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 25,
                                                        child: SizedBox(
                                                          width: 94,
                                                          height: 17,
                                                          child: Text(
                                                            '7 Submissions',
                                                            style: TextStyle(
                                                              color: const Color(
                                                                  0xFF6B7280),
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Rubik',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              height: 1,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 247.23,
                                                top: 24,
                                                child: Container(
                                                  width: 66.77,
                                                  height: 20,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black
                                                        .withValues(alpha: 0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: const Color(
                                                              0xFFE5E7EB)),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 18,
                                                        top: 1,
                                                        child: SizedBox(
                                                          width: 47,
                                                          height: 17,
                                                          child: Text(
                                                            'Graded',
                                                            style: TextStyle(
                                                              color: const Color(
                                                                  0xFF059669),
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Rubik',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 0,
                                                        top: 1.75,
                                                        child: Container(
                                                          width: 14,
                                                          height: 14,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 14,
                                                                height: 14,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: Colors
                                                                      .black
                                                                      .withValues(
                                                                          alpha:
                                                                              0),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: const Color(
                                                                            0xFFE5E7EB)),
                                                                  ),
                                                                ),
                                                                child: Stack(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 24,
                        top: 0,
                        child: Text(
                          'Grading Overview',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 418,
                        child: Container(
                          width: 310.03,
                          height: 191,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 148.08,
                                  height: 90,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: const Color(0xFFEDEDED),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 62.12,
                                top: 29.08,
                                child: Container(
                                  width: 23.85,
                                  height: 23.85,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ),
                              Positioned(
                                left: 1.97,
                                top: 57,
                                child: SizedBox(
                                  width: 144.13,
                                  height: 33,
                                  child: Text(
                                    'Create  ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 101,
                                child: Container(
                                  width: 148.08,
                                  height: 90,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: const Color(0xFFEDEDED),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 1.97,
                                top: 158,
                                child: SizedBox(
                                  width: 144.13,
                                  height: 33,
                                  child: Text(
                                    'Analytics',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 66.07,
                                top: 130.07,
                                child: Container(
                                  width: 21.86,
                                  height: 21.86,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(),
                                ),
                              ),
                              Positioned(
                                left: 160,
                                top: 0,
                                child: Container(
                                  width: 148,
                                  height: 90,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color:
                                            Colors.black.withValues(alpha: 26),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 161.97,
                                top: 57,
                                child: SizedBox(
                                  width: 144.05,
                                  height: 33,
                                  child: Text(
                                    'Ask AI',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 160,
                                top: 101,
                                child: Container(
                                  width: 148,
                                  height: 90,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1,
                                        color: const Color(0xFFEDEDED),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 165.90,
                                top: 158,
                                child: SizedBox(
                                  width: 144.13,
                                  height: 33,
                                  child: Text(
                                    'Bulk Grade',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 224.05,
                                top: 130.09,
                                child: Container(
                                  width: 27.82,
                                  height: 27.82,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: -2,
                                        child: Container(
                                          width: 24,
                                          height: 24,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Stack(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20,
                        top: 51,
                        child: Container(
                          width: 326,
                          height: 84,
                          decoration: ShapeDecoration(
                            color: Colors.black.withValues(alpha: 0),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: const Color(0xFFE5E7EB)),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 103.33,
                                  height: 84,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFC9FFE5),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: const Color(0xFFE5E7EB)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 12,
                                        top: 12,
                                        child: Container(
                                          width: 79.33,
                                          height: 60,
                                          decoration: ShapeDecoration(
                                            color: Colors.black
                                                .withValues(alpha: 0),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color:
                                                      const Color(0xFFE5E7EB)),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 31,
                                                top: 15,
                                                child: Container(
                                                  width: 16,
                                                  height: 16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0x00ED9494)),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 16,
                                                        height: 16,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Colors.black
                                                              .withValues(
                                                                  alpha: 0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: const Color(
                                                                    0xFFE5E7EB)),
                                                          ),
                                                        ),
                                                        child: Stack(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 18,
                                                child: SizedBox(
                                                  width: 10,
                                                  height: 19,
                                                  child: Text(
                                                    '5',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xFF059669),
                                                      fontSize: 16,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 41,
                                                child: SizedBox(
                                                  width: 47,
                                                  height: 17,
                                                  child: Text(
                                                    'Graded',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xFF059669),
                                                      fontSize: 14,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 111.33,
                                top: 0,
                                child: Container(
                                  width: 103.33,
                                  height: 84,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFF4C9),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: const Color(0xFFE5E7EB)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 12,
                                        top: 12,
                                        child: Container(
                                          width: 79.33,
                                          height: 60,
                                          decoration: ShapeDecoration(
                                            color: Colors.black
                                                .withValues(alpha: 0),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color:
                                                      const Color(0xFFE5E7EB)),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 31.67,
                                                top: 15,
                                                child: Container(
                                                  width: 16,
                                                  height: 16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 16,
                                                        height: 16,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Colors.black
                                                              .withValues(
                                                                  alpha: 0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: const Color(
                                                                    0xFFE5E7EB)),
                                                          ),
                                                        ),
                                                        child: Stack(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 18,
                                                child: SizedBox(
                                                  width: 10,
                                                  height: 19,
                                                  child: Text(
                                                    '2',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xFFD97706),
                                                      fontSize: 16,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 41,
                                                child: SizedBox(
                                                  width: 54,
                                                  height: 17,
                                                  child: Text(
                                                    'Pending',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xFFD97706),
                                                      fontSize: 14,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 222.66,
                                top: 0,
                                child: Container(
                                  width: 103.34,
                                  height: 84,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFD3D3),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: const Color(0xFF97A9CC)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 12,
                                        top: 12,
                                        child: Container(
                                          width: 79.34,
                                          height: 60,
                                          decoration: ShapeDecoration(
                                            color: Colors.black
                                                .withValues(alpha: 0),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color:
                                                      const Color(0xFFE5E7EB)),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 16,
                                                  height: 16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(),
                                                ),
                                              ),
                                              Positioned(
                                                left: 24.34,
                                                top: 16,
                                                child: Container(
                                                  width: 16,
                                                  height: 16,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black
                                                        .withValues(alpha: 0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: const Color(
                                                              0xFFE5E7EB)),
                                                    ),
                                                  ),
                                                  child: Stack(),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 18,
                                                child: SizedBox(
                                                  width: 7,
                                                  height: 19,
                                                  child: Text(
                                                    '1',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xFFDC2626),
                                                      fontSize: 16,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 41,
                                                child: SizedBox(
                                                  width: 29,
                                                  height: 17,
                                                  child: Text(
                                                    'Late',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xFFDC2626),
                                                      fontSize: 14,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 2,
                        top: 620,
                        child: Container(
                          width: 358,
                          height: 172,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: const Color(0xFFE5E7EB)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 16,
                                top: 16,
                                child: Container(
                                  width: 326,
                                  height: 28,
                                  decoration: ShapeDecoration(
                                    color: Colors.black.withValues(alpha: 0),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: const Color(0xFFE5E7EB)),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 3,
                                        top: 3,
                                        child: SizedBox(
                                          width: 210,
                                          height: 22,
                                          child: Text(
                                            'AI-Powered Feedback',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 4.25,
                                        child: Container(
                                          width: 22.50,
                                          height: 18,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 22.50,
                                                height: 18,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: ShapeDecoration(
                                                  color: Colors.black
                                                      .withValues(alpha: 0),
                                                  shape: RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        color: const Color(
                                                            0xFFE5E7EB)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16,
                                top: 56,
                                child: Container(
                                  width: 326,
                                  height: 100,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFECF5),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: const Color(0xFFE5E7EB)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 16,
                                        top: 16,
                                        child: Container(
                                          width: 294,
                                          height: 20,
                                          decoration: ShapeDecoration(
                                            color: Colors.black
                                                .withValues(alpha: 0),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color:
                                                      const Color(0xFFE5E7EB)),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 22,
                                                top: 1,
                                                child: SizedBox(
                                                  width: 272,
                                                  height: 17,
                                                  child: Text(
                                                    '5 students struggled with SQL Joins',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 14,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 1.75,
                                                child: Container(
                                                  width: 14,
                                                  height: 14,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 14,
                                                        height: 14,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            ShapeDecoration(
                                                          color: Colors.black
                                                              .withValues(
                                                                  alpha: 0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                color: const Color(
                                                                    0xFFE5E7EB)),
                                                          ),
                                                        ),
                                                        child: Stack(),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 16,
                                        top: 44,
                                        child: Container(
                                          width: 294,
                                          height: 40,
                                          decoration: ShapeDecoration(
                                            color: Colors.black
                                                .withValues(alpha: 0),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color:
                                                      const Color(0xFFE5E7EB)),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 22,
                                                top: 1,
                                                child: SizedBox(
                                                  width: 234,
                                                  height: 17,
                                                  child: Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'AI Suggests',
                                                          style: TextStyle(
                                                            color: const Color(
                                                                0xFF8B5CF6),
                                                            fontSize: 14,
                                                            fontFamily: 'Rubik',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              ': Extra materials & class',
                                                          style: TextStyle(
                                                            color: const Color(
                                                                0xFF0042FF),
                                                            fontSize: 14,
                                                            fontFamily: 'Rubik',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 0,
                                                top: 21,
                                                child: SizedBox(
                                                  width: 37,
                                                  height: 17,
                                                  child: Text(
                                                    'recap',
                                                    style: TextStyle(
                                                      color: const Color(
                                                          0xFF0042FF),
                                                      fontSize: 14,
                                                      fontFamily: 'Rubik',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 785,
                        child: Container(
                          width: 358,
                          height: 220,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: const Color(0xFFE5E7EB)),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 16,
                                top: 16,
                                child: Container(
                                  width: 326,
                                  height: 28,
                                  decoration: ShapeDecoration(
                                    color: Colors.black.withValues(alpha: 0),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: const Color(0xFFE5E7EB)),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 3,
                                        top: 3,
                                        child: SizedBox(
                                          width: 218,
                                          height: 22,
                                          child: Text(
                                            'Student Performance',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 16,
                                top: 56,
                                child: Container(
                                  width: 326,
                                  height: 148,
                                  decoration: ShapeDecoration(
                                    color: Colors.black.withValues(alpha: 0),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: const Color(0xFFE5E7EB)),
                                    ),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 326,
                                          height: 68,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFFEF2F2),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color:
                                                      const Color(0xFFE5E7EB)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 12,
                                                top: 12,
                                                child: Container(
                                                  width: 145.47,
                                                  height: 44,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black
                                                        .withValues(alpha: 0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: const Color(
                                                              0xFFE5E7EB)),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 2,
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  color: const Color(
                                                                      0xFFE5E7EB)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          9999),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 52,
                                                        top: 0,
                                                        child: Container(
                                                          width: 93.47,
                                                          height: 44,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: Colors.black
                                                                .withValues(
                                                                    alpha: 0),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  color: const Color(
                                                                      0xFFE5E7EB)),
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 2,
                                                                child: SizedBox(
                                                                  width: 43,
                                                                  height: 19,
                                                                  child: Text(
                                                                    'Rahul',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height: 1,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 0,
                                                                top: 25,
                                                                child: SizedBox(
                                                                  width: 92,
                                                                  height: 17,
                                                                  child: Text(
                                                                    'Weak in DBMS',
                                                                    style:
                                                                        TextStyle(
                                                                      color: const Color(
                                                                          0xFFDC2626),
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height: 1,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 298.25,
                                                top: 27,
                                                child: Container(
                                                  width: 15.75,
                                                  height: 14,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black
                                                        .withValues(alpha: 0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: const Color(
                                                              0xFFE5E7EB)),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: Container(
                                                          width: 15.75,
                                                          height: 14,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 15.75,
                                                                height: 14,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: Colors
                                                                      .black
                                                                      .withValues(
                                                                          alpha:
                                                                              0),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: const Color(
                                                                            0xFFE5E7EB)),
                                                                  ),
                                                                ),
                                                                child: Stack(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 80,
                                        child: Container(
                                          width: 326,
                                          height: 68,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFFECFDF5),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  color:
                                                      const Color(0xFFE5E7EB)),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 12,
                                                top: 12,
                                                child: Container(
                                                  width: 145.28,
                                                  height: 44,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black
                                                        .withValues(alpha: 0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: const Color(
                                                              0xFFE5E7EB)),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 2,
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
                                                          decoration:
                                                              ShapeDecoration(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  color: const Color(
                                                                      0xFFE5E7EB)),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          9999),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                        left: 52,
                                                        top: 0,
                                                        child: Container(
                                                          width: 93.28,
                                                          height: 44,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: Colors.black
                                                                .withValues(
                                                                    alpha: 0),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              side: BorderSide(
                                                                  color: const Color(
                                                                      0xFFE5E7EB)),
                                                            ),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                left: 0,
                                                                top: 2,
                                                                child: SizedBox(
                                                                  width: 38,
                                                                  height: 19,
                                                                  child: Text(
                                                                    'Priya',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height: 1,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                left: 0,
                                                                top: 25,
                                                                child: SizedBox(
                                                                  width: 91,
                                                                  height: 17,
                                                                  child: Text(
                                                                    'Excelling in AI',
                                                                    style:
                                                                        TextStyle(
                                                                      color: const Color(
                                                                          0xFF059669),
                                                                      fontSize:
                                                                          14,
                                                                      fontFamily:
                                                                          'Rubik',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height: 1,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 298.25,
                                                top: 27,
                                                child: Container(
                                                  width: 15.75,
                                                  height: 14,
                                                  decoration: ShapeDecoration(
                                                    color: Colors.black
                                                        .withValues(alpha: 0),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          color: const Color(
                                                              0xFFE5E7EB)),
                                                    ),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Positioned(
                                                        left: 0,
                                                        top: 0,
                                                        child: Container(
                                                          width: 15.75,
                                                          height: 14,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 15.75,
                                                                height: 14,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    ShapeDecoration(
                                                                  color: Colors
                                                                      .black
                                                                      .withValues(
                                                                          alpha:
                                                                              0),
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    side: BorderSide(
                                                                        color: const Color(
                                                                            0xFFE5E7EB)),
                                                                  ),
                                                                ),
                                                                child: Stack(),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
