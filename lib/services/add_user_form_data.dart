// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import 'package:scaleup_ally_task/main.dart';
// import 'package:scaleup_ally_task/models/user_form_model.dart';
// import "package:http/http.dart" as http;
// import 'package:async/async.dart';

// class UserFormDataService {
//   static adduserformData(
//       {required String name,
//       required String email,
//       required String dob,
//       required String gender,
//       required String userStatus,
//       required File? image}) async {
//     var _dio = GetIt.I<Dio>();
//     _dio.options.headers["Content-Type"] = "multipart/form-data";

//     FormData formData = FormData.fromMap({
//       "email": email,
//       // "name": name,
//       // "image": await MultipartFile.fromFile(image!.path,
//       //     filename: image.path.split("/").last),
//       // "dob": dob,
//       // "gender": gender,
//       // "user_status": userStatus,
//     });

//     var res = await http
//         .post(Uri.parse("https://anaajapp.com/api/user/submit_details"), body: {
//       "name": name,
//       "email": "ramguig@gmail.com",
//       // "image": await MultipartFile.fromFile(image!.path,
//       //     filename: image.path.split("/").last),
//       "dob": dob,
//       "gender": gender,
//       "user_status": userStatus,
//     });

//     print(res.body);
//   }

//   uploadFile({File? iamge}) async {
//     var postUri = Uri.parse("https://anaajapp.com/api/user/submit_details");
//     var request = http.MultipartRequest("POST", postUri);
//     request.fields['image'] = 'blah';
//     request.files.add(http.MultipartFile.fromBytes(
//       'file',
//       await File.fromUri(iamge!.uri).readAsBytes(),
//     ));

//     request.send().then((response) {
//       if (response.statusCode == 200) print("Uploaded!");
//     });
//   }

//   static void uploadImage1(File _image) async {
//     // open a byteStream
//     var stream = http.ByteStream(DelegatingStream.typed(_image.openRead()));
//     // get file length
//     var length = await _image.length();

//     // string to uri
//     var uri = Uri.parse("enter here upload URL");

//     // create multipart request
//     var request = http.MultipartRequest("POST", uri);

//     // if you need more parameters to parse, add those like this. i added "user_id". here this "user_id" is a key of the API request
//     request.fields["user_id"] = "text";

//     // multipart that takes file.. here this "image_file" is a key of the API request
//     var multipartFile = http.MultipartFile('image_file', stream, length,
//         filename: basename(_image.path));

//     // add file to multipart
//     request.files.add(multipartFile);

//     // send request to upload image
//     await request.send().then((response) async {
//       // listen for response
//       response.stream.transform(utf8.decoder).listen((value) {
//         print(value);
//       });
//     }).catchError((e) {
//       print(e);
//     });
//   }
// }

import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

Future adduserformData(
    {required String name,
    required String email,
    required String dob,
    required String gender,
    required String userStatus,
    required File? image}) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse("https://anaajapp.com/api/user/submit_details"));

  request.fields['email'] = email;
  request.fields['name'] = name;
  request.fields['dob'] = dob;
  request.fields['gender'] = gender;
  request.fields["user_status"] = userStatus;
  request.files.add(await http.MultipartFile.fromPath('image', image!.path));
  var response = await request.send();
  print(response.stream);
  print(response.statusCode);
  final res = await http.Response.fromStream(response);
  print(res.body);
}
