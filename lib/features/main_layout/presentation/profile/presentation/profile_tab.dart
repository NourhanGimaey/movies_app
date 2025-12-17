import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/widgets/app_elevated_button.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                        "assets/images/temp_avatar.png",
                                      ),
                                      radius: 80,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Temp Name",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "1",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Wishlist",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "2",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "History",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: AppElevatedButton(
                                    onPress: () {},
                                    text: "Edit Profile",
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                    textColor: Theme.of(
                                      context,
                                    ).colorScheme.onSecondary,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  flex: 1,
                                  child: AppElevatedButton(
                                    onPress: () {},
                                    text: "Exit",
                                    backgroundColor: Theme.of(
                                      context,
                                    ).colorScheme.error,
                                    textColor: Theme.of(
                                      context,
                                    ).colorScheme.onError,
                                    borderSide: Theme.of(
                                      context,
                                    ).colorScheme.error,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    dividerColor: AppColors.transparent,
                    labelColor: Theme.of(context).colorScheme.secondary,
                    indicatorColor: Theme.of(context).colorScheme.secondary,
                    labelPadding: const EdgeInsets.symmetric(vertical: 20.0),
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: const [
                      Tab(
                        child: Column(
                          children: [Icon(Icons.list), Text("Watchlist")],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [Icon(Icons.folder), Text("History")],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
