enum UserType { sofi, jannis }

class UserProfile {
  final UserType userType;
  final String displayName;
  final String initials;

  UserProfile({
    required this.userType,
    required this.displayName,
    required this.initials,
  });

  static UserProfile sofi = UserProfile(
    userType: UserType.sofi,
    displayName: 'Sofi',
    initials: 'S',
  );

  static UserProfile jannis = UserProfile(
    userType: UserType.jannis,
    displayName: 'Jannis',
    initials: 'J',
  );
}