import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

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
                UsernameInput(),
                PasswordInput(),
                ElevatedButton(
                  onPressed: onLogin,
                  child: Text("Login"),
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
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
  const UsernameInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
