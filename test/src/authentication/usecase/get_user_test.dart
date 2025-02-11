// What class depend on?
// Auth repo.
// How we can mock dependency?
// Using mocktail.
// How we control our dependency?
// Using mock class.
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_demo/src/authentication/domain/enities/user.dart';
import 'package:tdd_demo/src/authentication/domain/repositories/auth_repository.dart';
import 'package:tdd_demo/src/authentication/domain/usecases/get_user.dart';

import 'authentication_repository_mock.dart';

void main() {
  late GetUser usecase;
  late AuthRepository authRepository;

  setUp(() {
    authRepository = MockAuthRepo();
    usecase = GetUser(authRepository);
  });

  const tResponse = [User.empty()];
  test(
    'should call [AuthRepo.getUser] and return [List<User >]',
    () async {
      // Arrange
      when(
        () => authRepository.getUser(),
      ).thenAnswer((_) async => Right(tResponse));

      // Act

      final result = await usecase();

      // Assert
      expect(
        result,
        equals(
          const Right<dynamic, List<User>>(tResponse),
        ),
      );
      verify(() => authRepository.getUser()).called(1);
      verifyNoMoreInteractions(authRepository);
    },
  );
}
