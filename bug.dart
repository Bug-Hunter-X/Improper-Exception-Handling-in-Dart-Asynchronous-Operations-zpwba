```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Success! Process the JSON response
      final jsonData = jsonDecode(response.body);
      // Use the extracted data
      print(jsonData['key']);
    } else {
      // Handle errors
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    // Handle exceptions
    print('An error occurred: $e');
    // Rethrow the exception to be handled by a higher level
    rethrow;
  }
}
```