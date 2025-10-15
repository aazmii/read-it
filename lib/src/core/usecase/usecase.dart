abstract class UseCase<Typ, Params> {
  Future<Typ> call({Params p});
}

abstract class StreamUseCase<Typ, Params> {
  Stream<Typ> call({Params p});
}
