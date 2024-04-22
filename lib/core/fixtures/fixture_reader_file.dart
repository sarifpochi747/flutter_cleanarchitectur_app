import 'package:flutter/services.dart' show rootBundle;

Future<String> fixture(String filename) async {
    // Read the file asynchronously using rootBundle
    return await rootBundle.loadString('lib/core/assets/$filename');
}
