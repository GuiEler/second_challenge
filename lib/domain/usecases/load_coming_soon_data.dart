import '../entities/entities.dart';

abstract class LoadComingSoon {
  Future<List<ComingSoonEntity>> loadComingSoon();
}
