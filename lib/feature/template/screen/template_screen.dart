import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maven/common/common.dart';

import '../../program/view/program_list_view.dart';
import '../../theme/theme.dart';
import '../../workout/workout.dart';
import '../template.dart';

/// Screen which manages templates, workouts, and programs
class TemplateScreen extends StatefulWidget {
  /// Creates a screen for managing templates, workouts, and programs
  const TemplateScreen({super.key});

  @override
  State<TemplateScreen> createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  List<Widget> hey = [
    SliverToBoxAdapter(
      child: Container(
        color: Colors.red,
        height: 50,
        width: 50,
      ),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return TitledScaffold(
      title: 'Workout',
      slivers: [
        const Heading(
          title: 'Quick Start',
          size: HeadingSize.small,
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FilledButton(
                  onPressed: () {
                    context.read<WorkoutBloc>().add(const WorkoutStateEmpty());
                  },
                  child: const Text(
                    'Start an Empty Workout',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor: T(context).color.surface,
                          foregroundColor: T(context).color.primary,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoutineEditScreen(
                                onSubmit: (routine, exerciseList) {
                                  context.read<TemplateBloc>().add(
                                        TemplateCreate(
                                          routine: routine,
                                          exerciseList: exerciseList,
                                        ),
                                      );
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.post_add,
                        ),
                        label: const Text(
                          'Create Template',
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: FilledButton.icon(
                        style: FilledButton.styleFrom(
                          backgroundColor: T(context).color.surface,
                          foregroundColor: T(context).color.primary,
                        ),
                        onPressed: () {
                          /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProgramBuilderScreen(),
                                ),
                              );*/
                        },
                        icon: const Icon(
                          Icons.polyline,
                        ),
                        label: const Text(
                          'Program',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
        /* BlocBuilder<WorkoutBloc, WorkoutState>(
              builder: (context, state) {
                if(!state.status.isError && state.pausedWorkouts.isNotEmpty) {
                  return const Heading(
                    title: 'In Progress',
                  );
                }
                return const SliverToBoxAdapter();
              },
            ),*/
        /*BlocBuilder<WorkoutBloc, WorkoutState>(
              builder: (context, state) {
                if (state.status == WorkoutStatus.loading) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                  );
                } else if (state.status == WorkoutStatus.error) {
                  return SliverToBoxAdapter(
                    child: Text(
                      'Something s wrong',
                      style: T(context).textStyle.bodyLarge,
                    ),
                  );
                } else {
                  */ /*List<Workout> workouts = state.pausedWorkouts;
                  return workouts.isEmpty
                      ? SliverToBoxAdapter()
                      : SliverList(
                          /// [SliverList] with [SizedBox] dividers between [PausedWorkoutWidget]s
                          ///
                          /// Mimics a [ListView.separated] since there's no SliverList.separated
                          ///
                          /// [Source](https://stackoverflow.com/a/58176779)
                          delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                              final int itemIndex = index ~/ 2;
                              if (index.isEven) {
                                return PausedWorkoutWidget(workout: workouts[itemIndex]);
                              }
                              return const SizedBox(height: 15);
                            },
                            semanticIndexCallback: (Widget widget, int localIndex) {
                              if (localIndex.isEven) {
                                return localIndex ~/ 2;
                              }
                              return null;
                            },
                            childCount: max(0, workouts.length * 2 - 1),
                          ),
                        );*/ /*
                  return SliverToBoxAdapter();
                }
              },
            ),*/
        const Heading(
          title: 'Templates',
        ),
        const TemplateListView(),
        const Heading(
          title: 'Programs',
        ),
        const ProgramListView(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
          ),
        ),
      ],
    );
  }
}
