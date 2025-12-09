part of 'social_login_bloc.dart';

@immutable
sealed class SocialLoginEvent {}

class LoginWithSocial extends SocialLoginEvent {
  final SocialEnum socialEnum;

  LoginWithSocial({required this.socialEnum});
}
