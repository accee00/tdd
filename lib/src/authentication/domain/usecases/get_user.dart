import 'package:tdd_demo/core/usecase/usecase.dart';
import 'package:tdd_demo/core/utils/typedef.dart';
import 'package:tdd_demo/src/authentication/domain/enities/user.dart';
import 'package:tdd_demo/src/authentication/domain/repositories/auth_repository.dart';

class GetUser implements UseCaseWithoutParams<List<User>> {
  final AuthRepository _authRepository;
  const GetUser(this._authRepository);
  @override
  ResultFuture<List<User>> call() async => await _authRepository.getUser();
}
