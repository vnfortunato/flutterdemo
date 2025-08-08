import 'package:flutter/material.dart';

class CACard extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<String> descriptions;
  final Color color;
  final double offset;

  const CACard({
    super.key,
    required this.icon,
    required this.title,
    required this.descriptions,
    required this.color,
    required this.offset
  });

  @override
  State<CACard> createState() => _CACardState();
}

class _CACardState extends State<CACard> {
  late Offset _offset;

  @override
  void initState() {
    super.initState();
    _offset = Offset(widget.offset, 0);

    Future.delayed(Duration.zero, () {
      setState(() {
        _offset = Offset.zero;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: _offset,
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
      child: SizedBox(
        height: 250,
        width: 250,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          color: widget.color,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Center(child: Icon(widget.icon, color: Colors.white)),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      height: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                for (var description in widget.descriptions) ...[
                  SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
