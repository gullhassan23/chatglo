// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:chatglo/Model/MessageModel.dart';
import 'package:chatglo/Widget/Camera/Camera.dart';
import 'package:chatglo/Widget/Messages/Reply.dart';
import 'package:chatglo/Widget/Messages/ownMessage.dart';
import 'package:chatglo/Widget/images/OwnfileCArd.dart';
import 'package:chatglo/Widget/images/ReplyFile.dart';
import 'package:chatglo/Widget/theme.dart';
import 'package:flutter/material.dart';
import 'package:chatglo/Model/chatModel.dart';
import "package:http/http.dart" as http;
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../Widget/Camera/CameraScreen.dart';
import '../Widget/Camera/CameraView.dart';

class IndividualScreen extends StatefulWidget {
  const IndividualScreen(
    Key? key,
    this.chatModel,
    this.sourchat,
  ) : super(key: key);
  final ChatModel chatModel;
  final ChatModel sourchat;

  @override
  State<IndividualScreen> createState() => _IndividualScreenState();
}

class _IndividualScreenState extends State<IndividualScreen> {
  bool sendButton = false;
  bool show = false;
  List<MessageModel> messages = [];
  ScrollController _scrollController = ScrollController();
  ImagePicker _picker = ImagePicker();
  XFile? image;
  int poptime = 0;
  FocusNode focusNode = FocusNode();
  final IO.Socket socket = IO.io("http://192.168.0.107:3000/",
      IO.OptionBuilder().setTransports(['websocket']).build());

  TextEditingController _controller = TextEditingController();

