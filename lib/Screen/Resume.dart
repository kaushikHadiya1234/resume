import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prectics/ResumeModal.dart';
import 'package:prectics/pdf.dart';

class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  List edList = ["B.B.A", "B.com", "B.Tech", "Diploma", "B.C.A"];
  List expList = ['1', '2', '5', '10', '12'];
  List skillList = [false, false, false, false, false, false, false];
  bool Exp = false;
  String? filed;
  String? f;
  String gender = "Male";
  RangeValues rangeValues = RangeValues(10000, 25000);
  Color c1 = Colors.white;
  Color textcolor = Colors.black;
  bool mode = false;
  Color light = Colors.white;
  Color dark = Colors.black;

  TextEditingController textname = TextEditingController();
  TextEditingController textadd = TextEditingController();
  TextEditingController textbio = TextEditingController();
  TextEditingController textemail = TextEditingController();
  TextEditingController textno = TextEditingController();

  String? path;

  var txtkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: WillPopScope(
        onWillPop: back,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: c1,
            appBar: AppBar(
              title: Text("Personal details"),
              centerTitle: true,
              actions: [
                PopupMenuButton(
                  itemBuilder: (context) => [
                    PopupMenuItem(child: Text("Settings")),
                    PopupMenuItem(child: Text("Profile")),
                    PopupMenuItem(child: Text("Help")),
                    PopupMenuItem(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                if (mode == false) {
                                  c1 = light;
                                  textcolor = Colors.black;
                                  mode = true;
                                } else {
                                  c1 = dark;
                                  textcolor = Colors.white;
                                  mode = false;
                                }
                              });
                            },
                            child: Text("Change theme"))),
                    PopupMenuItem(child: Text("Log out")),
                  ],
                )
              ],
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red[100]),
                    child: path == null?
                        CircleAvatar(
                          backgroundImage: AssetImage("assets/images/my.jpg"),radius: 70,
                        ):
                    CircleAvatar(
                      backgroundImage: FileImage(File("$path")),radius: 70,
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () async {

                              ImagePicker imagepicker = ImagePicker();
                              XFile? xfile = await imagepicker.pickImage(
                                  source: ImageSource.camera);
                              print("======================= ${xfile!.path}");
                              setState(() {
                                path = xfile!.path;
                                print("==================== $path");
                              });
                            },
                            child: Text("Camera")),
                        SizedBox(width: 10),
                        ElevatedButton(
                            onPressed: () async {
                              print("======================= START =============");
                              ImagePicker imagepicker = ImagePicker();
                              XFile? xfile = await imagepicker.pickImage(source: ImageSource.gallery);
                              setState(() {
                                path = xfile!.path;
                                print("=============== PATH   $path");
                              });
                            },
                            child: Text("Gallery"))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      maintainState: true,
                      leading: Icon(Icons.person),
                      title: Text(
                        "Personal info",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      // backgroundColor: Colors.blue[200],
                      // collapsedBackgroundColor: Colors.white,
                      collapsedTextColor: Colors.blue,
                      collapsedIconColor: Colors.blue,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter the Name";
                                  }
                                  return null;
                                },
                                controller: textname,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  label: Text(
                                    "Full Name",
                                    style: TextStyle(color: Colors.blue[200]),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter the Address";
                                  }
                                  return null;
                                },
                                controller: textadd,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  label: Text(
                                    "Address",
                                    style: TextStyle(color: Colors.blue[200]),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter the Bio";
                                  }
                                  return null;
                                },
                                controller: textbio,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  label: Text(
                                    "bio",
                                    style: TextStyle(color: Colors.blue[200]),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter the E-mail";
                                  }
                                  return null;
                                },
                                controller: textemail,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  label: Text(
                                    "E-mail",
                                    style: TextStyle(color: Colors.blue[200]),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter the Number";
                                  }
                                  if (value.length != 10) {
                                    return "Please Enter the valid Number";
                                  }
                                  return null;
                                },
                                controller: textno,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                    label: Text(
                                      "Contact No",
                                      style: TextStyle(color: Colors.blue[200]),
                                    ),
                                    hintText: "+91"),
                              ),
                              SizedBox(height: 10),
                              ExpansionTile(
                                leading: Text("Gender"),
                                title: Text(""),
                                collapsedTextColor: Colors.blue,
                                children: [
                                  RadioListTile(
                                    value: "Male",
                                    activeColor: textcolor,
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value!;
                                      });
                                    },
                                    title: Text(
                                      "Male",
                                      style: TextStyle(color: textcolor),
                                    ),
                                  ),
                                  RadioListTile(
                                    value: "Female",
                                    activeColor: textcolor,
                                    // selectedTileColor: Colors.white,
                                    groupValue: gender,
                                    onChanged: (value) {
                                      setState(() {
                                        gender = value!;
                                      });
                                    },
                                    title: Text(
                                      "Female",
                                      style: TextStyle(color: textcolor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      leading: Icon(Icons.cast_for_education),
                      title: Text("Education"),
                      collapsedTextColor: Colors.blue,
                      collapsedIconColor: Colors.blue,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                              autofocus: true,
                              selectedItemBuilder: (BuildContext context) =>
                                  edList
                                      .map((e) => Text(
                                            "$e",
                                            style: TextStyle(color: textcolor),
                                          ))
                                      .toList(),
                              items: edList
                                  .map((e) => DropdownMenuItem(
                                        child: Text("$e"),
                                        value: e,
                                      ))
                                  .toList(),
                              value: filed,
                              hint: Text(
                                "---Select---",
                                style: TextStyle(color: textcolor),
                              ),
                              alignment: Alignment.center,
                              isExpanded: true,
                              onChanged: (value) {
                                setState(() {
                                  filed = value as String;
                                });
                              }),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Select Salary",
                          style: TextStyle(fontSize: 18, color: Colors.blue),
                        ),
                        SizedBox(height: 5),
                        RangeSlider(
                          values: rangeValues,
                          onChanged: (value) {
                            setState(() {
                              rangeValues = value;
                            });
                          },
                          divisions: 20,
                          min: 10000,
                          max: 100000,
                          labels: RangeLabels("${rangeValues.start.round()}",
                              "${rangeValues.end.round()}"),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      leading: Icon(Icons.ac_unit),
                      title: Text("Skill"),
                      collapsedTextColor: Colors.blue,
                      collapsedIconColor: Colors.blue,
                      children: [
                        Column(
                          children: [
                            CheckboxListTile(
                              value: skillList[0],
                              side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                                    BorderSide(width: 1.0, color: textcolor),
                              ),
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  skillList[0] = value!;
                                });
                              },
                              title: Text(
                                "Coding",
                                style: TextStyle(color: textcolor),
                              ),
                            ),
                            CheckboxListTile(
                              value: skillList[1],
                              side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                                    BorderSide(width: 1.0, color: textcolor),
                              ),
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  skillList[1] = value!;
                                });
                              },
                              title: Text(
                                "Animation",
                                style: TextStyle(color: textcolor),
                              ),
                            ),
                            CheckboxListTile(
                              value: skillList[2],
                              side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                                    BorderSide(width: 1.0, color: textcolor),
                              ),
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  skillList[2] = value!;
                                });
                              },
                              title: Text(
                                "Gaming",
                                style: TextStyle(color: textcolor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      leading: Icon(Icons.accessibility_sharp),
                      title: Text("Hobby"),
                      collapsedTextColor: Colors.blue,
                      collapsedIconColor: Colors.blue,
                      children: [
                        Column(
                          children: [
                            CheckboxListTile(
                              // checkColor: Colors.white,
                              side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                                    BorderSide(width: 1.0, color: textcolor),
                              ),
                              value: skillList[3],
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  skillList[3] = value!;
                                });
                              },

                              title: Text(
                                "Reading",
                                style: TextStyle(color: textcolor),
                              ),
                            ),
                            CheckboxListTile(
                              value: skillList[4],
                              side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                                    BorderSide(width: 1.0, color: textcolor),
                              ),
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  skillList[4] = value!;
                                });
                              },
                              title: Text(
                                "Camping",
                                style: TextStyle(color: textcolor),
                              ),
                            ),
                            CheckboxListTile(
                              value: skillList[5],
                              side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                                    BorderSide(width: 1.0, color: textcolor),
                              ),
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  skillList[5] = value!;
                                });
                              },
                              title: Text(
                                "Dancing",
                                style: TextStyle(color: textcolor),
                              ),
                            ),
                            CheckboxListTile(
                              value: skillList[6],
                              side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                                    BorderSide(width: 1.0, color: textcolor),
                              ),
                              activeColor: Colors.blue,
                              onChanged: (value) {
                                setState(() {
                                  skillList[6] = value!;
                                });
                              },
                              title: Text(
                                "Yoga",
                                style: TextStyle(color: textcolor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person_pin,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Experience",
                        style: TextStyle(color: Colors.blue),
                      ),
                      trailing: Switch(
                          value: Exp,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              Exp = value;
                            });
                          }),
                      // tileColor: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Visibility(
                      visible: Exp,
                      child: DropdownButton(
                          selectedItemBuilder: (BuildContext context) => expList
                              .map((e) => Text(
                                    "$e",
                                    style: TextStyle(color: textcolor),
                                  ))
                              .toList(),
                          items: expList
                              .map((e) => DropdownMenuItem(
                                    child: Text("$e"),
                                    value: e,
                                  ))
                              .toList(),
                          value: f,
                          hint: Text(
                            "---Select Years---",
                            style: TextStyle(color: textcolor),
                          ),
                          alignment: Alignment.center,
                          isExpanded: true,
                          onChanged: (value) {
                            setState(() {
                              f = value as String;
                            });
                          }),
                    ),
                  ),
                  SizedBox(height: 10),
                  FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        var name = textname.text;
                        var add = textadd.text;
                        var bio = textbio.text;
                        var email = textemail.text;
                        var no = textno.text;

                        var skill = '';

                        if (skillList[0] == true) {
                          skill = "$skill Coding,";
                        }
                        if (skillList[1] == true) {
                          skill = "$skill Animation,";
                        }
                        if (skillList[2] == true) {
                          skill = "$skill Gaming,";
                        }

                        var hobby = '';

                        if (skillList[3] == true) {
                          hobby = "$hobby Reading,";
                        }
                        if (skillList[4] == true) {
                          hobby = "$hobby Camping,";
                        }
                        if (skillList[5] == true) {
                          hobby = "$hobby Dancing,";
                        }
                        if (skillList[6] == true) {
                          hobby = "$hobby Yoga,";
                        }

                        ResumeModal r = ResumeModal(
                            name: name,
                            add: add,
                            img: path,
                            bio: bio,
                            email: email,
                            cno: no,
                            gender: gender,
                            skill: skill,
                            hobby: hobby,
                            filled: filed,
                            R: rangeValues,
                            f: f);

                        if (txtkey.currentState!.validate()) {
                          // Navigator.pushNamed(context, 'data', arguments: r);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Data sumit sucessfull"),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.grey,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ));
                          pdfMaker(r);
                        }
                      });
                    },
                    label: Text("Submit"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showExitDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Are you sure for exit"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      exit(0);
                    });
                  },
                  child: Text("Yes"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text("No"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          );
        });
  }

  Future<bool> back() async {
    showExitDialog();
    return await false;
  }
}
