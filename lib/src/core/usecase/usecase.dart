abstract class UseCase<Typ, Params> {
  Future<Typ> call({Params p});
}
