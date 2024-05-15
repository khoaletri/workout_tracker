import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../database/database.dart';
import '../../theme/theme.dart';
import '../exercise.dart';

class ExerciseDetailView extends StatefulWidget {
  const ExerciseDetailView({
    super.key,
    required this.exercise,
    required this.onModify,
  });

  final Exercise exercise;
  final Function(Exercise exercise) onModify;

  @override
  State<ExerciseDetailView> createState() => _ExerciseDetailViewState();
}

class _ExerciseDetailViewState extends State<ExerciseDetailView> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const Heading(
          title: 'Image',
          side: true,
          size: HeadingSize.medium,
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: T(context).space.large,
          ),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 200,
              alignment: Alignment.center,
              padding: EdgeInsets.all(
                T(context).space.large,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: T(context).color.surface,
              ),
              child: Image.network(
                'https://hips.hearstapps.com/hmg-prod/images/incline-barbell-bench-press-640731bc88b98.jpg', // Replace with your image or GIF URL
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Image not available \n \n Support us in providing visuals for this exercise on Github.',
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ),
          ),
        ),
        const Heading(
          title: 'Details',
          side: true,
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: T(context).space.large),
          sliver: SliverToBoxAdapter(
            child: ExerciseEditWidget(
              exercise: widget.exercise,
              onModify: widget.onModify,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: T(context).space.large,
          ),
        ),
      ],
    );
  }
}
