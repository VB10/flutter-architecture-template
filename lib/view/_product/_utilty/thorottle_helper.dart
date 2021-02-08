import 'dart:async';

class ThrottleStringHelper {
  String _pastText;

  final int _maxTimerValue = 5;
  int _timerValue = 0;
  ThrottleStringHelper() {
    _onSetMaxValue();
  }
  void onDelayTouch(String text, Function(String text) onComplete) {
    _pastText = text;
    if (_timerValue == _maxTimerValue) {
      Timer.periodic(Duration(milliseconds: 100), (timer) {
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
