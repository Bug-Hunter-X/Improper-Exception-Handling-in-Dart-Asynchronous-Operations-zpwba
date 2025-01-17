```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(jsonData['key']);
    } else {
      // Handle HTTP errors specifically
      throw HttpException('HTTP error! Status code: ${response.statusCode}');
    }
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('Invalid JSON format: $e');
  } on SocketException catch (e) {
    // Handle network errors
    print('Network error: $e');
  } on HttpException catch (e) {
    //Handle HTTP errors
    print('HTTP Error: $e');
  } catch (e) {
    // Handle any other unexpected exceptions
    print('An unexpected error occurred: $e');
    // Consider logging details for debugging
  }
}
```