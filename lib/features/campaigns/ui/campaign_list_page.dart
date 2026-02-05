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
  late final PageController _pageController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.65);
  }

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

                    // Horizontal side scroll list (centered, responsive, selected bigger)
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final bool isDesktop = constraints.maxWidth > 600;
                        final double cardWidth = constraints.maxWidth * 0.6;
                        final double maxCardHeight = isDesktop ? 400 : 300;
                        final double cardHeight =
                            (cardWidth * 1.4).clamp(0, maxCardHeight);

                        return SizedBox(
                          height: cardHeight,
                          child: Semantics(
                            label:
                                'Campaign list, swipe left or right to choose a campaign',
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: campaigns.length,
                              onPageChanged: (index) {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                final campaign = campaigns[index];
                                final bool isSelected = index == _selectedIndex;

                                return Center(
                                  child: AnimatedScale(
                                    scale: isSelected ? 1.0 : 0.9,
                                    duration: const Duration(milliseconds: 200),
                                    child: SizedBox(
                                      width: cardWidth,
                                      height: cardHeight,
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(12),
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            '/campaign_detail',
                                            arguments: campaign,
                                          );
                                        },
                                        child: EntityCard(
                                          title: campaign['title'],
                                          content: [
                                            Text(
                                              campaign['genre'],
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium,
                                            ),
                                            const SizedBox(height: 12),
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
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    // Dropdown for accessible selection (bigger text)
                    DropdownButtonFormField<int>(
                      value: _selectedIndex,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium, // selected value
                      decoration: InputDecoration(
                        labelText: 'Select Campaign',
                        labelStyle: Theme.of(
                          context,
                        ).textTheme.bodyMedium, // label text
                      ),
                      items: List.generate(
                        campaigns.length,
                        (index) => DropdownMenuItem(
                          value: index,
                          child: Text(
                            campaigns[index]['title'],
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium, // item text
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (value == null) return;

                        setState(() {
                          _selectedIndex = value;
                        });

                        _pageController.animateToPage(
                          value,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                    ),
                    const SizedBox(height: 15),

                    // Button area
                    // Button to show selected campaign
                    AppButton(
                      text: 'Details',
                      icon: Icons.info_outline,
                      semanticsLabel: 'Show details from selected campaign',
                      onPressed: () {
                        // TODO: go to selected campaign
                      },
                    ),

                    const SizedBox(height: 24),

                    // Create new campaign
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
