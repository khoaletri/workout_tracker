import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../theme/theme.dart';
import '../session.dart';

class SessionListView extends StatelessWidget {
  const SessionListView({
    super.key,

    required this.sessions,
  });

  final List<Session> sessions;

  @override
  Widget build(BuildContext context) {
    if (sessions.isEmpty) {
      return const SliverBoxWidget();
    }
    return SliverList.separated(
      itemCount: sessions.length,
      separatorBuilder: (context, index) => SizedBox(
        height: T(context).space.medium,
      ),
      itemBuilder: (context, index) {
        Session session = sessions[index];
        return SessionWidget(session: session);
      },
    );
  }
}
