import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testpage/userdata.dart';

class ApiData extends StatefulWidget{
  const ApiData({Key?key}): super(key: key);

  @override
  _ApiDataState createState()=> _ApiDataState();
}
class _ApiDataState extends State<ApiData>{
  Future<List<User>> fetchUser() async {
    var response =
    await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder<List<User>>(
            future: fetchUser(),
            builder: (context,snapshot) {
              print(snapshot.data);
              if (snapshot.hasData) {

                return Padding(
                    padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index){
                      var email = snapshot.data![index].email;
                      var first_name = snapshot.data![index].first_name;


                      return Card(
                        shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.green,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                        child: ListTile(
                        leading: Text(email.toString()),
                        trailing: Text(first_name.toString()),
                        ),
                        );
                      }
                  ),
                );
              }else{
                return Center(child: CircularProgressIndicator());
              }
              }
          ),
        ),
      ),
    );
  }
}
