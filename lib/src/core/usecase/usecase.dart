abstract class UseCase<T, P> {
  T call({P p});
}

abstract class AsyncUseCase<Typ, Params> {
  Future<Typ> call({Params p});
}

abstract class StreamUseCase<Typ, Params> {
  Stream<Typ> call({Params p});
}
