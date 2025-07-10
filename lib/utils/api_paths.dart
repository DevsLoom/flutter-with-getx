class ApiPaths {
  const ApiPaths._();

  /// login
  static const login = '/auth/login';
  static const loginResend = '/auth/login/resend';
  static const loginVerify = '/auth/login/verify';

  ///Register
  static const register = '/auth/register';
  static const registerResend = '/auth/register/resend';
  static const registerVerify = '/auth/register/verify';

  ///Forget Password
  static const forgetPassword = '/auth/reset/request';
  static const forgetPassOtpVerify = '/auth/reset/verify';
  static const forgetPassConfirm = '/auth/reset/confirm';
}
