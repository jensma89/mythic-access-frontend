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
  State<ListCampaignsPage> CreateState() => _ListCampaignsPageState();
}

class _ListCampaignsPageState extends State<ListCampaignsPage> {
  // Later for API data
  String title = 'Test Campaign';
  String genre = 'Fantasy';
  String story = 'Its the fantastic story of 3 heros...';
  String created = '2026/02/01';
  int maxClasses = 3;

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

          // List of campaigns - side scroll view


    );
  }
}
