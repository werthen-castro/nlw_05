class NiveisDificuldade {
  static const facil = 'Fácil';
  static const medio = 'Médio';
  static const dificil = 'Difícil';
  static const perito = 'Perito';
}

class ColorsNiveisDificuldade {
  static const color = 'color';
  static const borderColor = 'borderColor';
  static const fontColor = 'fontColor';
}

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}
