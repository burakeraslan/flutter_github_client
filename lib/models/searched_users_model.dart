class SearchedUsersModel {
  final String login;
  final String avatarUrl;

  SearchedUsersModel({required this.login, required this.avatarUrl});

  factory SearchedUsersModel.fromJson(Map<String, dynamic> json) {
    return SearchedUsersModel(
      login: json["login"],
      avatarUrl: json["avatar_url"],
    );
  }
}
