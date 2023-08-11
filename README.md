# cinereserve

##Code Structure 

tentwenty_assignment/
├─ README.md
├─ analysis_options.yaml
├─ android/
│  ├─ .DS_Store
│  ├─ .gitignore
│  ├─ app/
│  │  ├─ .DS_Store
│  │  ├─ build.gradle
│  │  └─ src/
│  │     ├─ .DS_Store
│  │     ├─ debug/
│  │     │  └─ AndroidManifest.xml
│  │     ├─ main/
│  │     │  ├─ .DS_Store
│  │     │  ├─ AndroidManifest.xml
│  │     │  ├─ kotlin/
│  │     │  │  └─ com/
│  │     │  │     └─ example/
│  │     │  │        └─ upcom_movies/
│  │     │  │           └─ MainActivity.kt
│  │     │  └─ res/
│  │     │     ├─ .DS_Store
│  │     │     ├─ drawable-v21/
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ drawable/
│  │     │     │  └─ launch_background.xml
│  │     │     ├─ mipmap-anydpi-v26/
│  │     │     │  ├─ ic_launcher.xml
│  │     │     │  └─ ic_launcher_round.xml
│  │     │     ├─ mipmap-hdpi/
│  │     │     │  ├─ ic_launcher.png
│  │     │     │  ├─ ic_launcher_foreground.png
│  │     │     │  └─ ic_launcher_round.png
│  │     │     ├─ mipmap-ldpi/
│  │     │     │  └─ ic_launcher.png
│  │     │     ├─ mipmap-mdpi/
│  │     │     │  ├─ ic_launcher.png
│  │     │     │  ├─ ic_launcher_foreground.png
│  │     │     │  └─ ic_launcher_round.png
│  │     │     ├─ mipmap-xhdpi/
│  │     │     │  ├─ ic_launcher.png
│  │     │     │  ├─ ic_launcher_foreground.png
│  │     │     │  └─ ic_launcher_round.png
│  │     │     ├─ mipmap-xxhdpi/
│  │     │     │  ├─ ic_launcher.png
│  │     │     │  ├─ ic_launcher_foreground.png
│  │     │     │  └─ ic_launcher_round.png
│  │     │     ├─ mipmap-xxxhdpi/
│  │     │     │  ├─ ic_launcher.png
│  │     │     │  ├─ ic_launcher_foreground.png
│  │     │     │  └─ ic_launcher_round.png
│  │     │     ├─ values-night/
│  │     │     │  └─ styles.xml
│  │     │     └─ values/
│  │     │        ├─ ic_launcher_background.xml
│  │     │        └─ styles.xml
│  │     └─ profile/
│  │        └─ AndroidManifest.xml
│  ├─ build.gradle
│  ├─ cinereserve.iml
│  ├─ gradle.properties
│  ├─ gradle/
│  │  └─ wrapper/
│  │     └─ gradle-wrapper.properties
│  └─ settings.gradle
├─ assets/
│  ├─ .DS_Store
│  ├─ fonts/
│  │  ├─ .DS_Store
│  │  └─ Poppins/
│  │     ├─ OFL.txt
│  │     ├─ Poppins-Black.ttf
│  │     ├─ Poppins-BlackItalic.ttf
│  │     ├─ Poppins-Bold.ttf
│  │     ├─ Poppins-BoldItalic.ttf
│  │     ├─ Poppins-ExtraBold.ttf
│  │     ├─ Poppins-ExtraBoldItalic.ttf
│  │     ├─ Poppins-ExtraLight.ttf
│  │     ├─ Poppins-ExtraLightItalic.ttf
│  │     ├─ Poppins-Italic.ttf
│  │     ├─ Poppins-Light.ttf
│  │     ├─ Poppins-LightItalic.ttf
│  │     ├─ Poppins-Medium.ttf
│  │     ├─ Poppins-MediumItalic.ttf
│  │     ├─ Poppins-Regular.ttf
│  │     ├─ Poppins-SemiBold.ttf
│  │     ├─ Poppins-SemiBoldItalic.ttf
│  │     ├─ Poppins-Thin.ttf
│  │     └─ Poppins-ThinItalic.ttf
│  └─ images/
│     ├─ .DS_Store
│     ├─ png/
│     │  ├─ comedies.png
│     │  ├─ crime.png
│     │  ├─ dashboard_icon.png
│     │  ├─ documentaries.png
│     │  ├─ dramas.png
│     │  ├─ family.png
│     │  ├─ fantasy.png
│     │  ├─ holidays.png
│     │  ├─ horror.png
│     │  ├─ media.png
│     │  ├─ more.png
│     │  ├─ play_button.png
│     │  ├─ sciFi.png
│     │  ├─ seats_booking.png
│     │  └─ thriller.png
│     └─ svg/
│        ├─ Seat.svg
│        └─ screen.svg
├─ cinereserve.iml
├─ ios/
│  ├─ .gitignore
│  ├─ Flutter/
│  │  ├─ AppFrameworkInfo.plist
│  │  ├─ Debug.xcconfig
│  │  └─ Release.xcconfig
│  ├─ Podfile
│  ├─ Podfile.lock
│  ├─ Runner.xcodeproj/
│  │  ├─ project.pbxproj
│  │  ├─ project.xcworkspace/
│  │  │  ├─ contents.xcworkspacedata
│  │  │  └─ xcshareddata/
│  │  │     ├─ IDEWorkspaceChecks.plist
│  │  │     └─ WorkspaceSettings.xcsettings
│  │  └─ xcshareddata/
│  │     └─ xcschemes/
│  │        └─ Runner.xcscheme
│  ├─ Runner.xcworkspace/
│  │  ├─ contents.xcworkspacedata
│  │  └─ xcshareddata/
│  │     ├─ IDEWorkspaceChecks.plist
│  │     └─ WorkspaceSettings.xcsettings
│  ├─ Runner/
│  │  ├─ AppDelegate.swift
│  │  ├─ Assets.xcassets/
│  │  │  ├─ AppIcon.appiconset/
│  │  │  │  ├─ Contents.json
│  │  │  │  ├─ Icon-App-1024x1024@1x.png
│  │  │  │  ├─ Icon-App-20x20@1x.png
│  │  │  │  ├─ Icon-App-20x20@2x.png
│  │  │  │  ├─ Icon-App-20x20@3x.png
│  │  │  │  ├─ Icon-App-29x29@1x.png
│  │  │  │  ├─ Icon-App-29x29@2x.png
│  │  │  │  ├─ Icon-App-29x29@3x.png
│  │  │  │  ├─ Icon-App-40x40@1x.png
│  │  │  │  ├─ Icon-App-40x40@2x.png
│  │  │  │  ├─ Icon-App-40x40@3x.png
│  │  │  │  ├─ Icon-App-60x60@2x.png
│  │  │  │  ├─ Icon-App-60x60@3x.png
│  │  │  │  ├─ Icon-App-76x76@1x.png
│  │  │  │  ├─ Icon-App-76x76@2x.png
│  │  │  │  └─ Icon-App-83.5x83.5@2x.png
│  │  │  └─ LaunchImage.imageset/
│  │  │     ├─ Contents.json
│  │  │     ├─ LaunchImage.png
│  │  │     ├─ LaunchImage@2x.png
│  │  │     ├─ LaunchImage@3x.png
│  │  │     └─ README.md
│  │  ├─ Base.lproj/
│  │  │  ├─ LaunchScreen.storyboard
│  │  │  └─ Main.storyboard
│  │  ├─ Info.plist
│  │  └─ Runner-Bridging-Header.h
│  └─ RunnerTests/
│     └─ RunnerTests.swift
├─ lib/
│  ├─ constants/
│  │  ├─ app_fonts.dart
│  │  ├─ app_images.dart
│  │  ├─ app_texts.dart
│  │  └─ colors.dart
│  ├─ controller/
│  │  └─ general_provider.dart
│  ├─ helpers/
│  │  └─ shared_helpers.dart
│  ├─ main.dart
│  ├─ model/
│  │  └─ upcomming_movie.dart
│  ├─ services/
│  │  └─ navigation_service.dart
│  ├─ theme/
│  │  └─ native_theme.dart
│  ├─ utils/
│  │  ├─ app_key.dart
│  │  ├─ app_toast.dart
│  │  ├─ math_utils.dart
│  │  └─ text_style.dart
│  ├─ view/
│  │  ├─ dashboard/
│  │  │  └─ dashboard.dart
│  │  ├─ demo.dart
│  │  ├─ home/
│  │  │  └─ home_screen.dart
│  │  ├─ movie_detail/
│  │  │  ├─ movie_detail_land_body.dart
│  │  │  ├─ movie_detail_portrait_body.dart
│  │  │  ├─ movie_detail_screen.dart
│  │  │  └─ widgets/
│  │  │     └─ movie_detail_tag_widget.dart
│  │  ├─ pay_to_reserved/
│  │  │  ├─ pay_to_reserved.dart
│  │  │  └─ provider/
│  │  │     └─ pay_provider.dart
│  │  ├─ search_movie/
│  │  │  ├─ provider/
│  │  │  │  └─ serach_provider.dart
│  │  │  ├─ result_movie_screen/
│  │  │  │  └─ result_screen.dart
│  │  │  ├─ search_movie/
│  │  │  │  ├─ search_movie_land_body.dart
│  │  │  │  ├─ search_movie_portrait_body.dart
│  │  │  │  └─ search_movie_screen.dart
│  │  │  └─ widgets/
│  │  │     └─ search_movie.dart
│  │  ├─ select_date/
│  │  │  ├─ provider/
│  │  │  │  └─ select_date_provider.dart
│  │  │  ├─ select_date_land_body.dart
│  │  │  ├─ select_date_portrait_body.dart
│  │  │  ├─ select_date_screen.dart
│  │  │  └─ widgets/
│  │  │     ├─ date_card.dart
│  │  │     └─ day_card.dart
│  │  ├─ video_player/
│  │  │  └─ video_player.dart
│  │  └─ watch/
│  │     └─ watch.dart
│  └─ widgets/
│     ├─ app_widgets/
│     │  ├─ appbar_widget.dart
│     │  ├─ console_error_widget.dart
│     │  ├─ scaffold_widget.dart
│     │  ├─ text_field_widget.dart
│     │  └─ view_not_found_widget.dart
│     └─ empty_space_widget.dart
├─ pubspec.lock
├─ pubspec.yaml
└─ test/
   └─ widget_test.dart
