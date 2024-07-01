import '../app_router/router.dart';
import 'models/models.dart';

class InstanceDependencies {
  const InstanceDependencies();

  Future<Instances> init({
    // Router Config
    required Repositories repositories,
  }) async {
    final goRouter = AppRouter().router(
      repositories.auth.currentAuthStream,
      repositories.consumerRepository.currentConsumerStream,
    );
    final appPreferences = await repositories.appPreferences.read();

    return Instances(
      goRouter: goRouter,
      appPreferences: appPreferences,
    );
  }
}
