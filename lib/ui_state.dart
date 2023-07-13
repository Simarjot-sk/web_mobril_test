///Represents the state of any action that the user might perform
///It can be either [Loading], [Success] or [Failure]
sealed class UiState<DATA> {
  const UiState();
}

class Success<DATA> extends UiState<DATA> {
  final DATA data;

  const Success(this.data);
}

class Failure<DATA> extends UiState<DATA> {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class Loading<DATA> extends UiState<DATA> {
  const Loading();
}
