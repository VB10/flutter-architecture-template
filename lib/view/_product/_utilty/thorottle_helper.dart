import 'dart:async';

class ThrottleStringHelper {
  ThrottleStringHelper() {
    _onSetMaxValue();
  }
  String? _pastText;

  final int _maxTimerValue = 5;
  int _timerValue = 0;
  void onDelayTouch(String text, Function(String? text) onComplete) {
    _pastText = text;
    if (_timerValue == _maxTimerValue) {
      Timer.periodic(const Duration(milliseconds: 100), (timer) {
        _timerValue--;

        if (_timerValue == 0) {
          onComplete(_pastText);
          timer.cancel();
          _onSetMaxValue();
        }
      });
    } else {
      _onSetMaxNearValue();
    }
  }

  void _onSetMaxValue() {
    _timerValue = _maxTimerValue;
  }

  void _onSetMaxNearValue() {
    _timerValue = _maxTimerValue - 1;
  }
}
