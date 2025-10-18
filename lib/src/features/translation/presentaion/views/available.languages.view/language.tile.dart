import 'package:flutter/material.dart';
import 'package:read_it/src/core/extensions/extensions.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key, required this.title, required this.isDownloaded, this.t, required this.isBusy});
  final String title;
  final bool isDownloaded;
  final bool isBusy;

  final VoidCallback? t;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title.capitalize),
      trailing: IconButton(
        color: isDownloaded ? Colors.red : null,
        onPressed: t,
        icon: _buildIcon,
      ),
    );
  }

  // _onAction(BuildContext context) async {
  Widget get _buildIcon {
    if (isBusy) return const SizedBox(height: 15, width: 16, child: CircularProgressIndicator());
    return Icon(isDownloaded ? Icons.remove_circle : Icons.download);
  }
}
