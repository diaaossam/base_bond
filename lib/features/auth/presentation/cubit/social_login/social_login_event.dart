part of 'social_login_bloc.dart';

@immutable
sealed class SocialLoginEvent {}

class LoginWithSocialEvent extends SocialLoginEvent {
  final SocialEnum socialEnum;

  LoginWithSocialEvent({required this.socialEnum});
}
