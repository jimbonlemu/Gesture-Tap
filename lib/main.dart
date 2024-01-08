import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gesture Tap',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GestureTap(),
    );
  }
}

class GestureTap extends StatefulWidget {
  const GestureTap({super.key});

  @override
  State<GestureTap> createState() => _GestureTapState();
}

class _GestureTapState extends State<GestureTap> {
  final double boxSize = 150;
  int taps = 0;
  int doubleTaps = 0;
  int longPresses = 0;

  double posX = 0.0;
  double posY = 0.0;

  @override
  Widget build(BuildContext context) {
    if (posX == 0) {
      center(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gesture Tap'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Positioned(
            top: posY,
            left: posX,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  taps++;
                });
              },
              onDoubleTap: () {
                setState(() {
                  doubleTaps++;
                });
              },
              onLongPress: () {
                setState(() {
                  longPresses++;
                });
              },
              onPanUpdate: (DragUpdateDetails details) {
                setState(() {
                  double deltaX = details.delta.dx;
                  double deltaY = details.delta.dy;
                  posX += deltaX;
                  posY += deltaY;
                });
              },
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(16),
        child: Text(
          'Taps : $taps - Double Taps : $doubleTaps - Long Presses : $longPresses',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void center(BuildContext context) {
    posX = (MediaQuery.of(context).size.width / 2) - boxSize / 2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize / 2 - 30;

    setState(() {
      this.posX = posX;
      this.posY = posY;
    });
  }
}

// class LoremIpsumApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: ListView(
//             children: [
//               Text(
//                 'Lorem Ipsum',
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//               SizedBox(
//                 height: 16,
//               ),
//               Text(
//                 'History, Purpose and Usage',
//                 style: Theme.of(context).textTheme.headline5,
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 "Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book. It usually begins with:",
//                 style: Theme.of(context).textTheme.bodyText2,
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 '“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.”',
//                 style: Theme.of(context).textTheme.caption,
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 "The purpose of lorem ipsum is to create a natural looking block of text (sentence, paragraph, page, etc.) that doesn't distract from the layout. A practice not without controversy, laying out pages with meaningless filler text can be very useful when the focus is meant to be on design, not content.",
//                 style: Theme.of(context).textTheme.bodyText2,
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 "The passage experienced a surge in popularity during the 1960s when Letraset used it on their dry-transfer sheets, and again during the 90s as desktop publishers bundled the text with their software. Today it's seen all around the web; on templates, websites, and stock designs. Use our generator to get your own, or read on for the authoritative history of lorem ipsum.",
//                 style: Theme.of(context).textTheme.bodyText2,
//               ),
//               SizedBox(
//                 height: 8,
//               ),
//               Text(
//                 'Source: https://loremipsum.io/',
//                 style: Theme.of(context).textTheme.overline,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
