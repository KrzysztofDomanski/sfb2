/// An abstract class representing a use case with a return type and parameters.
abstract class UseCase<ReturnType, Params> {
  Future<ReturnType> call(Params params);
}

/// A class representing no parameters for use cases that do not require any.
class NoParams {
  const NoParams();
}
