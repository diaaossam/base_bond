class EndPoints {
  ////////////////////// Public ///////////////////
  static const String sliders = "banners";
  static const String categories = "categories";
  static const String brands = "brands";

  /////////////////////// Location //////////////////

  static const String governorates = "governorates";

  ///////// Location ////////////////////////
  static const String addresses = "addresses";

  ///////// Auth ////////////////////////
  static const String loginUser = "auth/login";
  static const String update = "profile/update";
  static const String socialLogin = "auth/social";
  static const String sendOtp = "auth/send-phone-otp";
  static const String verifyUser = "auth/verify-phone";
  static String logOut = "profile/logout";
  static String getUserData = "user/profile";
  static String deleteUser = "profile/delete-account";
  static const String profile = "profile/me";

  ///////////////// Settings////////////////
  static const String appSettings = "app-settings";

  ///////// Public ////////////////////////

  static const String introOnBoarding = "intro-images";
  static const String uploadImage = "temp-media";

  static deleteImage(String uid) => "profile/delete-image$uid";
  static const String skinProblem = "skin-problems";

  //////////////////////////// Notification //////////////////
  static const String notfications = "notification";
  static const String updateNotfications = "profile/update-notification";
  static const String markAllAsRead = "mark-all-notifications-as-read";
  static const String deletionReasons = "deletion-reasons";

  ///////// Register //////////////////

  static const String register = "auth/register";

  //////////////////// Users /////////////////////////////
  static user(String userId) => 'users/$userId';
  static const String language = "profile/language";
  static const String explore = "explore";

  static sendBlock(String userId) => "blocklists/$userId";
  static const String block = "blocklists";
  static const String report = "report-types";
  static const String sendReport = "user-report";
  static const String suggestions = "suggestion-types";
  static const String sendSuggestion = "user-suggestion";
  static const String plans = "plans";

  static pages(String id) => "pages/$id";
  static const String questions = "questions";
  static const String faqQuestions = "faq-questions";

  //////////////////// Chats ///////////////////////

  static const String supportChat = "support-chat";
  static const String makeAddressDefault = "make-default-address";
  static const String products = "products";
  static const String validateCoupon = "validate-coupon";
  static const String placeOrder = "v2/orders";
  static const String orders = "orders";
  static const String favourites = "favourites";
  static const String rateOrder = "rate-order";
  static const String checkOrderPoints = "check-order-points";
  static const String productAvailability = "product-availability";
  static const String checkProduct = "check-products";
}
