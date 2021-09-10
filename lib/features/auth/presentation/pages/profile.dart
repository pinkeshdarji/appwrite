import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_appwrite_demo/features/auth/presentation/notifiers/auth_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Consumer<AuthState>(
        builder: (context, state, child) {
          if (!state.isLoggedIn) return Container();
          return Column(
            children: <Widget>[
              const SizedBox(height: 10.0),
              Center(
                child: InkWell(
                  onTap: () => _uploadPic(context),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: file != null ? Image.file(
                      file,
                      //fit: BoxFit.cover,
                    ).image : null,
                  ),
                ),
              ),
              Center(
                  child: Text(
                state.user.name ?? '',
                style: Theme.of(context).textTheme.headline4,
              )),
              const SizedBox(height: 10.0),
              Center(child: Text(state.user.email)),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await state.logout();
                    Navigator.pop(context);
                  },
                  child: Text("Log out"),
                ),
              ),
              const SizedBox(height: 10.0),
            ],
          );
        },
      ),
    );
  }

  _uploadPic(BuildContext context) async {
    XFile image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      file = File(image.path);
    });
    if (file != null) {
      final upfile = await MultipartFile.fromFile(file.path,
          filename: file.path.split('/').last);
      AuthState state = context.read<AuthState>();
      Response res = await state.storage.createFile(
          file: upfile, read: ["*"], write: ["user:${state.user.id}"]);
      if (res.statusCode == 201) {
        String id = res.data["\$id"];

      }
    }
  }
}
