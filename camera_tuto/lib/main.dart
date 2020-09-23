import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  StreamController<File> fileStream = StreamController<File>();
  Future getImage() async {
    try {
      final pickedFile =
          await ImagePicker().getImage(source: ImageSource.gallery);

      fileStream.sink.add(File(pickedFile.path));
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: StreamBuilder<File>(
          stream: fileStream.stream,
          builder: (context, snapshot) {
            return AttachmentButtonPage(
              Center(
                child: !snapshot.hasData
                    ? Text('No image selected.')
                    : Image.file(snapshot.data),
              ),
            );
          }),
    ));
  }
}

class AttachmentButtonPage extends StatefulWidget {
  final Widget child;
  AttachmentButtonPage(this.child);
  @override
  _AttachmentButtonPageState createState() => _AttachmentButtonPageState();
}

class _AttachmentButtonPageState extends State<AttachmentButtonPage> {
  @override
  Widget build(BuildContext context) {
    var attachmentButton = AttachmentButton(() => {});
    return Stack(
      children: [
        widget.child,
        GestureDetector(
          //onTap: () => {attachmentButton.},
          child: Stack(
            children: [
              Positioned(bottom: 50, right: 50, child: attachmentButton)
            ],
          ),
        )
      ],
    );
  }
}

class AttachmentButton extends StatefulWidget {
  final VoidCallback onPressed;
  AttachmentButton(this.onPressed);

  @override
  _AttachmentButtonState createState() => _AttachmentButtonState();
}

class _AttachmentButtonState extends State<AttachmentButton>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  StreamController _streamController = StreamController<bool>();
  StreamController _streamController1 = StreamController<bool>();
  AnimationController animationController;
  Animation<Offset> offsetAnimation;
  Animation<Offset> offsetAnimation1;

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
    _streamController1.close();
    animationController.dispose();
  }

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    offsetAnimation =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, -50.0)).animate(
            CurvedAnimation(
                curve: Curves.easeInOutExpo,
                parent: animationController,
                reverseCurve: Curves.easeInOutBack));

    offsetAnimation1 =
        Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(0.0, -100.0))
            .animate(CurvedAnimation(
                curve: Curves.easeInOutExpo,
                parent: animationController,
                reverseCurve: Curves.easeInOutBack));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<bool>(
            stream: _streamController1.stream,
            builder: (context, snapshot) {
              return Visibility(
                visible: snapshot.hasData && snapshot.data,
                child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, snapshot) {
                      return Transform.translate(
                          offset: offsetAnimation.value,
                          child: RoundedIconButton(Icons.camera));
                    }),
              );
            }),
        StreamBuilder<bool>(
            stream: _streamController.stream,
            builder: (context, snapshot) {
              return Visibility(
                visible: snapshot.hasData && snapshot.data,
                child: AnimatedBuilder(
                    animation: animationController,
                    builder: (context, snapshot) {
                      return Transform.translate(
                          offset: offsetAnimation1.value,
                          child: RoundedIconButton(Icons.image));
                    }),
              );
            }),
        RoundedIconButton(
          Icons.camera_alt,
          onTapped: () {
            widget.onPressed();
            isOpened = !isOpened;

            if (!isOpened) {
              animationController.reverse().whenCompleteOrCancel(() {
                _streamController.add(isOpened);
                _streamController1.add(isOpened);
              });
            } else {
              _streamController.add(isOpened);
              _streamController1.add(isOpened);
              animationController.forward();
            }
          },
        ),
      ],
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onTapped;
  final IconData icon;
  const RoundedIconButton(this.icon, {this.onTapped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onTapped()},
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
