import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_demo/src/authentication/data/models/user_models.dart';
import 'package:tdd_demo/src/authentication/domain/enities/user.dart';

// What class depend on?
// User Model does not depend on anyone.

void main() {
  test('test should be the subclass of [User] entity.', () {
    // Arrange
    const tmodel = UserModels.empty();

    // Act

    // Assert
    expect(tmodel, isA<User>());
  });
  group('from map', () {
    test('should return a [UserModel] with right data.', () {
      // Arrange
      final tjason = File('test/fixtures/user.json').readAsStringSync();
      print(tjason); // Act

      // Assert
    });
  });
}
