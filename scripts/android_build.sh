if [ $3 == "bundle" ]
then
flutter build appbundle --build-name=$1 --build-number=$2
open build/app/outputs/bundle/release
else
flutter build apk --build-name=$1 --build-number=$2
open build/app/outputs/flutter-apk
fi


