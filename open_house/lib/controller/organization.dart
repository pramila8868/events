// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:open_house/model/organization_detail.dart';

// // json start with obj not in array
// String baseUri =
//     "https://api.revelarena.com/v1/organizer/ccdd7901-f6fc-42e8-9e2d-eaae5365baf0/organizer-detail";

// List<OrganizationDetail> userList =
//     []; // needed WHEN  we donot have array name IN MODEL OF URL
// Future<List<OrganizationDetail>> fetchMobileDetails() async {
//   final response = await http.get(Uri.parse(baseUri));
//   var datas = json.decode(response.body);
//   //final finalList = datas is List ? json : [jsonData];
//   // var datas = response.body;
//   var finalList = [datas];
//   // Map finalList = datas; // extra

//   print(datas.toString());

//   // all data are comes in datas
//   if (response.statusCode == 200) {
//     for (Map<String, dynamic> products in finalList) {
//       userList.add(OrganizationDetail.fromJson(products));
//     }

//     print("userlist is $userList ");
//     return userList;
//   } else {
//     throw Exception('Failed to load album');
//   }
// }
// //}
