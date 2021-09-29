import '../entities/entities.dart';

abstract class LoadComingSoonData {
  Future<List<ComingSoonEntity>> loadComingSoon();
}
