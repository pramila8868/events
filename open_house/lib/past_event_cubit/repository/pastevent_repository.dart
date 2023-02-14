//
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_house/model/past_model.dart';

// for api call
class PastEventRepository {
  Future<List<PastEvent>> getAll() async {
    const url =
        "https://api.revelarena.com/v1/organizer/ccdd7901-f6fc-42e8-9e2d-eaae5365baf0/event-list?date_before=2023-02-09";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = (jsonDecode(response.body)["results"]
          as List); //as List;.map((e)=>PastEvent.fromMap(e)).toList();
      print(json.toString());
      final result = json.map((e) {
        return PastEvent(
            id: e["id"],
            image: e["image"],
            isInterested: e["isInterested"],
            name: e["name"],
            venue: e["venue"]);
      }).toList();
      print("result");
      print(result);
      return result;
    } else {
      throw "Something went wrong ${response.statusCode}";
    }
  }
}
