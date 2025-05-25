import 'package:flutter/material.dart';

class Stroke {
  final List<Offset> points;
  final Color color;
  final double strokeWidth;

  Stroke({
    required this.points,
    required this.color,
    required this.strokeWidth,
  });
}

class WhiteboardPage extends StatefulWidget {
  const WhiteboardPage({super.key});

  @override
  State<WhiteboardPage> createState() => _WhiteboardPageState();
}

class _WhiteboardPageState extends State<WhiteboardPage> {
  List<Stroke> strokes = [];
  List<Offset> currentPoints = [];

  Color selectedColor = Colors.black;
  double strokeWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Whiteboard")),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanStart: (details) {
                setState(() {
                  currentPoints = [details.localPosition];
                });
              },
              onPanUpdate: (details) {
                setState(() {
                  currentPoints.add(details.localPosition);
                });
              },
              onPanEnd: (_) {
                setState(() {
                  strokes.add(
                    Stroke(
                      points: List.from(currentPoints),
                      color: selectedColor,
                      strokeWidth: strokeWidth,
                    ),
                  );
                  currentPoints.clear();
                });
              },
              child: CustomPaint(
                painter: WhiteboardPainter(
                  strokes: strokes,
                  currentPoints: currentPoints,
                  currentColor: selectedColor,
                  currentWidth: strokeWidth,
                ),
                size: Size.infinite,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                _colorButton(Colors.black),
                _colorButton(Colors.red),
                _colorButton(Colors.green),
                _colorButton(Colors.blue),
                _colorButton(Colors.orange),
                Expanded(
                  child: Slider(
                    value: strokeWidth,
                    min: 1.0,
                    max: 10.0,
                    onChanged: (value) {
                      setState(() => strokeWidth = value);
                    },
                  ),
                ),
                Text("Width: ${strokeWidth.toStringAsFixed(1)}"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorButton(Color color) {
    return GestureDetector(
      onTap: () => setState(() => selectedColor = color),
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: selectedColor == color ? Colors.white : Colors.black,
            width: 2,
          ),
        ),
      ),
    );
  }
}

class WhiteboardPainter extends CustomPainter {
  final List<Stroke> strokes;
  final List<Offset> currentPoints;
  final Color currentColor;
  final double currentWidth;

  WhiteboardPainter({
    required this.strokes,
    required this.currentPoints,
    required this.currentColor,
    required this.currentWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var stroke in strokes) {
      _drawStroke(canvas, stroke.points, stroke.color, stroke.strokeWidth);
    }
    _drawStroke(canvas, currentPoints, currentColor, currentWidth);
  }

  void _drawStroke(
    Canvas canvas,
    List<Offset> points,
    Color color,
    double width,
  ) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = width
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
