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
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(10),
      constraints: BoxConstraints(
        minWidth: size.width * 0.9,
        minHeight: size.height * 0.1,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const Divider(),

          ...content,

          Divider(thickness: Theme.of(context).dividerTheme.thickness! * 2),

          footer,
        ],
      ),
    );
  }
}
