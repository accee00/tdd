import 'package:tdd_demo/core/utils/typedef.dart';

abstract interface class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  // params are parameter required to a function.
  ResultFuture<Type> call(Params params);
}

abstract interface class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();
  ResultFuture<Type> call();
}
