import 'package:dartz/dartz.dart';
import 'package:sample_flutter_with_bloc/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
