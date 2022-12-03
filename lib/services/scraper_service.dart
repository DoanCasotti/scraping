import 'dart:developer';
import 'package:api/models/package_model.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';

class ScraperService {
  static List run(String html) {
    try {
      final soup = BeautifulSoup(html);
      final items = soup.findAll('div', class_: 'classificacao__pontos-corridos');
      List<PackageModel> packages = [];
      for (var item in items) {
     final times = item.findAll('td', class_: 'classificacao__equipes classificacao__equipes--nome').map((e) => e.text).toList();
     final pontos = item.find('td', class_: 'classificacao__pontos classificacao__pontos--ponto')?.text ?? '';
     final jogos = item.find('td', class_: 'classificacao__pontos'[1])?.text ?? '';
     final vitorias = item.find('td', class_: 'classificacao__pontos'[2])?.text ?? '';
     final empates = item.find('td', class_: 'classificacao__pontos'[3])?.text ?? '';
     final derrotas = item.find('td', class_: 'classificacao__pontos'[4])?.text ?? '';
     final golsPro = item.find('td', class_: 'classificacao__pontos'[5])?.text ?? '';
     final golsContra = item.find('td', class_: 'classificacao__pontos'[6])?.text ?? '';
     final saldoGols = item.find('td', class_: 'classificacao__pontos'[7])?.text ?? '';
     final perc = item.find('td', class_: 'classificacao__pontos'[8])?.text ?? '';

        PackageModel model = PackageModel(
          times: times,
          pontos: pontos,
          jogos: jogos,
          vitorias: vitorias,
          empates: empates,
          derrotas: derrotas,
          golsPro: golsPro,
          golsContra: golsContra,
          saldoGols: saldoGols,
          perc: perc,
        );
        packages.add(model);
      }
      return packages;
    } catch (e) {
      log('ScraperService => $e');
    }
    return [];
  }
}
