import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/features/auth/view_model/LoginViewModel.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(loginViewModelProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          alignment: .center,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text("Username:"),
              TextField(onChanged: vm.setUsername),
              Text("Password:"),
              TextField(
                obscureText: true,
                onChanged: vm.setPassword,
                keyboardType: .visiblePassword,
              ),
              FilledButton(onPressed: vm.performLogin, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
