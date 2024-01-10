import 'package:flutter/material.dart';
import 'package:flutter_app/data/provider/api/repository_api.dart';
import 'package:flutter_app/data/provider/shared_preferences.dart';
import 'package:flutter_app/util/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final packageInfo = await PackageInfo.fromPlatform();
  logger.info(packageInfo);

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositories = ref.watch(listPublicRepositoriesProvider);

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: repositories.when(
            data: (value) => ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(value[index].name),
              ),
            ),
            error: (error, _) => Text(error.toString()),
            loading: CircularProgressIndicator.new,
          ),
        ),
      ),
    );
  }
}
