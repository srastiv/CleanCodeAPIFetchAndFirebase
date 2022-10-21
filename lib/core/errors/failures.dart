import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();
  @override
  List<Object?> get props => throw UnimplementedError();
}

//General Failures
class ServerFailure extends Failure {}
