import 'dart:convert';

class AppSettings {
  AppSettings({
    String? title,
    String? description,
    dynamic metaTagDescription,
    dynamic metaTagKeywords,
    dynamic metaTagTitle,
    String? firstEmail,
    dynamic secondEmail,
    String? firstPhone,
    dynamic secondPhone,
    String? whatsappPhone,
    String? facebookLink,
    String? twitterLink,
    String? instagramLink,
    String? linkedinLink,
    String? snapchatLink,
    String? tiktokLink,
    String? youtubeLink,
    String? telegramLink,
    String? whatsappLink,
    String? pinterestLink,
    String? logo,
    String? userProfileImage,
  }) {
    _title = title;
    _description = description;
    _metaTagDescription = metaTagDescription;
    _metaTagKeywords = metaTagKeywords;
    _metaTagTitle = metaTagTitle;
    _firstEmail = firstEmail;
    _secondEmail = secondEmail;
    _firstPhone = firstPhone;
    _secondPhone = secondPhone;
    _whatsappPhone = whatsappPhone;
    _facebookLink = facebookLink;
    _twitterLink = twitterLink;
    _instagramLink = instagramLink;
    _linkedinLink = linkedinLink;
    _snapchatLink = snapchatLink;
    _tiktokLink = tiktokLink;
    _youtubeLink = youtubeLink;
    _telegramLink = telegramLink;
    _whatsappLink = whatsappLink;
    _pinterestLink = pinterestLink;
    _logo = logo;
    _userProfileImage = userProfileImage;
  }

  AppSettings.fromJson(dynamic json) {
    _title = json['title'];
    _description = json['description'];
    _metaTagDescription = json['meta_tag_description'];
    _metaTagKeywords = json['meta_tag_keywords'];
    _metaTagTitle = json['meta_tag_title'];
    _firstEmail = json['first_email'];
    _secondEmail = json['second_email'];
    _firstPhone = json['first_phone'];
    _secondPhone = json['second_phone'];
    _whatsappPhone = json['whatsapp_phone'];
    _facebookLink = json['facebook_link'];
    _twitterLink = json['twitter_link'];
    _instagramLink = json['instagram_link'];
    _linkedinLink = json['linkedin_link'];
    _snapchatLink = json['snapchat_link'];
    _tiktokLink = json['tiktok_link'];
    _youtubeLink = json['youtube_link'];
    _telegramLink = json['telegram_link'];
    _whatsappLink = json['whatsapp_link'];
    _pinterestLink = json['pinterest_link'];
    _logo = json['logo'];
    _userProfileImage = json['user_profile_image'];
  }

  String? _title;
  String? _description;
  dynamic _metaTagDescription;
  dynamic _metaTagKeywords;
  dynamic _metaTagTitle;
  String? _firstEmail;
  dynamic _secondEmail;
  String? _firstPhone;
  dynamic _secondPhone;
  String? _whatsappPhone;
  String? _facebookLink;
  String? _twitterLink;
  String? _instagramLink;
  String? _linkedinLink;
  String? _snapchatLink;
  String? _tiktokLink;
  String? _youtubeLink;
  String? _telegramLink;
  String? _whatsappLink;
  String? _pinterestLink;
  String? _logo;
  String? _userProfileImage;

  AppSettings copyWith({
    String? title,
    String? description,
    dynamic metaTagDescription,
    dynamic metaTagKeywords,
    dynamic metaTagTitle,
    String? firstEmail,
    dynamic secondEmail,
    String? firstPhone,
    dynamic secondPhone,
    String? whatsappPhone,
    String? facebookLink,
    String? twitterLink,
    String? instagramLink,
    String? linkedinLink,
    String? snapchatLink,
    String? tiktokLink,
    String? youtubeLink,
    String? telegramLink,
    String? whatsappLink,
    String? pinterestLink,
    String? logo,
    String? userProfileImage,
  }) => AppSettings(
    title: title ?? _title,
    description: description ?? _description,
    metaTagDescription: metaTagDescription ?? _metaTagDescription,
    metaTagKeywords: metaTagKeywords ?? _metaTagKeywords,
    metaTagTitle: metaTagTitle ?? _metaTagTitle,
    firstEmail: firstEmail ?? _firstEmail,
    secondEmail: secondEmail ?? _secondEmail,
    firstPhone: firstPhone ?? _firstPhone,
    secondPhone: secondPhone ?? _secondPhone,
    whatsappPhone: whatsappPhone ?? _whatsappPhone,
    facebookLink: facebookLink ?? _facebookLink,
    twitterLink: twitterLink ?? _twitterLink,
    instagramLink: instagramLink ?? _instagramLink,
    linkedinLink: linkedinLink ?? _linkedinLink,
    snapchatLink: snapchatLink ?? _snapchatLink,
    tiktokLink: tiktokLink ?? _tiktokLink,
    youtubeLink: youtubeLink ?? _youtubeLink,
    telegramLink: telegramLink ?? _telegramLink,
    whatsappLink: whatsappLink ?? _whatsappLink,
    pinterestLink: pinterestLink ?? _pinterestLink,
    logo: logo ?? _logo,
    userProfileImage: userProfileImage ?? _userProfileImage,
  );

  String? get title => _title;

  String? get description => _description;

  dynamic get metaTagDescription => _metaTagDescription;

  dynamic get metaTagKeywords => _metaTagKeywords;

  dynamic get metaTagTitle => _metaTagTitle;

  String? get firstEmail => _firstEmail;

  dynamic get secondEmail => _secondEmail;

  String? get firstPhone => _firstPhone;

  dynamic get secondPhone => _secondPhone;

  String? get whatsappPhone => _whatsappPhone;

  String? get facebookLink => _facebookLink;

  String? get twitterLink => _twitterLink;

  String? get instagramLink => _instagramLink;

  String? get linkedinLink => _linkedinLink;

  String? get snapchatLink => _snapchatLink;

  String? get tiktokLink => _tiktokLink;

  String? get youtubeLink => _youtubeLink;

  String? get telegramLink => _telegramLink;

  String? get whatsappLink => _whatsappLink;

  String? get pinterestLink => _pinterestLink;

  String? get logo => _logo;

  String? get userProfileImage => _userProfileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = _title;
    map['description'] = _description;
    map['meta_tag_description'] = _metaTagDescription;
    map['meta_tag_keywords'] = _metaTagKeywords;
    map['meta_tag_title'] = _metaTagTitle;
    map['first_email'] = _firstEmail;
    map['second_email'] = _secondEmail;
    map['first_phone'] = _firstPhone;
    map['second_phone'] = _secondPhone;
    map['whatsapp_phone'] = _whatsappPhone;
    map['facebook_link'] = _facebookLink;
    map['twitter_link'] = _twitterLink;
    map['instagram_link'] = _instagramLink;
    map['linkedin_link'] = _linkedinLink;
    map['snapchat_link'] = _snapchatLink;
    map['tiktok_link'] = _tiktokLink;
    map['youtube_link'] = _youtubeLink;
    map['telegram_link'] = _telegramLink;
    map['whatsapp_link'] = _whatsappLink;
    map['pinterest_link'] = _pinterestLink;
    map['logo'] = _logo;
    map['user_profile_image'] = _userProfileImage;
    return map;
  }
}
