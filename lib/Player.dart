import 'dart:math';

class Player {
  String pseudo = "Bob";
  int _score;

  Player(this.pseudo, {int score = 0}) : _score = score; //{}

  int get score {
    return _score;
  }

  set score(int newValue) {
    if (newValue >= 0) {
      _score = newValue;
    }
  }

  partieGagnee() {
    _score += 10;
  }

  partiePerdue() {
    _score += min(_score, 10);
  }
}
