// confirm_delete_dialog.dart
import 'package:flutter/material.dart';
import 'button.dart';

// Class for the confirm deletion alert box
class ConfirmDeleteDialog extends StatelessWidget {
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const ConfirmDeleteDialog({
    super.key,
    required this.message,
    required this.onConfirm,
    this.onCancel,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: size.height * 0.2,
      ),
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).dividerColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Message
            Semantics(
              label: message,
              liveRegion: true,
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),

            const SizedBox(height: 25),

            // Confirm button
            PrimaryButton(
              text: 'Confirm',
              semanticsLabel: 'Confirm delete',
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm();
              },
            ),
            const SizedBox(height: 15),

            // Cancel button
            SecondaryButton(
              text: 'Cancel',
              semanticsLabel: 'Cancel delete',
              onPressed: () {
                Navigator.of(context).pop();
                onCancel?.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
