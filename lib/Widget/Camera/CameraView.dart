import 'dart:io';

import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({
    Key? key,
    required this.path,
    required this.onImagesend,
  }) : super(key: key);
  final String path;
  final Function onImagesend;
  static TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.crop_rotate_outlined,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.emoji_emotions_outlined,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.title,
                size: 27,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                size: 27,
              ))
        ],
      ),
      body: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 18),
                  child: TextFormField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    maxLines: 6,
                    minLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add caption .........",
                        prefixIcon: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.white,
                          size: 27,
                        ),
                        hintStyle: TextStyle(color: Colors.white, fontSize: 17),
                        suffix: InkWell(
                          onTap: () {
                            onImagesend(
                              path, 
                              _controller.text.trim()
                              
                              );
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.tealAccent[700],
                            radius: 27,
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          ),
                        )),
                  ),
                ))
          ]),
        )
      ]),
    );
  }
}
