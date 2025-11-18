import 'package:final_project/seed/study_materials/LR/seed_LR_materials.dart';
import 'package:final_project/seed/study_materials/LR/seed_LR_practice_part1.dart';
import 'package:final_project/seed/study_materials/LR/seed_LR_practice_part2.dart';
import 'package:final_project/seed/study_materials/LR/seed_LR_practice_part3.dart';
import 'package:final_project/seed/study_materials/LR/seed_LR_practice_part4.dart';
import 'package:final_project/seed/study_materials/LR/seed_LR_practice_part5.dart';
import 'package:final_project/seed/study_materials/LR/seed_LR_practice_part6.dart';
import 'package:final_project/seed/study_materials/LR/seed_LR_practice_part7.dart';

Future<void> seedAllLR() async {
  await seedLRPracticePart1();
  await seedLRPracticePart2();
  await seedLRPracticePart3();
  await seedLRPracticePart4();
  await seedLRPracticePart5();
  await seedLRPracticePart6();
  await seedLRPracticePart7();
  await seedLRMaterials();
}
