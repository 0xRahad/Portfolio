import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/utils/screen_size.dart';

import '../../../../core/consts/lists.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Skills",
            style: TextStyle(fontSize: 20, color: Colors.white60),
          ),
          const Gap(20),
          SizedBox(
            width: 700,
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: skillSet
                  .map((skill) => skillContainer(label: skill))
                  .toList(),
            ),
          ),
          Gap(20),
          Divider(height: 0),
          Gap(20),
          Text("Work Experience",
              style: TextStyle(fontSize: 20, color: Colors.white)),
          Gap(20),
          WorkExperienceView(experiences: jobExperiences)
        ],
      ),
    );
  }

  Widget skillContainer({required String label}) {
    return ChoiceChip(
      onSelected: (value) {},
      selected: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(color: Colors.grey)),
      label: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}

class WorkExperienceView extends StatelessWidget {
  final List<Map<String, String>> experiences;

  const WorkExperienceView({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: context.isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: experiences
                  .map((experience) => Expanded(
                        child: WorkExperienceCard(
                          title: experience['title']!,
                          description: experience['description']!,
                          duration: experience['duration']!,
                          location: experience['location']!,
                        ),
                      ))
                  .toList(),
            )
          : Column(
              children: experiences
                  .map((experience) => WorkExperienceCard(
                        title: experience['title']!,
                        description: experience['description']!,
                        duration: experience['duration']!,
                        location: experience['location']!,
                      ))
                  .toList(),
            ),
    );
  }
}

class WorkExperienceCard extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final String location;

  const WorkExperienceCard({
    super.key,
    required this.title,
    required this.description,
    required this.duration,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 600,
        height: 220,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.withOpacity(0.2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                duration,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Gap(10),
              Text(
                location,
                style: TextStyle(color: Colors.white, fontSize: 14),
              )
            ]),
            Expanded(
              child: Text(
                description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
