import 'package:final_project/seed/study_materials/SW/seed_SW_materials.dart';
import 'package:final_project/seed/study_materials/SW/seed_SW_practice_part1.dart';
import 'package:final_project/seed/study_materials/SW/seed_SW_practice_part2.dart';
import 'package:final_project/seed/study_materials/SW/seed_SW_practice_part3.dart';
import 'package:final_project/seed/study_materials/SW/seed_SW_practice_part4.dart';
import 'package:final_project/seed/study_materials/SW/seed_SW_practice_part5.dart';
import 'package:final_project/seed/study_materials/SW/seed_SW_practice_part6.dart';
import 'package:final_project/seed/study_materials/SW/seed_SW_practice_part7.dart';

Future<void> seedAllSW() async {
  await seedSWPracticePart1();
  await seedSWPracticePart2();
  await seedSWPracticePart3();
  await seedSWPracticePart4();
  await seedSWPracticePart5();
  await seedSWPracticePart6();
  await seedSWPracticePart7();
  await seedSWMaterials();
}
