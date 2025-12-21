class EndPoints {
  ////////////////////// Public ///////////////////
  static const String sliders = "banners";
  static const String categories = "categories";
  static const String brands = "brands";
  /////////////////////// Location //////////////////

  static const String governorates = "governorates";

  ///////// Auth ////////////////////////
  static const String loginUser = "v1/auth/login";
  static const String update = "v1/profile/update";
  static const String socialLogin = "v1/auth/social";
  static const String verifyUser = "v1/auth/verify-otp";

  static String updateUserRegister(String ulid) => "v1/auth/update/$ulid";
  static String logOut = "v1/profile/logout";
  static String getUserData = "v1/user/profile";
  static String deleteUser = "v1/profile/delete-account";
  static const String profile = "v1/profile/me";

  ///////////////// Settings////////////////
  static const String appSettings = "app-settings";

  ///////// Public ////////////////////////

  static const String introOnBoarding = "v1/intro-images";
  static const String uploadImage = "v1/temp-media";

  static deleteImage(String uid) => "v1/profile/delete-image$uid";
  static const String skinProblem = "v1/skin-problems";

  //////////////////////////// Notification //////////////////
  static const String notfications = "v1/notification";
  static const String updateNotfications = "v1/profile/update-notification";
  static const String markAllAsRead = "v1/mark-all-notifications-as-read";
  static const String deletionReasons = "v1/deletion-reasons";

  ///////// Register //////////////////

  static const String register = "v1/auth/register";

  //////////////////// Users /////////////////////////////
  static user(String userId) => 'v1/users/$userId';
  static const String language = "v1/profile/language";
  static const String explore = "v1/explore";

  static sendBlock(String userId) => "v1/blocklists/$userId";
  static const String block = "v1/blocklists";
  static const String report = "v1/report-types";
  static const String sendReport = "v1/user-report";
  static const String suggestions = "v1/suggestion-types";
  static const String sendSuggestion = "v1/user-suggestion";
  static const String plans = "v1/plans";

  static pages(String id) => "v1/pages/$id";
  static const String questions = "v1/questions";
  static const String faqQuestions = "v1/faq-questions";

  //////////////////// Chats ///////////////////////

  static const String supportChat = "v1/support-chat";
  static const String addresses = "v1/addresses";
  static const String makeAddressDefault = "v1/make-default-address";
  static const String products = "products";
  static const String validateCoupon = "v1/validate-coupon";
  static const String placeOrder = "v2/orders";
  static const String orders = "v1/orders";
  static const String favourites = "v1/favourites";
  static const String rateOrder = "v1/rate-order";
  static const String checkOrderPoints = "v1/check-order-points";
  static const String productAvailability = "v1/product-availability";
  static const String checkProduct = "v1/check-products";
}
