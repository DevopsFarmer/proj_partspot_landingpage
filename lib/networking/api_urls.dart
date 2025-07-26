class ApiUrl {
  static String baseUrl = '';

  static const devUrl = 'https://api.partywalah.in/api';
  static const stagingUrl = 'https://api.partywalah.in/api';
  static const prodUrl = 'https://api.partywalah.in/api';

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
  static const events = '/events/';
  static const users = '/users';
  static eventBook(String? eventId) => '/users/event/$eventId/book';
}
