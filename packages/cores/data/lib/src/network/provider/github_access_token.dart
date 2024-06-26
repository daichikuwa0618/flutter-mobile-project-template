// ignore_for_file: do_not_use_environment

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_access_token.g.dart';

const _gitHubAccessTokenKey = 'GITHUB_ACCESS_TOKEN';

@riverpod
String? gitHubAccessToken(GitHubAccessTokenRef ref) {
  return const bool.hasEnvironment(_gitHubAccessTokenKey)
      ? const String.fromEnvironment(_gitHubAccessTokenKey)
      : null;
}
