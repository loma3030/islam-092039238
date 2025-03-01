import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ComplaintScreen extends StatefulWidget {
  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _complaintController = TextEditingController();
  final String apiUrl =
      'http://81.10.64.250:80/Zahra_store/zahra/support/add_complaint.php';

  // Function to send complaint to the server
  Future<void> submitComplaint() async {
    if (_nameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _complaintController.text.isEmpty) {
      showMessage('الرجاء ملء جميع الحقول');
      return;
    }

    try {
      final response = await http.get(Uri.parse(
          '$apiUrl?user_name=${_nameController.text}&user_phone=${_phoneController.text}&user_email=${_emailController.text}&complaint_description=${_complaintController.text}'));

      final responseData = json.decode(response.body);
      if (response.statusCode == 200 && responseData['message'] != null) {
        showMessage('تم إرسال الشكوى بنجاح', success: true);
        clearFields();
      } else {
        showMessage('خطأ: ${responseData['error']}');
      }
    } catch (error) {
      showMessage('حدث خطأ أثناء إرسال الشكوى');
    }
  }

  void showMessage(String message, {bool success = false}) {
    final color = success ? Colors.green : Colors.red;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
  }

  void clearFields() {
    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _complaintController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support team'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildTextField(_nameController, 'الاسم', TextInputType.text),
            SizedBox(height: 16),
            buildTextField(_phoneController, 'رقم الهاتف', TextInputType.phone),
            SizedBox(height: 16),
            buildTextField(_emailController, 'البريد الإلكتروني',
                TextInputType.emailAddress),
            SizedBox(height: 16),
            buildTextField(
                _complaintController, 'وصف الشكوى', TextInputType.multiline,
                maxLines: 4),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: submitComplaint,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 158, 8),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: Text(
                'إرسال الشكوى',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build a styled text field
  Widget buildTextField(TextEditingController controller, String label,
      TextInputType keyboardType,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: const Color.fromARGB(255, 42, 161, 6)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.teal),
        ),
      ),
      style: TextStyle(color: Colors.teal[900]),
    );
  }
}
