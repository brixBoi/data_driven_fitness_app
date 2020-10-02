import 'package:data_driven_fitness_app/logic/model/application_variables/user_data.dart';
import 'package:data_driven_fitness_app/main.dart';
import 'package:data_driven_fitness_app/screens/dashboard/dashboard_screen.dart';
import 'package:data_driven_fitness_app/screens/profile_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'testing_mocks_and_sample_data.dart';

void main() {
  testWidgets('Profile information screen is accesible from dashboard',
      (WidgetTester tester) async {
    // Create mock app with initialized user and starting from dashboard
    final MyApp app = MyApp(
      testingRoute: DashboardScreen.routeName,
      userData: MocksAndSampleData.createInitializedUserData(),
    );

    // Start mock app
    await tester.pumpWidget(app);

    // Try find menuKey and check there's exactly one on the page
    final Key menuKey = Key('_menuKey');
    Finder findMenuButton = find.byKey(menuKey);
    expect(findMenuButton, findsOneWidget);

    // Tap the menuKey and wait for app action
    await tester.tap(findMenuButton);
    await tester.pumpAndSettle();

    // Check drawer has been revealed
    Finder findDrawer = find.byType(StronkDrawer);
    expect(findDrawer, findsOneWidget);

    // Try find the profile information button and check it exists
    Finder findProfileButton = find.byKey(Key('profileButton'));
    expect(findProfileButton, findsOneWidget);

    // Tap the profile button and wait for the app to navigate
    await tester.tap(findProfileButton);
    await tester.pumpAndSettle();

    // Check the profile information screen has been shown
    Finder findProfileInformationScreen = find.byType(ProfileInformationScreen);
    expect(findProfileInformationScreen, findsOneWidget);
  });

  testWidgets('Profile Information Screen is accurate',
      (WidgetTester tester) async {
    // Create mock app with initialized user and starting from profile information screen
    UserData userData = MocksAndSampleData.createInitializedUserData();
    final MyApp app = MyApp(
      testingRoute: ProfileInformationScreen.routeName,
      userData: userData,
    );

    // Start mock app
    await tester.pumpWidget(app);

    // Check email display exists, and get it's value
    Finder findUserEmailInfo = find.byKey(Key('userEmailDisplay'));
    expect(findUserEmailInfo, findsOneWidget);
    String displayedEmail =
        (findUserEmailInfo.evaluate().single.widget as Text).data;

    // Check id display exists, and get it's value
    Finder findUserIDInfo = find.byKey(Key('userIDDisplay'));
    expect(findUserIDInfo, findsOneWidget);
    String displayedID = (findUserIDInfo.evaluate().single.widget as Text).data;

    // Check displayed email against actual user email
    expect(userData.loggedInUser.email, displayedEmail);
    // Check displayed id against actual user email
    // User ID is displayed with a '#' in front of it, so appending it to the
    // actual value to ensure they match if both values are accurate
    expect('#' + userData.loggedInUser.personId.toString(), (displayedID));
  });
}
