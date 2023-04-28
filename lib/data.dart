import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prectics/ResumeModal.dart';

class Data extends StatefulWidget {
  const Data({Key? key}) : super(key: key);

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    ResumeModal r = ModalRoute.of(context)!.settings.arguments as ResumeModal;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 190,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          width: 230,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Full Name",style: TextStyle(
                                    fontSize: 15,color: Colors.black
                                  ),),
                                ),
                                SizedBox(height: 6),
                                Container(
                                  height: 40,
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black,width: 1)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${r.name}",style: TextStyle(fontSize: 15),),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Address",style: TextStyle(
                                      fontSize: 15,color: Colors.black
                                  ),),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  height: 80,
                                  width: double.infinity,
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black,width: 1)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${r.add}",style: TextStyle(fontSize: 15),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 150,
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Container(
                          height: 180,
                          width: 130,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black,width: 2)
                          ),
                          child: Text("Photo",style: TextStyle(
                            fontSize: 20,color: Colors.black
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Data('Bio',"${r.bio}"),
                   SizedBox(height: 10),
                   Data('E-mail',"${r.email}"),
                   SizedBox(height: 10),
                   Data('Contact No',"${r.cno}"),
                   SizedBox(height: 10),
                   Data('Gender',"${r.gender}"),
                   SizedBox(height: 10),
                   Data('Education',"${r.filled}"),
                   SizedBox(height: 10),
                   Data('Skill',"${r.skill}"),
                   SizedBox(height: 10),
                   Data('Hobby',"${r.hobby}"),
                   SizedBox(height: 10),
                   Data('Experience',"${r.f}"),
                   // Text("${r.R}"),
                 ],
               )
              ],
            ),
          ),
        )

      ),
    );
  }

  Widget Data(String a,String b) {
    return  Container(
      height: 50,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
                height:50,
                width: 90,
                alignment: Alignment.centerLeft,
                child: Text("$a :-",style: TextStyle(fontSize: 15,color: Colors.black),)),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Container(
              height: 50,
              width: 200,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black,width: 1)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${b}",style: TextStyle(fontSize: 15),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
