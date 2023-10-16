import 'package:http/http.dart' as http;
import 'package:projet/model/post_model.dart';

var base = "https://dummyjson.com";

getPost() async {
  Uri url = Uri.parse("$base/products");
  var res = await http.get(url);

  try {
    if (res.statusCode == 200) {
      var data = welcomeFromJson(res.body);
      return data.products;
    } else {
      print("error during connection");
    }
  } catch (e) {
    print(e.toString());
  }
}
