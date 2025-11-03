import 'package:final_project/seed/vocabulary/seed_vocab_easy.dart';
import 'package:final_project/seed/vocabulary/seed_vocab_hard.dart';
import 'package:final_project/seed/vocabulary/seed_vocab_medium.dart';

Future<void> seedAllVocab() async {
  await seedVocabEasy();
  await seedVocabMedium();
  await seedVocabHard();
}
