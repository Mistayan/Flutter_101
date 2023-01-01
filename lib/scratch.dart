// void main(){
//   print("bonjour");
//   // final list<double> listeNotes = [];
//   final Map<String, int> scores = {};
//
//   scores["Sheldon"] = 3.14;
//   scores["Leonard"] = 19.11;
//
// }
//
// void main2(){
//   print("bonjour");
//   // final list<double> listeNotes = [];
//   final listNotes = double<>[];
//
//   listNotes.add(3.14);
//   listNotes.add(19.11);
//
// }

// https://fastlane.tools/

// demander à l'utilisateur une note sur une matière

import 'package:flutter_101/user_input.dart';

class Matieres {
  static const values = ["Maths", "Anglais", "Python", "Java", "..."];
}

class NotePad {
  // Table des matières, contenant les notes
  final String studentName;
  final classNotes = <String, List<double>>{};

  // CONSTRUCTOR
  NotePad(this.studentName);

  // PUBLIC METHODS
  void printNotes() {
    print(studentName);
    for (final mat in Matieres.values) {
      var total = 0.0;
      var i = 0;
      final notes = classNotes[mat];
      if (notes != null) {
        for (final note in notes) {
          total += note;
          i++;
        }
      }
      print("$mat\t: Moyenne: ${i != 0 ? total / i : "N/A"}\t"
          "Notes : ${notes ?? "Aucune"}");
    }
    print("");
  }

  void interact() {
    var run = true;
    do {
      final choice =
          readInt("1: Ajouter des note\n2:Afficher les notes\n3:Quitter");
      switch (choice) {
        case 1:
          final nomMatiere = __choixMatiere();
          __addNotes(nomMatiere);
          break;
        case 2:
          printNotes();
          break;
        case 3:
          run = false;
      }
    } while (run);
  }

  // PRIVATE METHODS
  void __addOneNoteToTable(String nomMatiere) {
    final note = readDouble("Note ? (0-20)");
    if (note >= 0.0 && note <= 20.0) {
      if (classNotes[nomMatiere] != null) {
        classNotes[nomMatiere]?.add(note);
      } else {
        classNotes[nomMatiere] = [note];
      }
    }
  }

  void __addNotes(String nomMatiere) {
    final nbNotes = readInt('Combien de notes à renseigner ?');
    for (var i = nbNotes; i > 0; i--) {
      __addOneNoteToTable(nomMatiere);
    }
  }

  String __choixMatiere() {
    var i = 0;
    // Display list
    for (final mat in Matieres.values) {
      print("${++i} : $mat");
    }

    var indexMatiere = 0;
    // Choose from list
    do {
      indexMatiere = readInt("Matière ?") -1;
    } while (indexMatiere < 0 && indexMatiere > i);
    return Matieres.values[indexMatiere];
  }
}
