// entity_card.dart
import 'package:flutter/material.dart';

// Class for the entity card (containers for view or create objects)

class EntityCard extends StatelessWidget {
  final String title;
  final List<Widget> content;
  final Widget footer;

  const EntityCard({
    super.key,
    required this.title,
    required this.content,
    required this.footer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const Divider(),

          ...content,

          const Divider(thickness: 2),

          footer,
        ],
      ),
    );
  }
}
