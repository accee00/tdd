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

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_demo/src/authentication/domain/repositories/auth_repository.dart';

// Create a mock version of `AuthRepository` for testing.
// `MockAuthRepo` inherits from `Mock` (provided by Mocktail) and implements the real `AuthRepository`.
// This allows us to define fake behaviors for repository methods during tests.
class MockAuthRepo extends Mock implements AuthRepository {}

void main() {
  // description should be what this unit does.
  test('Should call the[AuthRepo.createUser()]', () async {
    // Arrange

    // Act

    // Assert
  });
}
