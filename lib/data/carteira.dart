class Carteira {
  String papel;

  Carteira(this.papel);

  factory Carteira.fromJson(dynamic json) {
    return Carteira(json['papel'] as String);
  }

  @override
  String toString() {
    return '{ ${this.papel} }';
  }
}