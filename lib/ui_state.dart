sealed class UiState {
  const UiState();
}

class Success<Type> extends UiState {
  final Type data;

  const Success(this.data);
}

class Failure extends UiState {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class Loading extends UiState {
  const Loading();
}
