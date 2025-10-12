import 'package:flutter/material.dart' show BuildContext, Widget;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ConsumerWidget, WidgetRef;
import 'package:read_it/src/features/pdf.reader/presentation/views/home.page/home.page.dart';

class AppRouter extends ConsumerWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const Home();
}
