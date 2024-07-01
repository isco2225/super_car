
import 'models.dart';

class AppDependencies {
  const AppDependencies({
    required this.repositories,
    required this.instances,
    required this.api,
  });
  final Repositories repositories;
  final Instances instances;
  final Apis api;
}
