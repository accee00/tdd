import 'package:tdd_demo/core/utils/typedef.dart';
import 'package:tdd_demo/src/authentication/domain/enities/user.dart';

abstract interface class AuthRepository {
  const AuthRepository();
  // Same as fp-dart package Future<Either<Exception,void>>
  // Future<(Exception,void)>createUser();
  ResultVoid createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });

  ResultFuture<List<User>> getUser();
}
