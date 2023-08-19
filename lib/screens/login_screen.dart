import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_exp/provider/auth_provider.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SelectableText(
              'Email : eve.holt@reqres.in',
            ),
            const SizedBox(
              height: 20,
            ),
            const SelectableText(
              'Password : cityslicka',
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<AuthProvider>(
                builder: (context, value, child) => TextFormField(
                      obscureText: value.isObsecure,
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                value.hidePassword();
                              },
                              icon: Icon(value.isObsecure
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined))),
                    )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  authProvider.login(emailController.text.trim(),
                      passwordController.text.trim());
                },
                child: authProvider.isLoading
                    ? Container(
                        height: 15,
                        width: 15,
                        child: const CircularProgressIndicator(
                          strokeWidth: 3,
                        ))
                    : const Text("Login")),
            const SizedBox(
              height: 100,
            ),
            Text(
              authProvider.loginText,
            ),
          ],
        ),
      ),
    );
  }
}
