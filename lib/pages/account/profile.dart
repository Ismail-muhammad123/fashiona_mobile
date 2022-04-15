import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  var profile_pic = "";

  final InputDecoration inputDecoration =
      const InputDecoration(border: InputBorder.none);

  final TextStyle _inputLabelStyle = TextStyle(
    fontSize: 24.0,
    color: Colors.purple.withOpacity(0.5),
    fontWeight: FontWeight.w800,
  );

  final _inputBoxDecoration = BoxDecoration(
    border: Border.all(color: Colors.grey.withOpacity(0.4)),
    borderRadius: BorderRadius.circular(10.0),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
              Stack(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    child: profile_pic.isEmpty
                        ? const Center(
                            child: const Icon(Icons.person),
                          )
                        : Image.asset(profile_pic),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      child: const Icon(Icons.edit),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    bottom: 0,
                    right: 15,
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Email', style: _inputLabelStyle),
              ),
              Container(
                width: 300,
                decoration: _inputBoxDecoration,
                child: Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Name', style: _inputLabelStyle),
              ),
              Container(
                width: 300,
                decoration: _inputBoxDecoration,
                child: Expanded(
                  child: TextFormField(
                    decoration: inputDecoration,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Phone Number', style: _inputLabelStyle),
              ),
              Container(
                width: 300,
                decoration: _inputBoxDecoration,
                child: Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text('Address', style: _inputLabelStyle),
              ),
              Container(
                width: 300,
                decoration: _inputBoxDecoration,
                child: Expanded(
                  child: TextFormField(
                    minLines: 3,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
