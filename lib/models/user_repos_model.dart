class UserReposModel {
  String? name;
  String? language;
  String? created_at;
  String? updated_at;

  UserReposModel({
    this.name,
    this.language,
    this.created_at,
    this.updated_at,
  });

  factory UserReposModel.fromJson(Map<String, dynamic> json) => UserReposModel(
        name: json["name"],
        language: json["language"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
      );
}
