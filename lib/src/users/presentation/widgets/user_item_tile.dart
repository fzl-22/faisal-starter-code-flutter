import 'package:cached_network_image/cached_network_image.dart';
import 'package:faisal_starter_code_flutter/core/resources/typographies.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserItemTile extends StatelessWidget {
  const UserItemTile({
    required this.onTap,
    required this.user,
    super.key,
  });

  final VoidCallback onTap;
  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: CachedNetworkImageProvider(
                user.avatar,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: Typographies.medium16,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    user.email,
                    style: Typographies.regular11,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
