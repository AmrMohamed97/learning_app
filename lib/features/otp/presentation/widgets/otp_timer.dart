import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:talamiz_arina/core/themes/colors/colors.dart';
import 'package:talamiz_arina/core/themes/styles/app_text_style.dart';

class OtpTimer extends StatefulWidget {
  const OtpTimer({
    super.key,
    this.durationInSeconds = 180,
    required this.onFinished,
    this.textStyle,
  });

  final int durationInSeconds;

  final VoidCallback onFinished;

  final TextStyle? textStyle;

  @override
  State<OtpTimer> createState() => _OtpTimerState();
}

class _OtpTimerState extends State<OtpTimer> {
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = widget.durationInSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() => _remainingSeconds--);
      } else {
        timer.cancel();
        widget.onFinished();
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$minutes:$secs";
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.timer_outlined,
          size: 18,
          color: MyColors.greyNormalHover,
        ),
        const SizedBox(width: 6),
        Text(
          _formatTime(_remainingSeconds),
          style:
              widget.textStyle ??
              AppTextStyle.font16Medium.copyWith(
                color: MyColors.greyNormalHover,
                fontFeatures: [const FontFeature.tabularFigures()],
              ),
        ),
      ],
    );
  }
}
