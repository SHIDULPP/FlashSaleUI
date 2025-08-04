import 'dart:async';
import 'package:flutter/material.dart';

class FlashSaleTimer extends StatefulWidget {
  const FlashSaleTimer({super.key});

  @override
  _FlashSaleTimerState createState() => _FlashSaleTimerState();
}

class _FlashSaleTimerState extends State<FlashSaleTimer> {
  Duration _duration = const Duration(
    hours: 1,
    minutes: 30,
    seconds: 0,
  ); // Example timer
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_duration.inSeconds > 0) {
        setState(() {
          _duration -= const Duration(seconds: 1);
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  // String _formatDuration(Duration d) {
  //   String twoDigits(int n) => n.toString().padLeft(2, '0');
  //   return "${twoDigits(d.inHours)}:${twoDigits(d.inMinutes % 60)}:${twoDigits(d.inSeconds % 60)}";
  // }


//Seconds
  String _formatDurationSeconds(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inSeconds % 60)}";
  }

  //minuts
  String _formatDurationMinuts(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inMinutes % 60)}";
  }

  //hours
  String _formatDurationHours(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(d.inHours)}";
  }



  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.access_time, color: Colors.white, size: 30),
          const SizedBox(width: 10),

          //Hours

          Container(
            alignment:Alignment.center,
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              _formatDurationHours(_duration),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(width: 5,),

          //Minuts

          Container(
            alignment:Alignment.center,
            height: 30,
            width: 30,
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              _formatDurationMinuts(_duration),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(width: 5,),

          //seconds
          Container(
            alignment:Alignment.center,
            height: 30,
            width: 30,
             decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              _formatDurationSeconds(_duration),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),


          // Text(
          //   _formatDuration(_duration),
          //   style: const TextStyle(
          //     color: Colors.white,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 20,
          //   ),
          // ),
        ],
      ),
    );
  }
}
