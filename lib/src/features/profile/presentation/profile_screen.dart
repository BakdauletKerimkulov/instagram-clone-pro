import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/routing/app_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Profile screen is coming soon'),
            gapH16,
            Consumer(
              builder: (BuildContext context, WidgetRef ref, _) {
                final firebaseAuth = ref.watch(firebaseAuthProvider);
                return ElevatedButton(
                  onPressed: () async {
                    await firebaseAuth.signOut();
                  },
                  child: Text('Sign out'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