  void connect() {
    socket.onConnect((data) {
      print("Connected ");
      socket.on("message", (msg) {
        print(msg);
        setMessage("destination", msg["message"], msg["path"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    socket.emit("signin", widget.sourchat.id);
    socket.onConnectError((data) => print('Connect Error: $data'));

    socket.onDisconnect((data) => print("Socket.io disconnect "));
  }

  void setMessage(String type, String message, String path) {
    MessageModel messageModel = MessageModel(
        path: path,
        type: type,
        message: message,
        time: DateTime.now().toString().substring(10, 16));
    setState(() {
      messages.add(messageModel);
    });
  }

  void onImagesend(String path, String message) async {
    print("this is working $message ");
    for (int i = 0; i < poptime; i++) {
      Navigator.pop(context);
    }
    setState(() {
      poptime = 0;
    });
    var request = http.MultipartRequest(
        "POST", Uri.parse("http://192.168.0.107:3000/routes/addimage"));
    request.files.add(await http.MultipartFile.fromPath("img", path));
    request.headers.addAll({
      "Content-type": "multipart/form-data",
    });
    http.StreamedResponse response = await request.send();
    var httpResponse = await http.Response.fromStream(response);
    var data = json.decode(httpResponse.body);
    print(data['path']);
    setMessage("source", message, path);
    socket.emit("message", {
      "message": message,
      "sourceId": widget.sourchat.id,
      "targetId": widget.chatModel.id,
      "path": data['path']
    });
  }

  void sendMessage(String message, int sourceId, int targetId, String path) {
    setMessage("source", message, path);
    socket.emit("message", {
      "message": message,
      "sourceId": sourceId,
      "targetId": targetId,
      "path": path
    });
  }

  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // if you want to image as a background
        // image.assets()
        Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            backgroundColor: Mytheme.whatsappTheme,
            leadingWidth: 70,
            titleSpacing: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        widget.chatModel.isGroup
                            ? "assets/images/group.png"
                            : "assets/images/1.PNG",
                        height: 70,
                        width: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name,
                      style: TextStyle(
                          fontSize: 20.5, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "last seen today at ${widget.chatModel.time}",
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: Icon(Icons.call)),
              PopupMenuButton(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("View contact"),
                    value: "View contact",
                  ),
                  PopupMenuItem(
                    child: Text("Media, links and docs"),
                    value: "Media, links and docs",
                  ),
                  PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  PopupMenuItem(
                    child: Text("Mute notification"),
                    value: "Mute notification",
                  ),
                  PopupMenuItem(
                    child: Text("Disappearing messages"),
                    value: "Disappearing messages",
                  ),
                  PopupMenuItem(
                    child: Text("Wallpaper"),
                    value: "Wallpaper",
                  ),
                ];
              })
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
              child: Column(children: [
                Expanded(
                  // height: MediaQuery.of(context).size.height - 140,
                  child: ListView.builder(
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount: messages.length + 1,
                      itemBuilder: (context, index) {
                        if (index == messages.length) {
                          return Container(
                            height: 70,
                          );
                        }
                        if (messages[index].type == "source") {
                          if (messages[index].path.length > 0) {
                            return OwnfileCard(
                              path: messages[index].path,
                              message: messages[index].message,
                              time: messages[index].time,
                            );
                          } else {
                            return OwnMessage(
                              message: messages[index].message,
                              time: messages[index].time,
                            );
                          }
                        } else {
                          if (messages[index].path.length > 0) {
                            return ReplyFile(
                              path: messages[index].path,
                              message: messages[index].message,
                              time: messages[index].time,
                            );
                          } else
                            return ReplyDart(
                              message: messages[index].message,
                              time: messages[index].time,
                            );
                        }
                      }),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width - 55,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Card(
                                      margin: EdgeInsets.only(
                                          left: 2, right: 2, bottom: 6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: TextFormField(
                                        controller: _controller,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        minLines: 1,
                                        onChanged: (value) {
                                          if (value.length > 0) {
                                            setState(() {
                                              sendButton = true;
                                            });
                                          } else {
                                            setState(() {
                                              sendButton = false;
                                            });
                                          }
                                        },
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "  Type a message",
                                            prefixIcon: IconButton(
                                              onPressed: () {
                                                if (!show) {
                                                  focusNode.unfocus();
                                                  focusNode.canRequestFocus =
                                                      false;
                                                }
                                                setState(() {
                                                  show = !show;
                                                });
                                              },
                                              icon: Icon(show
                                                  ? Icons.keyboard
                                                  : Icons.emoji_emotions),
                                            ),
                                            suffixIcon: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (builder) =>
                                                            bottomSheet());
                                                  },
                                                  icon: Icon(Icons.attach_file),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        poptime = 2;
                                                      });
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  CameraScreen(
                                                                      onImagesend:
                                                                          onImagesend)));
                                                    },
                                                    icon:
                                                        Icon(Icons.camera_alt))
                                              ],
                                            ),
                                            contentPadding: EdgeInsets.all(5)),
                                      )),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 6.0),
                              child: CircleAvatar(
                                backgroundColor: Mytheme.whatsappTheme,
                                child: IconButton(
                                  icon: Icon(
                                    sendButton ? Icons.send : Icons.mic,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (sendButton) {
                                      _scrollController.animateTo(
                                          _scrollController
                                              .position.maxScrollExtent,
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.easeOut);
                                      sendMessage(
                                          _controller.text,
                                          widget.sourchat.id,
                                          widget.chatModel.id,
                                          "");
                                      _controller.clear();
                                      setState(() {
                                        sendButton = false;
                                      });
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: iconCreation(
                        Icons.insert_drive_file, Colors.indigo, "Document"),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          poptime = 3;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CameraScreen(onImagesend: onImagesend)));
                      },
                      child: iconCreation(
                          Icons.camera_alt, Colors.pink, "Camera")),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                      onTap: () async {
                        setState(() {
                          poptime = 2;
                        });
                        image = await _picker.pickImage(
                            source: ImageSource.gallery);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => CameraView(
                                      path: image!.path,
                                      onImagesend: onImagesend,
                                    )));
                      },
                      child: iconCreation(
                          Icons.insert_photo, Colors.purple, "Gallery")),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      child:
                          iconCreation(Icons.headset, Colors.orange, "Audio")),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                      child: iconCreation(
                          Icons.location_pin, Colors.teal, "Location")),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    child: iconCreation(
                      Icons.person,
                      Colors.blue,
                      "Contact",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(
    IconData icon,
    Color color,
    String text,
  ) {
    return InkWell(
      child: Column(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundColor: color,
              child: Icon(
                icon,
                size: 29,
                color: Colors.white,
              )),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
