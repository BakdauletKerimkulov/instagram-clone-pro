import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/features/auth/presentation/ui_auth_providers.dart';

class CustomSigninScreen extends ConsumerWidget {
  const CustomSigninScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authProvidersProvider);
    return SignInScreen(providers: authProvider);
  }
}
