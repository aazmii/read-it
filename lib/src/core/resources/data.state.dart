class DataState<T> {
  final T? data;
  final String? error;

  DataState.success(this.data) : error = null;
  DataState.failure(this.error) : data = null;
}
