import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import './screens/splash_screen.dart';
import './screens/role_selection_screen.dart';
import './screens/student_login_screen.dart';
import './screens/teacher_login_screen.dart';
import './screens/signup_screen.dart';
import './screens/teacher_home.dart';
import './screens/student_home.dart';
import './screens/student_tasks_screen.dart';
import './screens/join_class_screen.dart';
import './screens/menu_screen.dart';
import './screens/assignments_screen.dart';
import './screens/my_classes_screen.dart';
import './screens/assignment_details_screen.dart';
import './screens/ai_feedback_screen.dart';
import './screens/student_profile_screen.dart';
import 'screens/assignments_all.dart';
import 'screens/assignments_pending.dart';
import 'screens/assignments_completed.dart';
import 'screens/assignments_overdue.dart';
import 'screens/assignment_details.dart';
import 'screens/assignment_details_after_submission.dart';
import 'screens/teacher_menu_screen.dart';
import 'screens/create_class_screen.dart';
import 'screens/teacher_home_screen.dart';
import 'screens/create_options_screen.dart';
import 'screens/create_task_screen.dart';
import 'screens/create_assignment_screen.dart';
import 'screens/analytics_report_screen.dart';
import 'screens/export_report_screen.dart';
import 'screens/student_menu_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const TeacherAssistantApp());
}

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/role-selection',
      builder: (context, state) => const RoleSelectionScreen(),
    ),
    GoRoute(
      path: '/student_login',
      builder: (context, state) => const StudentLoginScreen(),
    ),
    GoRoute(
      path: '/teacher_login',
      builder: (context, state) => const TeacherLoginScreen(),
    ),
    GoRoute(
      path: '/signup/:userType',
      builder: (context, state) => SignUpScreen(
        userType: state.pathParameters['userType'] ?? 'student',
      ),
    ),
    GoRoute(
      path: '/teacher/home',
      builder: (context, state) => const TeacherHomeScreen(),
    ),
    GoRoute(
      path: '/student/home',
      builder: (context, state) => const StudentHome(),
    ),
    GoRoute(
      path: '/student/tasks',
      builder: (context, state) => const StudentTasksScreen(),
    ),
    GoRoute(
      path: '/student/join-class',
      builder: (context, state) => const JoinClassScreen(),
    ),
    GoRoute(
      path: '/menu',
      builder: (context, state) => const MenuScreen(),
    ),
    GoRoute(
      path: '/student-menu',
      builder: (context, state) => const StudentMenuScreen(),
    ),
    GoRoute(
      path: '/assignments',
      builder: (context, state) => const AssignmentsScreen(),
    ),
    GoRoute(
      path: '/assignments/pending',
      builder: (context, state) => const AssignmentsScreen(filter: 'Pending'),
    ),
    GoRoute(
      path: '/assignments/completed',
      builder: (context, state) => const AssignmentsScreen(filter: 'Completed'),
    ),
    GoRoute(
      path: '/assignments/overdue',
      builder: (context, state) => const AssignmentsScreen(filter: 'Overdue'),
    ),
    GoRoute(
      path: '/my-classes',
      builder: (context, state) => const MyClassesScreen(),
    ),
    GoRoute(
      path: '/ai-assistance',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('AI Assistance Screen')),
      ),
    ),
    GoRoute(
      path: '/performance',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('My Performance Screen')),
      ),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const Scaffold(
        body: Center(child: Text('Settings & Profile Screen')),
      ),
    ),
    GoRoute(
      path: '/assignment/:id',
      builder: (context, state) {
        final Map<String, dynamic> extra =
            state.extra as Map<String, dynamic>? ?? {};
        return AssignmentDetailsScreen(
          title: extra['title'] as String? ?? 'Assignment',
          dueDate: extra['dueDate'] as DateTime? ?? DateTime.now(),
          description: extra['description'] as String? ?? '',
          isHighPriority: extra['isHighPriority'] as bool? ?? false,
          attachments: (extra['attachments'] as List?)
                  ?.map((item) => Map<String, String>.from(item as Map))
                  .toList() ??
              const [],
          isSubmitted: extra['isSubmitted'] as bool? ?? false,
          submittedDate: extra['submittedDate'] as DateTime?,
          submissionStatus:
              extra['submissionStatus'] as String? ?? 'Pending Review',
          expectedFeedback: extra['expectedFeedback'] as String?,
        );
      },
    ),
    GoRoute(
      path: '/ai-feedback',
      builder: (context, state) => const AIFeedbackScreen(),
    ),
    GoRoute(
      path: '/student/profile',
      builder: (context, state) => const StudentProfileScreen(),
    ),
    GoRoute(
      path: '/teacher/menu',
      builder: (context, state) => const TeacherMenuScreen(),
    ),
    GoRoute(
      path: '/create-class',
      builder: (context, state) => const CreateClassScreen(),
    ),
    GoRoute(
      path: '/create-options',
      builder: (context, state) => const CreateOptionsScreen(),
    ),
    GoRoute(
      path: '/create-task',
      builder: (context, state) => const CreateTaskScreen(),
    ),
    GoRoute(
      path: '/create-assignment',
      builder: (context, state) => const CreateAssignmentScreen(),
    ),
    GoRoute(
      path: '/analytics-report',
      builder: (context, state) => const AnalyticsReportScreen(),
    ),
    GoRoute(
      path: '/export-report',
      builder: (context, state) => const ExportReportScreen(),
    ),
  ],
);

class TeacherAssistantApp extends StatelessWidget {
  const TeacherAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Teacher Assistant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5CF6),
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      routerConfig: router,
    );
  }
}
