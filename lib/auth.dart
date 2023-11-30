import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'gen/assets.gen.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final tabLogin = 0;
  final tabSingUp = 1;
  var selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: SvgPicture.asset(
                Assets.img.icons.logoSplash,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff376AED),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 85, right: 85),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTab = tabLogin;
                              });
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: selectedTab == tabLogin
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTab = tabSingUp;
                              });
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: selectedTab == tabSingUp
                                      ? Colors.white
                                      : Colors.white54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(28),
                                topRight: Radius.circular(28))),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 32, right: 32, top: 32, bottom: 32),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: selectedTab == tabLogin
                                  ? _Login(textTheme: textTheme)
                                  : _SignUp(textTheme: textTheme),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome Back", style: textTheme.titleMedium),
        const SizedBox(height: 16),
        Text(
          "Sign in with your account",
          style: textTheme.displaySmall,
        ),
        const SizedBox(height: 20),
        TextField(
            style: textTheme.labelMedium,
            decoration: const InputDecoration(labelText: 'UserName')),
        const SizedBox(
          height: 8,
        ),
        PasswordTextField(textTheme: textTheme),
        const SizedBox(height: 24),
        SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff376AED))),
                onPressed: () {},
                child: const Text('LOGIN'))),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Forgot your Passwrod?"),
            TextButton(
              onPressed: () {},
              child: const Text(
                "reset there",
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        const Center(child: Text('OR SIGN IN WITH')),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(height: 32, width: 32),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 32, height: 32),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 32, height: 32),
          ],
        )
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome to Blog Club", style: textTheme.titleMedium),
        const SizedBox(height: 16),
        Text(
          "Please enter your information",
          style: textTheme.displaySmall,
        ),
        const SizedBox(height: 20),
        TextField(
            style: textTheme.labelMedium,
            decoration: const InputDecoration(labelText: 'User Name')),
        const SizedBox(
          height: 8,
        ),
        TextField(
            style: textTheme.labelMedium,
            decoration: const InputDecoration(labelText: 'Full Name')),
        const SizedBox(
          height: 8,
        ),
        PasswordTextField(textTheme: textTheme),
        const SizedBox(height: 24),
        SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff376AED))),
                onPressed: () {},
                child: const Text('Sign Up'))),
        const SizedBox(
          height: 20,
        ),
        const Center(child: Text('OR SIGN Up WITH')),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.img.icons.google.image(height: 32, width: 32),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.twitter.image(width: 32, height: 32),
            const SizedBox(
              width: 24,
            ),
            Assets.img.icons.facebook.image(width: 32, height: 32),
          ],
        )
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obscureText,
        autocorrect: false,
        enableSuggestions: false,
        style: widget.textTheme.labelMedium,
        decoration: InputDecoration(
          suffixIcon: TextButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Text(
              obscureText ? 'SHOW' : 'HIDE',
              style: widget.textTheme.labelSmall!.apply(color: Colors.blue),
            ),
          ),
          labelText: 'Password',
        ));
  }
}
