class ApiUrl {
  static String baseUrl = '';

  static const devUrl = 'http://44.203.188.5:3000/api';
  static const stagingUrl = 'http://192.168.1.8:3000';
  static const prodUrl = 'http://192.168.1.8:3000';

  static const socialLogin = '/auth/social-login';
  static const loginPhone = '/users/register-login';
  static const verifyOtp = '/users/verify-otp';
  static const resendOtp = '/users/resend-otp';
  static const getProfile = '/users/get-profile';
  static const profile = '/users/profile';
  static const eventsMetaData = '/events/get-event-meta';
  static const carousel = '/admin/carousel';
  static const fileUpload = '/admin/file-upload';
  static const createEventRequest = '/users/create-event-request';
  static const myBookings = '/users/my-bookings';
  static const eventsGet = '/events/get';
  static eventBook(String? eventId) => '/users/event/$eventId/book';
}
