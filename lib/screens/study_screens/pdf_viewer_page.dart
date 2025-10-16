import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatelessWidget {
  final String pdfUrl;
  final Future<void> Function()? onDone;

  const PdfViewerPage({super.key, required this.pdfUrl, this.onDone});

  Future<void> _handleDone(BuildContext context) async {
    try {
      if (onDone != null) {
        await onDone!(); // cập nhật Firestore (mark done)
      }
      if (context.mounted) Navigator.pop(context); // quay lại StudyPage
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi cập nhật trạng thái: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: const Text("Xem PDF"),
        actions: [
          TextButton.icon(
            onPressed: () => _handleDone(context),
            icon: const Icon(Icons.check, color: Colors.white),
            label: const Text(
              "Done",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.green[400]),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SfPdfViewer.network(pdfUrl),
    );
  }
}
