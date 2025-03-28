import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class CreateAssignmentScreen extends StatefulWidget {
  const CreateAssignmentScreen({Key? key}) : super(key: key);

  @override
  _CreateAssignmentScreenState createState() => _CreateAssignmentScreenState();
}

class _CreateAssignmentScreenState extends State<CreateAssignmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _maxPointsController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  String _priority = 'Low'; // Default priority
  List<String> _attachments = []; // List to store attachments
  bool _isloading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _maxPointsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _dueDate) {
      setState(() {
        _dueDate = picked;
      });
    }
  }

  Future<void> _saveAssignment() async {
    if (_formKey.currentState!.validate()) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        return;
      }

      setState(() {
        _isloading = true;
      });
      try {
        Map<String, dynamic> assignmentData = {
          'title': _titleController.text,
          'description': _descriptionController.text,
          'dueDate': _dueDate,
          'priority': _priority,
          'attachments': _attachments,
          'teacherId': user.uid,
          'timestamp': FieldValue.serverTimestamp(),
          'maxPoints': _maxPointsController.text,
        };

        // Add new assignment
        await FirebaseFirestore.instance
            .collection('assignments')
            .add(assignmentData);

        if (mounted) {
          context.pop(); // Go back after saving
        }
      } catch (e) {
        print("Error saving assignment: $e");
      } finally {
        setState(() {
          _isloading = false;
        });
      }
    }
  }

  Widget _buildAttachmentList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attachments',
          style: GoogleFonts.inter(
            color: Colors.grey[600],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          children: _attachments.map((attachment) {
            return Chip(
              label: Text(attachment),
              onDeleted: () {
                setState(() {
                  _attachments.remove(attachment);
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            // Add attachment logic here
            _addAttachment();
          },
          child: const Text('Add Attachment'),
        ),
      ],
    );
  }

  void _addAttachment() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newAttachment = '';
        return AlertDialog(
          title: const Text('Add Attachment'),
          content: TextField(
            onChanged: (value) {
              newAttachment = value;
            },
            decoration: const InputDecoration(hintText: 'Enter attachment name'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                setState(() {
                  _attachments.add(newAttachment);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Add Assignment',
          style: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a title';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _descriptionController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a description';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _maxPointsController,
                        decoration: const InputDecoration(
                            labelText: 'Max Points',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter max points';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Due Date: ${_dueDate.month}/${_dueDate.day}/${_dueDate.year}',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: const Text('Select Date'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: _priority,
                        onChanged: (String? newValue) {
                          setState(() {
                            _priority = newValue!;
                          });
                        },
                        items: <String>['Low', 'Medium', 'High']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          labelText: 'Priority',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildAttachmentList(),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: _saveAssignment,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('Save Assignment'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}