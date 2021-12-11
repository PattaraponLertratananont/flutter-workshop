import 'package:flutter/material.dart';
import 'package:flutter_exam/modules/login/service.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                UsernameInput(controller: usernameController),
                Container(
                  constraints: BoxConstraints(
                    minHeight: 100,
                  ),
                  child: PasswordInput(controller: passwordController),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: onLogin,
                    child: Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onLogin() {
    FocusScope.of(context).unfocus();
    if (!formKey.currentState!.validate()) return;
    print("SUCCESS");
    var service = LoginService();
    service
        .getUserProfile(usernameController.text, passwordController.text)
        .then((profile) {
      print(profile.toJson());
    }).catchError((err) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("ERROR"),
        ),
      );
    });
  }
}

class PasswordInput extends StatelessWidget {
  final TextEditingController controller;
  const PasswordInput({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text("Password"),
        hintText: "Password",
      ),
      obscureText: true,
      obscuringCharacter: "\$",
      validator: (String? value) {
        if (value == null || value.isEmpty) return "Please enter password.";
        if (value.length < 5) return "Password invalid.";
        return null;
      },
    );
  }
}

class UsernameInput extends StatelessWidget {
  final TextEditingController controller;
  const UsernameInput({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.red,
      style: TextStyle(color: Colors.blue),
      decoration: InputDecoration(
        label: Text("Username"),
        labelStyle: TextStyle(
          color: Colors.red,
        ),
        hintText: "Username",
        border: OutlineInputBorder(),
        errorStyle: TextStyle(
          color: Colors.green[800],
        ),
      ),
      maxLength: 15,
      validator: (String? value) {
        if (value == null || value.isEmpty) return "Please enter username.";
        if (value.length < 5) return "Username invalid.";
        return null;
      },
    );
  }
}
