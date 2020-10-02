import 'package:data_driven_fitness_app/custom_widgets/signup_field.dart';
import 'package:data_driven_fitness_app/custom_widgets/stronk_custom_button.dart';
import 'package:data_driven_fitness_app/custom_widgets/stronk_toggle_buttons.dart';
import 'package:data_driven_fitness_app/logic/model/application_variables/ApplicationManager.dart';
import 'package:data_driven_fitness_app/logic/model/user_modelling/user_regime.dart';
import 'package:data_driven_fitness_app/main.dart';
import 'package:data_driven_fitness_app/screens/dashboard/home_tab.dart';
import 'package:data_driven_fitness_app/screens/first_time_user_screen.dart';
import 'package:data_driven_fitness_app/screens/signin_user_screen.dart';
import 'package:flutter_test/flutter_test.dart';

import 'testing_mocks_and_sample_data.dart';

void main() {
  // Sample userdata for testing

  testWidgets('FirstTimeUserScreen shown on first use',
      (WidgetTester tester) async {
    // Initialize app and start on sign in screen
    final MyApp app = MyApp(
      testingRoute: SignInScreen.routeName,
    );

    // Pump app
    await tester.pumpWidget(app);

    // Check email and password fields are present
    Finder findTextFields = find.byType(StronkTextFormField);
    expect(findTextFields, findsNWidgets(2));

    // Enter sample data into fields
    await tester.enterText(findTextFields.at(0), 'zachmartin9001@gmail.com');
    await tester.enterText(findTextFields.at(1), 'Abcd1234!');

    // Submit sample data
    await tester.tap(find.byType(StronkFlatButton));
    // Wait for navigation
    await tester.pumpAndSettle();

    // Check FirstTimeUserScreen shown
    Finder findFirstTimeUserScreen = find.byType(FirstTimeUserScreen);
    expect(findFirstTimeUserScreen, findsOneWidget);
  });

  testWidgets('FirstTimeUserScreen handles invalid data',
      (WidgetTester tester) async {
    // Initialize app and start from FirstTimeUserScreen with sample userData
    final MyApp app = MyApp(
      testingRoute: FirstTimeUserScreen.routeName,
      userData: MocksAndSampleData.createUninitializedUserData(),
    );
    // Pump app
    await tester.pumpWidget(app);

    // Check height and weight fields are present
    Finder findTextFields = find.byType(StronkTextFormField);
    expect(findTextFields, findsNWidgets(2));

    // Enter invalid data into height and weight fields
    await tester.enterText(findTextFields.at(0), 'abcd');
    await tester.enterText(findTextFields.at(1), 'abcd');

    // Press submit
    await tester.tap(find.byType(StronkFlatButton));

    // Wait for navigation
    await tester.pumpAndSettle();

    // If screen has changed, test fails, if it stays the same it passes
    Finder findFirstTimeUserScreen = find.byType(FirstTimeUserScreen);
    expect(findFirstTimeUserScreen, findsOneWidget);
  });

  testWidgets('FirstTimeUserScreen handles valid data',
      (WidgetTester tester) async {
    // Initialize app and start from FirstTimeUserScreen with sample userData
    final MyApp app = MyApp(
      testingRoute: FirstTimeUserScreen.routeName,
      userData: MocksAndSampleData.createUninitializedUserData(),
    );

    // Pump app
    await tester.pumpWidget(app);

    // Check height and weight fields are present
    Finder findTextFields = find.byType(StronkTextFormField);
    expect(findTextFields, findsNWidgets(2));

    // Enter valid data into height and weight fields
    await tester.enterText(findTextFields.at(0), '190');
    await tester.enterText(findTextFields.at(1), '90');

    // Select one of the toggle buttons
    await tester.tap(find.byType(StronkToggleButtons));
    // Submit form
    await tester.tap(find.byType(StronkFlatButton));

    // Wait for navigation
    await tester.pumpAndSettle();

    // If screen has changed, test passes, if it stays the same it fails
    Finder findFirstTimeUserScreen = find.byType(HomeScreen);
    expect(findFirstTimeUserScreen, findsOneWidget);
  });

  test('App saves user height, weight and goal successfully', () {
    var sampleUserData = MocksAndSampleData.createUninitializedUserData();
    ApplicationManager appManager = ApplicationManager(sampleUserData);
    // Create sample builder to pass dummy context to appManager
    // This is required since the appManager will try to push the next screen
    // to the given context
    appManager.initializeCurrentUser(
      null,
      190,
      90,
      UserGoals.BULK,
    );
    // If the userData is initialized, the test has passed
    assert(appManager.userData.loggedInUser.initialized);
  });
}
