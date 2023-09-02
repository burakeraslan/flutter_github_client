class FollowersFollowingModel {
  final String? login;
  final String? avatarUrl;

  FollowersFollowingModel({
    this.login,
    this.avatarUrl,
  });

  factory FollowersFollowingModel.fromJson(Map<String, dynamic> json) {
    return FollowersFollowingModel(
      login: json["login"],
      avatarUrl: json["avatar_url"],
    );
  }
}
