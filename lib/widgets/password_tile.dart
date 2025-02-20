import 'package:flutter/material.dart';
import 'package:pwd_mng/models/const.dart';
import 'package:pwd_mng/models/password_data.dart';
import 'package:pwd_mng/pages/password/view_password.dart';

class PasswordTile extends StatelessWidget {
  final PasswordData passwordDetail;
  const PasswordTile({
    super.key,
    required this.passwordDetail,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ViewPassword(passwordData: passwordDetail),
          ),
        );
      },
      leading: CircleAvatar(child: Text(passwordDetail.title.substring(0, 1))),
      title: Text(
        passwordDetail.title,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        passwordDetail.userId,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        children: [
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (passwordDetail.isFavorite) const Icon(Icons.star, size: 14),
              Container(
                margin: const EdgeInsets.only(left: 4),
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 4,
                  right: 6,
                  left: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(passwordTypeList[passwordDetail.type]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
