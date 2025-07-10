import 'package:flutter/material.dart';

class WidgetKeys {
  //onboarding
  static const onboardingSkipButton = Key('onboarding_skip_button');
  static const onboardingGetStartedButton = Key(
    'onboarding_get_started_button',
  );
  // Login
  static const userEmailField = Key('auth_email_field');
  static const userPasswordField = Key('auth_password_field');
  static const pinField = Key('auth_pin_field');
  static const loginButton = Key('login_button');
  static const navigateRegistrationPageButton = Key(
    'navigate_registrationpage_button',
  );
  static const navigateForgetpassPageButton = Key(
    'navigate_forgetpasspage_button',
  );

  //Registration
  static const firstName = Key('first_name_field'); // Key for first name field
  static const lastName = Key('last_name_field'); // Key for last name field
  static const phoneNumber = Key(
    'phone_number_field',
  ); // Key for phone number field
  static const email = Key('email_field'); // Key for email field
  static const password = Key('password_field'); // Key for password field
  static const confirmPassword = Key(
    'confirm_password_field',
  ); // Key for confirm password field

  static const navigateLoginPageButton = Key('navigate_loginpage_button');
  static const registerDetailsContinueButton = Key(
    'continue_button',
  ); // Key for continue button
  static const registratioPasswordContinueButton = Key(
    'registration_password_continue_button',
  );
  static const loginPinTextField = Key('login_pin_text_field');
  static const loginPinVerifyButton = Key('login_pin_continue_button');
  static const registrationPinTextField = Key(
    'registration_pin_text_field',
  ); // Key for pin continue button
  static const registrationPinResendButton = Key(
    'registration_pin_resend_button',
  ); // Key for pin continue button
  static const registrationPinVerifyButton = Key(
    'registration_pin_continue_button',
  ); // Key for pin continue button
  static const termsAndConditionsCheckbox = Key(
    'terms_and_conditions_checkbox',
  ); // Key for terms and conditions checkbox
  static const termsAndConditionsLink = Key(
    'terms_and_conditions_link',
  ); // Key for terms and conditions link
  static const privacyPolicyLink = Key(
    'privacy_policy_link',
  ); // Key for privacy policy link
  static const signupButton = Key('signup_button');

  ///<============================================ Forget Password
  static const forgetPasswordEmailField = Key(
    'forget_password_email_field',
  ); // Key for email field in forget password screen
  static const forgetPassNextButton = Key(
    'forgetpass_next_button',
  ); // Key for next button in forget password screen
  static const forgetpassSendOtpButton = Key(
    'forgetpass_send_otp_button',
  ); // Key for send OTP button in forget password screen
  static const forgetpassOtpResendButton = Key(
    'forgetpass_otp_resend_button',
  ); // Key for resend OTP button in forget password screen
  static const forgetpassOtpField = Key(
    'forgetpass_otp_field',
  ); // Key for OTP field in forget password screen
  static const forgetpassOtpVerifyButton = Key(
    'forgetpass_otp_verify_button',
  ); // Key for new password button in forget password screen
  static const forgetPassNewPasswordField = Key(
    'forgetpass_new_password_field',
  ); // Key for new password field in forget password screen
  static const forgetPassConfirmPasswordField = Key(
    'forgetpass_confirm_password_field',
  ); // Key for confirm password field in forget password screen
  static const forgetpassConfirmButton = Key(
    'forgetpass_confirm_button',
  ); // Key for reset button in forget password screen
  static const forgetpassSuccessButton = Key(
    'forgetpass_success_button',
  ); // Key for back button in forget password screen

  // Profile
  static const profileImage = Key('profile_image'); // Key for profile image
  static const profileName = Key('profile_name'); // Key for profile name
  static const profileEmail = Key('profile_email'); // Key for profile email
  static const profilePhoneNumber = Key(
    'profile_phone_number',
  ); // Key for profile phone number

  // Language Change

  ///
  static const languageChange = Key(
    'language_change_widget',
  ); // Key for pin code field
}
