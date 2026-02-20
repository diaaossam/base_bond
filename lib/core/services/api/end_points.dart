class EndPoints {
  ////////////////////// Public ///////////////////
  static const String sliders = "banners";
  static const String categories = "categories";
  static const String activeSubstances = "active-substances";
  static const String brands = "brands";
  static const String subCategory = "sub-categories";
  static const String subDivision = "division-categories";
  static const String insuranceCompany = "insurance-companies";
  static const String insuranceProfile = "insurance-profile";

  /////////////////////// Location //////////////////

  static const String governorates = "governorates";
  static const String addresses = "addresses";
  static const String makeAddressDefault = "make-default-address";
  static const String pharmacyBranches = "pharmacy-branches";

  static const String prescriptionOrders = "prescription-orders";
  static const String insuranceOrder = "insurance-orders";


  ///////// Auth ////////////////////////
  static const String register = "auth/register";
  static const String login = "auth/login";
  static const String update = "profile/update";
  static const String socialLogin = "auth/social";
  static const String verifyUser = "auth/verify-email";
  static const String resendOtp = "auth/resend-verification";
  static const String forgotPassword = "auth/forgot-password";
  static const String verifyForgotPassword = "auth/verify-forgot-password";
  static String logOut = "profile/logout";
  static String getUserData = "user/profile";
  static String deleteUser = "profile/delete-account";
  static const String profile = "profile/me";

  ///////////////// Settings////////////////
  static const String appSettings = "app-settings";

  //////////////////////////// Notification //////////////////
  static const String notfications = "notification";
  static const String updateNotfications = "profile/update-notification";
  static const String markAllAsRead = "mark-all-notifications-as-read";

  //////////////////// Settings /////////////////////////////
  static const String language = "profile/language";
  static String pages(String id) => "pages/$id";

  //////////////////// Chats & Support Tickets ///////////////////////
  static const String tickets = "tickets";
  static String ticketMessages(int ticketId) => "tickets/$ticketId/messages";
  static String ticketDetails(int ticketId) => "tickets/$ticketId";

  static const String products = "products";
  static const String validateCoupon = "coupons/validate";
  static const String orders = "orders";
  static const String favourites = "wishlist";
  static const String reviews = "reviews";
  static const String checkOrderPoints = "check-order-points";
  static const String checkProduct = "check-products";
  static String notifyWhenAvailable(num productId) =>
      "products/$productId/notify-when-available";
}
