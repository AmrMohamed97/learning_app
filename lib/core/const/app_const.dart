import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class AppConstant {
  static String currentLanguage = Intl.getCurrentLocale() == 'en_US'
      ? 'en'
      : 'ar';

  static const String baseUrl = 'https://afaq.sys-web.net/';
  static const String baseUrlApi = '${baseUrl}api/v1/';
  static const String baseImageUrl = '${baseUrl}uploads/';
  static const String baseFileUrl = '${baseUrl}uploads/files/';
  static const String loginUrl = 'auth/login';
  static const String addOrderUrl = 'save_order';
  static const String getCategoriesUrl = 'get_categories';
  static const String getCategoryProductsUrl = 'get_category_products';
  static const String searchProducts = 'search_and_filter';
  static const String registerUrl = 'auth/register';
  static const String returnPolicyUrl = 'return_policy';
  static const String changeAddressUrl = 'update_location';
  static const String getProfileUrl = 'auth/profile';
  static String getFavoritesUrl = "get_favorites";
  static String getOffers = "weekly_discount/products";
  static String getProducts = "get_products";
  static String getBestOffers = "weekly_discount";

  static String ordersUrl = "orders";

  static String getHomeAds = "sliders";
  static String showProduct = "show_product";

  //font family
  static String fontSF = "SF-Pro-Rounded";

  //----hive
  static const String cartBox = "cartBox";
  static const String contactUsUrl = "contact_us";
  static const String validateCouponUrl = "validate_coupon";

  //----------------------------------------------------------------------------
  static const String accessToken = "token";
  static const String isLogin = "isLogin";
  static const String refreshToken = "refreshToken";
  static const String lang = "lang";
  static const String userBox = "userBox";
  static const String userInfoBox = "userInfoBox";
  static const String currentLocation = "currentLocation";
  static const String locationList = "locationList";
  static const String adressBox = "adressBox";
  static const kNewProduct = 'kNewProduct';
  static const kHotOffer = 'hotOffer';
  static const kWeeklyOffers = 'kOffer';
  static const kFontFamily = "Tajawal";
  static const knotification = "notification";
  static const kTheme = "Ktheme";
  String appUrl = "";
  static String toggleFavoriteUrl = 'toggle_favorite';
  String kDeviceToken = "";
  static const String aboutUsUrl = 'about_us';
  static const String logoutUrl = 'auth/logout';
  static const String editPasswordUrl = 'update_password';
  static const String validatePasswordMessage =
      'كلمة السر يجب أن تشمل 8 أحرف و حروف كبيرة وصغيرة ورقم ورمز';
  static const String editProfileUrl = 'update_profile';

  // static final productExmaple = sl<Product>();

  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.grey.withValues(alpha: 0.5),
      spreadRadius: -2,
      blurRadius: 6,
    ),
  ];
  static double horizontalPadding = 18;

  static double screenHeight(context) => MediaQuery.sizeOf(context).height;

  static double screenWidth(context) => MediaQuery.sizeOf(context).width;

  static String imageUrl(path) {
    return '$baseImageUrl$path';
  }

  static String? token;

  static const String userData = "userData";
}
