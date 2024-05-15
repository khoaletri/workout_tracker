import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maven/feature/routine/screen/routine_edit_screen.dart';

import '../../../common/common.dart';
import '../../exercise/model/exercise_list.dart';
import '../../theme/theme.dart';
import '../session.dart';

showSessionOptionsView(BuildContext context, Session session) {
  showBottomSheetDialog(
    context: context,
    child: ListDialog(
      children: [
        ListTile(
          onTap: () {
            print(session.routine.toJson());
          },
          leading: const Icon(
            Icons.library_add_outlined,
          ),
          title: const Text(
            'Nice',
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RoutineEditScreen(
                  routine: session.routine,
                  exerciseList: ExerciseList([]),
                  onSubmit: (routine, exerciseGroups) {
                    Navigator.pop(context);
                    // TODO THJS
                    context.read<SessionBloc>().add(
                          SessionUpdate(
                            session: session.copyWith(
                              routine: routine,
                              exerciseGroups: [],
                            ),
                          ),
                        );
                  },
                ),
              ),
            );
          },
          leading: const Icon(
            Icons.edit_rounded,
          ),
          title: const Text(
            'Edit',
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const Icon(
            Icons.library_add_outlined,
          ),
          title: const Text(
            'Create Template',
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pop(context);
            context.read<SessionBloc>().add(
                  SessionDelete(
                    session: session,
                  ),
                );
          },
          leading: Icon(
            Icons.delete,
            color: T(context).color.error,
          ),
          title: Text(
            'Delete',
            style: TextStyle(
              color: T(context).color.error,
            ),
          ),
        )
      ],
    ),
  );
}
