import 'package:equatable/equatable.dart';
import 'package:tdd_demo/core/usecase/usecase.dart';
import 'package:tdd_demo/core/utils/typedef.dart';
import 'package:tdd_demo/src/authentication/domain/repositories/auth_repository.dart';

// Use case depends on repo.
class CreateUser implements UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._authRepository);
  final AuthRepository _authRepository;

  @override
  ResultVoid call(CreateUserParams params) async =>
      await _authRepository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });
  const CreateUserParams.empty() : this(createdAt: '', name: '', avatar: '');
  @override
  List<Object?> get props => [createdAt, name, avatar];
}
