fvm flutter build appbundle
rm app.apks
java -jar ~/Downloads/bundletool-all-1.14.1.jar build-apks --bundle=~/Documents/test_app/build/app/outputs/bundle/release/app-release.aab --output=~/Documents/test_app/app.apks --local-testing
java -jar ~/Downloads/bundletool-all-1.14.1.jar install-apks --apks=~/Documents/test_app/app.apks
