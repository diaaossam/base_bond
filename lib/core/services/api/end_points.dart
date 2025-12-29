class EndPoints {
  ////////////////////// Public ///////////////////
  static const String sliders = "banners";
  static const String categories = "categories";
  static const String brands = "brands";

  /////////////////////// Location //////////////////

  static const String governorates = "governorates";
  static const String addresses = "addresses";
  static const String makeAddressDefault = "make-default-address";


  ///////// Auth ////////////////////////
  static const String register = "auth/register";
  static const String login = "auth/login";
  static const String update = "profile/update";
  static const String socialLogin = "auth/social";
  static const String verifyUser = "auth/verify-phone";
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

  //////////////////// Chats ///////////////////////

  static const String products = "products";
  static const String validateCoupon = "coupons/validate";
  static const String orders = "orders";
  static const String favourites = "wishlist";
  static const String rateOrder = "rate-order";
  static const String checkOrderPoints = "check-order-points";
  static const String checkProduct = "check-products";
}
