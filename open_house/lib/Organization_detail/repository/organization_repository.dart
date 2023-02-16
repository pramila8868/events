//
import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:open_house/model/organization_detail.dart';

// class OrganizationRepository {
//   Future<List<OrganizationDetail>> getAll() async {
//     const url =
//         "https://api.revelarena.com/v1/organizer/ccdd7901-f6fc-42e8-9e2d-eaae5365baf0/organizer-detail";

//     final uri = Uri.parse(url);
//     final response = await http.get(uri);

//     print(response);
//     if (response.statusCode == 200) {
//       final json = jsonDecode(response.body) as Map<String,
//           dynamic>; //as List;.map((e)=>PastEvent.fromMap(e)).toList();
//       print(json.toString());
//       final List<dynamic> userlist = json[""] ?? [];
//       final result = json.map((e) {
//         return OrganizationDetail(
//             id: e["id"],
//             name: e["name"],
//             image: e["image"],
//             description: e["description"],
//             pastEventCount: e["pastEventCount"],
//             upcomingEventCount: e["upcomingEventCount"],
//             isFollowed: e["isFollowed"],
//             followersCount: e["followersCount"]);
//       }).toList();
//       print("result");
//       print(result);
//       return result;
//     } else {
//       throw "Something went wrong ${response.statusCode}";
//     }
//   }
// }
// //     final List<dynamic> userlist=json[""] ??[];
//     return userlist.map((e) => OrganizationDetail.from(e)).toList();
// }
// }

String url =
    "https://api.revelarena.com/v1/organizer/ccdd7901-f6fc-42e8-9e2d-eaae5365baf0/organizer-detail";

class OrganizationRepository {
  Future<OrganizationDetail> getOrganization() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      //__________-------
      OrganizationDetail organizationdetail = OrganizationDetail.fromJson(data);

      print(data);
      return organizationdetail;
    } else {
      throw Exception('Failed to load organization');
    }
  }
}
