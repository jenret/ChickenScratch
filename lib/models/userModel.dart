class UserModel {
  final String userUUID;
  final String username;
  final String displayname;
  final String profilePicturePath;
  final String bannerPicturePath;
  UserModel({
    required this.userUUID,
    required this.username,
    required this.displayname,
    required this.profilePicturePath,
    required this.bannerPicturePath,
});
}