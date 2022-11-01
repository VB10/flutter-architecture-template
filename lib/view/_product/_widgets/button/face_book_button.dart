import 'package:architecture_widgets/src/button/title_text_button.dart';
import 'package:flutter/material.dart';

class FaceBookButton extends StatelessWidget {
  const FaceBookButton({Key? key, this.onComplete}) : super(key: key);
  final void Function(FaceBookModel? data, {String? errorMessage})? onComplete;

  @override
  Widget build(BuildContext context) {
    return TitleTextButton(
      text: 'Facebbok login',
      onPressed: () {
        const isLengthSixCharacter = 'asdasdasd'.length == 6;

        if (isLengthSixCharacter) {
          onComplete!(FaceBookModel('asdasd', 'ASdasd'));
        } else {
          onComplete!(null, errorMessage: 'Facebook user not found');
        }
      },
    );
  }
}

class FaceBookModel {
  FaceBookModel(this.token, this.mail);
  final String token;
  final String mail;
}
