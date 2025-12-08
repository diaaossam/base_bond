import 'package:flutter/material.dart';
import '../../../../../core/utils/app_size.dart';
import 'login_form.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [LoginForm()],
        ),
      ),
    );
  }
}
