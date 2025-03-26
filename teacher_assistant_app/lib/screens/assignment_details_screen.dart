import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssignmentDetailsScreen extends StatelessWidget {
  final String title;
  final DateTime dueDate;
  final String description;
  final bool isHighPriority;
  final List<Map<String, String>> attachments;
  final bool isSubmitted;
  final DateTime? submittedDate;
  final String submissionStatus;
  final String? expectedFeedback;

  AssignmentDetailsScreen({
    super.key,
    this.title = 'Database Normalization Report (DBMS)',
    DateTime? dueDate,
    this.description =
        'Write a detailed report on the principles of database normalization.',
    this.isHighPriority = true,
    this.attachments = const [
      {'name': 'DBMS_Guide.pdf', 'type': 'pdf'},
      {'name': 'Reference Link', 'type': 'link'}
    ],
    this.isSubmitted = true,
    this.submittedDate,
    this.submissionStatus = 'Pending Review',
    this.expectedFeedback = 'In 3 Days',
  }) : this.dueDate = dueDate ?? DateTime(2025, 3, 11);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Assignment Details',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isSubmitted) _buildSuccessMessage(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildDateInfo('Due Date', dueDate),
                  if (submittedDate != null)
                    _buildDateInfo('Submitted on', submittedDate!),
                  const SizedBox(height: 24),
                  _buildSubmissionStatus(),
                  const SizedBox(height: 24),
                  _buildProgressTracker(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessMessage() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: const Color(0xFFE7F6EC),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFF1F8B24),
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            'Assignment Submitted Successfully!',
            style: GoogleFonts.inter(
              color: const Color(0xFF1F8B24),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateInfo(String label, DateTime date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.grey[600],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${_formatDate(date)}${label == "Submitted on" ? ", ${_formatTime(date)}" : ""}',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmissionStatus() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7ED),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Submission Status',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.history,
                size: 20,
                color: Color(0xFFEA580C),
              ),
              const SizedBox(width: 8),
              Text(
                submissionStatus,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFEA580C),
                ),
              ),
            ],
          ),
          if (expectedFeedback != null) ...[
            const SizedBox(height: 4),
            Text(
              'Expected Feedback: $expectedFeedback',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildProgressTracker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Progress Tracker',
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildProgressStep(
                'Assigned',
                true,
                isFirst: true,
              ),
            ),
            Expanded(
              child: _buildProgressStep(
                'Submitted',
                true,
              ),
            ),
            Expanded(
              child: _buildProgressStep(
                'Reviewed',
                false,
                isLast: true,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProgressStep(String label, bool isCompleted,
      {bool isFirst = false, bool isLast = false}) {
    return Column(
      children: [
        Row(
          children: [
            if (!isFirst)
              Expanded(
                child: Container(
                  height: 2,
                  color:
                      isCompleted ? const Color(0xFF1F8B24) : Colors.grey[300],
                ),
              ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? const Color(0xFF1F8B24) : Colors.white,
                border: Border.all(
                  color:
                      isCompleted ? const Color(0xFF1F8B24) : Colors.grey[300]!,
                  width: 2,
                ),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
            if (!isLast)
              Expanded(
                child: Container(
                  height: 2,
                  color:
                      isCompleted ? const Color(0xFF1F8B24) : Colors.grey[300],
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String _formatTime(DateTime date) {
    String period = date.hour >= 12 ? 'PM' : 'AM';
    int hour = date.hour > 12 ? date.hour - 12 : date.hour;
    String minute = date.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }
}
