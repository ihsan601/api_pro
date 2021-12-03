import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'model/data_model.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Data_model moddel = Data_model();
   // var data;
  Future<Data_model> getdata() async {
    final response = await http.get(
        Uri.https('api.openweathermap.org', '/data/2.5/weather?q=mardan&appid=1cc7533ce7626451bef2fae4ade8aa5a'));
    var data1 = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return Data_model.fromJson(data1);
    } else {
      return Data_model.fromJson(data1);
    }
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        children: [
          Expanded(
            child: FutureBuilder<Data_model>(
              future: getdata(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  // return Text(snapshot.data.main.temp.toString());
                  return ListView.builder(
                     itemCount: snapshot.data.data.length,
                         itemBuilder: (context, i) {
                       return Text(snapshot.data.data[i].main.temp.toString());
        },
      );
    }return Text('');

                //   return ListView.builder(
                //     itemCount: snapshot.data.data.length,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           ListTile(
                //             title: Text(snapshot.data.data[index].shop.name.toString()),
                //             subtitle: Text(snapshot.data.data[index].shop.shopemail.toString()),
                //             leading: CircleAvatar(
                //               backgroundImage: NetworkImage(snapshot.data.data[index].shop.image.toString()),
                //             ),
                //           ),
                //           Container(
                //               height: MediaQuery.of(context).size.height*.33,
                //               width: MediaQuery.of(context).size.width* 1,
                //
                //               child: ListView.builder(
                //                 scrollDirection: Axis.horizontal,
                //                 itemCount: snapshot.data.data[index].images.length,
                //                 itemBuilder: (context, pos) {
                //
                //                   return Padding(
                //                     padding: const EdgeInsets.only(right: 5),
                //                     child: Container(
                //                       height: MediaQuery.of(context).size.height*.25,
                //                       width: MediaQuery.of(context).size.width*.5,
                //
                //                       decoration: BoxDecoration(
                //                           image: DecorationImage(
                //                             fit: BoxFit.cover,
                //                             image: NetworkImage(snapshot.data.data[index].images[pos].url.toString()),
                //                           )
                //                       ),
                //                     ),
                //                   );
                //                 },
                //               )
                //           ),
                //           Icon(snapshot.data.data[index].inWishlist == true ? Icons.favorite : Icons.favorite_border_outlined)
                //         ],
                //       );
                //     },
                //   );
                // }
                // return Text('');
              }),
          ),
        ],
    ),
      ),
    );
  }
}
