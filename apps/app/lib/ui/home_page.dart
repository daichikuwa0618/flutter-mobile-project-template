import 'package:cores_designsystem/theme_extensions.dart';
import 'package:features_github_repository/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/gen/l10n/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L10n.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.appBar),
        actions: [
          IconButton(
            onPressed: () => {}, // TODO
            icon: const Icon(
              Icons.construction,
            ),
          ),
          IconButton(
            onPressed: () => {}, // TODO
            icon: const Icon(
              Icons.web,
            ),
          ),
        ],
        iconTheme: IconTheme.of(context).copyWith(
          color: context.appColors.icon,
        ),
      ),
      body: const GitHubRepositoryList(),
    );
  }
}
