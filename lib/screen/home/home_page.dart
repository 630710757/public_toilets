// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:ffi';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:public_toilets/models/toilet.dart';
import 'package:public_toilets/repositories/toilet_repository.dart';
import 'package:public_toilets/screen/home/toilet_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _toiletNameController = TextEditingController();
  //name,point,distance

  @override
  void initState() {
    super.initState();
    var data = ToiletRepository.readJsonData('assets/data/toilets.json');
      data.then(getResult);
  }

  getResult(String result){
    debugPrint(result);
    List list = jsonDecode(result);
    List<Toilet> toiletList = list.map((item) => Toilet.fromJson(item)).toList();

    setState(() {
      ToiletRepository.toilets = toiletList;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Public Toilets'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ToiletRepository.toilets.length,
              itemBuilder: (ctx, i) {
                Toilet toilet = ToiletRepository.toilets[i];
                return ToiletListItem(
                  toilet: toilet,
                );
              },
            ),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _toiletNameController,
                  decoration: InputDecoration(
                    hintText: 'name toilet plsssss',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 5,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        //controller: _toiletPointController,
                        decoration: InputDecoration(
                          hintText: 'give score plsssss',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 5,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        //controller: _toiletDistanceController,
                        decoration: InputDecoration(
                          hintText: 'distance',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 5,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _toiletNameController.text;
                      var toiletName = _toiletNameController.text;
                      //homework!!!!!
                      var toilet =
                          Toilet(name: toiletName, point: 3.0, distance: 530.6);
                      //input point,input distance
                      setState(() {
                        ToiletRepository.toilets.add(toilet);
                      });
                      _toiletNameController.clear();
                    },
                    child: Text('add'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
