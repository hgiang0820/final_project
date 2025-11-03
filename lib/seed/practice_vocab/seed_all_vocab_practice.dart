import 'package:final_project/seed/practice_vocab/seed_vocab_practice_easy.dart';
import 'package:final_project/seed/practice_vocab/seed_vocab_practice_hard.dart';
import 'package:final_project/seed/practice_vocab/seed_vocab_practice_medium.dart';
import 'package:final_project/seed/practice_vocab/seed_vocab_practice_pdf.dart';

Future<void> seedAllVocabPractice() async {
  await seedVocabPracticePdf();
  await seedVocabPracticeEasy();
  await seedVocabPracticeMedium();
  await seedVocabPracticeHard();

  print('Seed all vocab practice done!');
}
