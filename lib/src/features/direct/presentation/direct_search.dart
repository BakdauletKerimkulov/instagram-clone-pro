import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone_pro/src/common_widgets/app_circular_progress_indicator.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/auth/data/user_repository.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

class DirectSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      onPressed: null,
      icon: SvgPicture.asset(
        'assets/icons/instagram_share_icon.svg',
        width: Sizes.p24,
        height: Sizes.p24,
      ),
    ),
  ];

  @override
  Widget? buildLeading(BuildContext context) =>
      BackButton(color: AppColors.primaryColor, onPressed: () => context.pop());

  @override
  Widget buildResults(BuildContext context) => SizedBox();

  @override
  Widget buildSuggestions(BuildContext context) {
    return query.isEmpty
        ? SizedBox()
        : Consumer(
            builder: (context, ref, child) {
              final usersAsync = ref.watch(findUserByUsernameProvider(query));

              return usersAsync.maybeWhen(
                data: (users) {
                  return users.isEmpty
                      ? Text('No results'.hardcoded)
                      : ListView.builder(
                          itemCount: users.length,
                          itemBuilder: (BuildContext context, int index) {
                            final user = users[index];
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage(user.avatarUrl),
                              ),
                              title: Text(user.userName),
                            );
                          },
                        );
                },
                orElse: () => AppCircularProgressIndicator(),
              );
            },
          );
  }
}
