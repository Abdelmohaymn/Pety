
class ApiConstants{
  static const String apiBaseUrl = 'https://petcare-znql.onrender.com/';
  static const String login = 'api/users/signin';
  static const String register = 'api/users/signup';
  static const String searchVet = 'api/pety?';
  static const String petyDetails = 'api/pety/details';
  static const String bookVet = 'api/pety/appointment';
  static const String reviewsAddNewOne = 'api/reviews';
  static const String updateProfile = 'api/users/updateMe';
  static const String dashboardGetAppointments = 'api/dashboard/allAppointments';
  static const String dashboardPetyInformation = 'api/dashboard/petyInformation';
  static const String dashboardChangeAppointmentStatus = 'api/dashboard/changeAppointment';
  static const String dashboardUpdatePetyData = 'api/dashboard/updatePety';
  static const String dashboardTimeTable = 'api/dashboard/timeTable';
  static const String dashboardGetWorkHours = 'api/dashboard/workingHours';
  static const String dashboardGetAllRoles = 'api/dashboard/allRoles';
  static const String dashboardGetUserHistory = 'api/history/user';
  static const String dashboardAppointmentHistory = 'api/history/appoinment/{id}';
  static const String dashboardAddHistory = 'api/history';
  static const String userVisitsHistory = 'api/history/';
  static const String communityCreatePost = 'api/posts/create/';
  static const String communityGetPosts = 'api/posts/';
  static const String communityUpVote = 'api/posts/upvote';
  static const String communityDownVote = 'api/posts/downvote';
  static const String communityResetVote = 'api/posts/resetvote';

}



class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

