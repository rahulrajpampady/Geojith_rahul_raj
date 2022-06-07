import 'package:flutter/material.dart';
import 'package:geojith/screens/home.dart';
import 'package:geojith/widgets/custom-text-field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? _userNameController;
  TextEditingController? _passwordController;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  void validate() {
    //This is a simple validation, we can use form validation for multiple textFields for better results.

    if (_userNameController!.text.isEmpty ||
        _passwordController!.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('All fields required'),
      ));
      return;
    }

    if (_userNameController?.text == _passwordController?.text) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid Credentials')));
    }
  }

  @override
  void dispose() {
    _userNameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geojith'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
              controller: _userNameController,
              hintText: 'Enter your username',
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _passwordController,
              hintText: 'Enter your password',
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                validate();
              },
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _userNameController?.clear();
                _passwordController?.clear();
              },
              child: const Text('Clear Fields'),
            ),
          ],
        ),
      ),
    );
  }
}
