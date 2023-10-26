import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  bool _notABot = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Contact Form'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Contact Me!'),
              const SizedBox(height: 20),
              _buildFormField('Name', _nameController),
              const SizedBox(height: 10),
              _buildFormField('Email', _emailController),
              const SizedBox(height: 10),
              _buildFormField('Phone', _phoneController),
              const SizedBox(height: 10),
              _buildFormField('Message', _messageController),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Checkbox(
                    value: _notABot,
                    onChanged: (newValue) {
                      setState(() {
                        _notABot = newValue!;
                      });
                    },
                  ),
                  const Text('I am not a Bot'),
                ],
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Show a snackbar message.
                  _showMessageSentSnackbar(context);

                  // Reset the form.
                  _resetForm();
                },
                child: const Text('Send Message'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller) {
    return Container(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        ),
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  void _showMessageSentSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Message Sent!'),
        duration: Duration(
            seconds: 2), // Duration for which the snackbar is displayed.
      ),
    );
  }

  void _resetForm() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _messageController.clear();
    setState(() {
      _notABot = false;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/contact',
      routes: {
        '/contact': (context) => const Contact(),
      },
    ),
  );
}
