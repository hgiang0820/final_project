import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget {
  const Dropdown({super.key});

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? selectedOption1;
  String? selectedOption2;

  final List<String> options1 = ['Option A1', 'Option B1', 'Option C1'];
  final List<String> options2 = ['Option A2', 'Option B2', 'Option C2'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedOption1,
      decoration: const InputDecoration(labelText: 'Dropdown 1'),
      items: options1.map((item) {
        return DropdownMenuItem(value: item, child: Text(item));
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedOption1 = value;
        });
      },
    );

    // return Card(
    //   elevation: 4,
    //   margin: const EdgeInsets.all(20),
    //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //   child: Padding(
    //     padding: const EdgeInsets.all(16),
    //     child: Column(
    //       children: [
    //         DropdownButtonFormField<String>(
    //           value: selectedOption1,
    //           decoration: const InputDecoration(labelText: 'Dropdown 1'),
    //           items: options1.map((item) {
    //             return DropdownMenuItem(value: item, child: Text(item));
    //           }).toList(),
    //           onChanged: (value) {
    //             setState(() {
    //               selectedOption1 = value;
    //             });
    //           },
    //         ),
    //         const SizedBox(height: 20),
    //         DropdownButtonFormField<String>(
    //           value: selectedOption2,
    //           decoration: const InputDecoration(labelText: 'Dropdown 2'),
    //           items: options2.map((item) {
    //             return DropdownMenuItem(value: item, child: Text(item));
    //           }).toList(),
    //           onChanged: (value) {
    //             setState(() {
    //               selectedOption2 = value;
    //             });
    //           },
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
