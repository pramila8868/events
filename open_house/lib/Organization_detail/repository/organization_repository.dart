//
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:open_house/model/organization_detail.dart';
import 'package:open_house/model/past_model.dart';

// for api call
class OrganizationRepository {
  Future<List<OrganizationDetail>> getAll() async {
    const url =
        "https://api.revelarena.com/v1/organizer/ccdd7901-f6fc-42e8-9e2d-eaae5365baf0/organizer-detail";

    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = (jsonDecode(response.body)
          as List); //as List;.map((e)=>PastEvent.fromMap(e)).toList();
      //print(json.toString());
      final result = json.map((e) {
        return OrganizationDetail(
            id: e["id"],
            name: e["name"],
            image: e["image"],
            description: e["description"],
            pastEventCount: e["pastEventCount"],
            upcomingEventCount: e["upcomingEventCount"],
            isFollowed: e["isFollowed"],
            followersCount: e["followersCount"]);
      }).toList();
      print("result");
      print(result);
      return result;
    } else {
      throw "Something went wrong ${response.statusCode}";
    }
  }
}
