// campaign_list_page.dart

import 'package:flutter/material.dart';
import 'package:mythic_access_frontend/core/components/adaptive_scaffold.dart';
import '../../../core/components/button.dart';
import '../../../core/components/entity_card.dart';
import '../../../core/components/app_dark_background.dart';

// Class for list campaigns page
class ListCampaignsPage extends StatefulWidget {
  const ListCampaignsPage({super.key});

  @override
  State<ListCampaignsPage> createState() => _ListCampaignsPageState();
}

class _ListCampaignsPageState extends State<ListCampaignsPage> {
  // Later for API data
  final List<Map<String, dynamic>> campaigns = [
    {'title': 'Test Campaign', 'genre': 'Fantasy', 'maxClasses': 3},
    {'title': 'Dark Realms', 'genre': 'Dark Fantasy', 'maxClasses': 4},
    {'title': 'Cyber Knights', 'genre': 'Sci-Fi', 'maxClasses': 1},
  ];

  // Content, a list of campaigns and management options
  @override
  Widget build(BuildContext context) {
    return AppDarkBackground(
      child: AdaptiveScaffold(
        activeItem: null,
        homeRedirect: true,
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900, // For Web / Desktop
            ),

            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title - top
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'My Campaigns',
                              style: Theme.of(context).textTheme.headlineLarge,
                              semanticsLabel: 'Your list of campaigns page',
                            ),
                            const SizedBox(width: 12),
                            ExcludeSemantics(
                              child: Icon(Icons.now_wallpaper, size: 36),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Horizontal side scroll list
                    SizedBox(
                      height: 340, // Height of the cards
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, _) => const SizedBox(width: 12),
                        itemCount: campaigns.length,
                        itemBuilder: (context, index) {
                          final campaign = campaigns[index];

                          return SizedBox(
                            width: 280, // Width of the entity cards
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                // TODO: Navigate to campaign detail page
                                Navigator.pushNamed(
                                  context,
                                  '/campaign_detail',
                                  arguments: campaign,
                                );
                              },

                              // Entity cards in list view
                              child: EntityCard(
                                title: campaign['title'],
                                content: [
                                  // Genre field
                                  Text(
                                    campaign['genre'],
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(height: 15),

                                  // Max classes field
                                  Text(
                                    'Max Classes: ${campaign['maxClasses']}',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ],
                                footer: const SizedBox.shrink(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Button area
                    // Button to create campaign
                    PrimaryButton(
                      text: 'Create New',
                      semanticsLabel: 'Create a new campaign',
                      icon: Icons.plus_one,
                      onPressed: () {
                        // TODO: Navigate to create_campaign page
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
