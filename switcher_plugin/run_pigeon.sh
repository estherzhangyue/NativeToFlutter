#mkdir -p android/src/main/java/com/example/flutter_pigeon_plugin

flutter pub run pigeon \
  --input pigeons/bridge.dart \
  --dart_out lib/bridge.dart \
  --objc_header_out ios/Switcher/Switcher/bridge.h \
  --objc_source_out ios/Switcher/Switcher/bridge.m \
  --java_out android/app/src/main/java/de/develappers/switcher/bridge.java \
  --java_package "de.develappers.switcher"