class PackageModel {
  List<String> times;
  String pontos;
  String jogos;
  String vitorias;
  String empates;
  String derrotas;
  String golsPro;
  String golsContra;
  String saldoGols;
  String perc;
  PackageModel({
    required this.times,
    required this.pontos,
    required this.jogos,
    required this.vitorias,
    required this.empates,
    required this.derrotas,
    required this.golsPro,
    required this.golsContra,
    required this.saldoGols,
    required this.perc,
  });


  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      times: List<String>.from(map['times']),
      pontos: map['pontos'] ?? '',
      jogos: map['jogos'] ?? '',
      vitorias: map['vitorias'] ?? '',
      empates: map['empates'] ?? '',
      derrotas: map['derrotas'] ?? '',
      golsPro: map['golsPro'] ?? '',
      golsContra: map['golsContra'] ?? '',
      saldoGols: map['saldoGols'] ?? '',
      perc: map['perc'] ?? '',
    );
  }
}
