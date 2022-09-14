import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

/// Notice To Every Failure Will do throw in exceptions file
class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

// No Posts
class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

/// throw OfflineException()
/// return Left(OfflineFailure())