import 'package:chatglo/Widget/Status/OtherStatus.dart';
import 'package:flutter/material.dart';

import 'HeadOwnStatus.dart';

class Status extends StatelessWidget {
  const Status({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blueGrey[100],
              elevation: 8,
              child: Icon(
                Icons.edit,
                color: Colors.blueGrey[900],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            child: Icon(Icons.camera_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeadOwnStatus(),
            Container(
              height: 33,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                child: Text(
                  "Recent updates",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          
           
            OtherStatus(
              statusNum: 1,
              isSeen: false,
              name: "Hassan",
              imageName: "assets/images/2.PNG",
              time: "2:00",
            ),
            OtherStatus(
              isSeen:false ,
              statusNum: 2,
              name: "Hassan",
              imageName: "assets/images/2.PNG",
              time: "2:00",
            ),
            Container(
              height: 33,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[300],
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
                child: Text(
                  "Viewed updates",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            OtherStatus(
              statusNum: 1,
              isSeen: true,
              name: "bilal",
              imageName: "assets/images/2.PNG",
              time: "2:00",
            ),
            OtherStatus(
              statusNum: 2,
              isSeen: true,
              name: "Abubaker",
              imageName: "assets/images/1.PNG",
              time: "2:00",
            ),
            OtherStatus(
              statusNum: 3,
              isSeen: true,
              name: "Ali",
              imageName: "assets/images/2.PNG",
              time: "2:00",
            ),
            OtherStatus(
              statusNum: 5,
              isSeen: true,
              name: "umair",
              imageName: "assets/images/2.PNG",
              time: "2:00",
            ),
          ],
        ),
      ),
    );
  }
}
