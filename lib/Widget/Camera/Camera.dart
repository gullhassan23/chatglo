import 'package:flutter/material.dart';

import 'package:chatglo/Widget/Camera/CameraScreen.dart';

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CameraScreen(
      onImagesend: onImageSend,
    );
  }

  onImageSend() {}
}
