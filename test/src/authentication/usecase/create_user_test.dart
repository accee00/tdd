// 1. What the class depends on?
// Answer: The class (e.g., a use case like `LoginUser`) depends on `AuthRepository`.
//         The repository handles data operations (e.g., API calls, database access).

// 2. How to create a fake version of the dependency?
// Answer: Use Mocktail (a Dart mocking library) to create a mock implementation.
//         Add Mocktail to [dev_dependencies] in `pubspec.yaml`:
//         `flutter pub add -d mocktail`

// 3. Example: Why can't we use real APIs/databases in unit tests?
// Answer: Real APIs/databases introduce external dependencies, latency, and side effects.
//         Unit tests must be fast, isolated, and predictable.

// 4. How do we control what our dependency does?
// Answer: Use Mocktail's API to stub method behaviors and verify interactions.

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_demo/src/authentication/domain/repositories/auth_repository.dart';
import 'package:tdd_demo/src/authentication/domain/usecases/create_user.dart';

// Create a mock version of `AuthRepository` for testing.
// `MockAuthRepo` inherits from `Mock` (provided by Mocktail) and implements the real `AuthRepository`.
// This allows us to define fake behaviors for repository methods during tests.

class MockAuthRepo extends Mock implements AuthRepository {}

void main() {
  late CreateUser usecase;
  late AuthRepository authRepository;

  // setUp is a function used in unit and widget tests to define a block of code that should be
  // run before each test in a test group.
  setUp(() {
    // Code that runs before each test!!..
    authRepository = MockAuthRepo();
    usecase = CreateUser(authRepository);
  });

  final params = CreateUserParams.empty();
  test(
    'should call the [AuthRepo.createUser]',
    () async {
      // Arrange
      when(
        () => authRepository.createUser(
          // any works only with dart generic data types. String, int, float etc.
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        ),
      ).thenAnswer(
        // Inside right we can't put void
        (_) async => Right(null),
      );

      // Act

      final result = await usecase(params);

      // Assert

      expect(
        result,
        equals(const Right<dynamic, void>(null)),
      );

      verify(() => authRepository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar)).called(1);
      verifyNoMoreInteractions(authRepository);
    },
  );
}
