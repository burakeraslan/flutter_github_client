import 'package:flutter/material.dart';

class RepoRow extends StatelessWidget {
  const RepoRow({
    super.key,
    required this.repoName,
    required this.repoLanguage,
    required this.repoCreatedAt,
    required this.repoUpdatedAt,
  });

  final String repoName;
  final String repoLanguage;
  final String repoCreatedAt;
  final String repoUpdatedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Column(children: [
        Row(
          children: [
            const Icon(Icons.inbox),
            Text(
              " $repoName",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.language),
            Text(
              " $repoLanguage",
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            )
          ],
        ),
        Row(
          children: [
            const Icon(Icons.create),
            Text(
              " $repoCreatedAt",
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            )
          ],
        ),
        Row(
          children: [
            const Icon(Icons.update),
            Text(
              " $repoUpdatedAt",
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
              ),
            )
          ],
        )
      ]),
    );
  }
}
