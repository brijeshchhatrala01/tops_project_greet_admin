// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names, no_logic_in_create_state

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../front/front.dart';

class AdminCategory extends StatefulWidget {
  var index;
  var category_name;
  AdminCategory(
      {super.key, @required this.index, @required this.category_name});

  @override
  AdminCategoryPage createState() =>
      AdminCategoryPage(category_id: index, category_nm: category_name);
}

class AdminCategoryPage extends State<AdminCategory> {
  var size;

  var category_id;
  var category_nm;
  AdminCategoryPage(
      {Key? key, @required this.category_id, @required this.category_nm});

  Future<List> viewCategoryItemsData() async {
    final responce = await http.get(Uri.parse(
        "https://zoological-wafer.000webhostapp.com/EWishes/category_images_view.php?data=$category_id"));
    return jsonDecode(responce.body);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kLightGold,
      appBar: AppBar(
        title: Text("$category_nm".toUpperCase(),
            style: const TextStyle(color: kGold, fontStyle: FontStyle.italic)),
        backgroundColor: kDarkBrown,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List>(
                future: viewCategoryItemsData(),
                builder: (ctx, ss) {
                  if (ss.hasData) {
                    return Items(list: ss.data!, size: size);
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  List list;
  var size;
  Items({super.key, required this.list, this.size});

  Future deleteCategoryImages(var id) async {
    var url =
        "https://zoological-wafer.000webhostapp.com/EWishes/category/category_sub_image_delete.php";
    await http.post(Uri.parse(url), body: {
      'data': id,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 1,
        crossAxisCount: 2,
        children: List.generate(list.length, (index) {
          return Column(
            children: [
              Image.network(
                list[index]['c_images'],
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return SizedBox(
                    height: size.height * 17.4 / 100,
                    child: const Center(
                      child: Icon(
                        Icons.error,
                        size: 40,
                        color: kLightGold,
                      ),
                    ),
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return SizedBox(
                    height: size.height * 17.4 / 104,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                height: size.height * 17.4 / 104,
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              Container(
                height: size.height * 5 / 100,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: kGold,
                ),
                child: ElevatedButton(
                  child: Text("Delete".toUpperCase(),
                      style: const TextStyle(
                          color: kTerracotta, fontStyle: FontStyle.italic)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        backgroundColor: kWhite,
                        title: const Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: kBrown,
                            ),
                            Text(
                              "\tDelete",
                              style: TextStyle(color: kBrown),
                            )
                          ],
                        ),
                        content: const Text(
                            "This image will be permanently deleted",
                            style: TextStyle(
                                color: kTerracotta,
                                fontStyle: FontStyle.italic)),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: const Text("Cancel",
                                style: TextStyle(color: kBrown)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              deleteCategoryImages(list[index]['c_id']);
                              // ignore: avoid_print
                              print(list[index]['c_id']);
                              Fluttertoast.showToast(
                                  msg: "Image deleted Successfully",
                                  toastLength: Toast.LENGTH_LONG,
                                  timeInSecForIosWeb: 1);
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const AdminFront()));
                            },
                            child: const Text("Delete",
                                style: TextStyle(color: kBrown)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
