import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/consts/strings.dart';
import 'package:portfolio/core/utils/screen_size.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.isMobile ? 20.0 : 60.0),
      child: context.isMobile
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSkillList(context),
          const Gap(40),
          _buildWorkExperienceList(context),
        ],
      )
          : Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: _buildWorkExperienceList(context)),
          const Gap(40),
          Expanded(child: _buildSkillList(context)),
        ],
      ),
    );
  }

  // Build skill list for mobile and desktop
  Widget _buildSkillList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Technical Skills",
            style: TextStyle(
              fontSize: context.isMobile ? 24 : 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Gap(20),
        ..._buildSkills(context),
      ],
    );
  }

  List<Widget> _buildSkills(BuildContext context) {
    final skills = [
      ["Programming Languages", "Kotlin, Java, Dart, Python, JavaScript, PHP, C++"],
      ["Frameworks", "Jetpack Compose, KMP, Flutter"],
      ["Backend", "Node.js, Express.js, PHP"],
      ["Database", "MongoDB, MySQL, Firebase, Supabase, AppWrite, SQLite, Room, Hive"],
      ["Cloud", "Amazon AWS, DigitalOcean, Microsoft Azure"],
      ["CI/CD & DevOps", "GitHub Actions, GitLab CI/CD, CircleCI, CodeMagic"],
    ];

    return skills
        .map((skill) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: buildSkillSet(title: skill[0], description: skill[1], context: context),
    ))
        .toList();
  }

  Widget _buildWorkExperienceList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Work Experience",
            style: TextStyle(
              fontSize: context.isMobile ? 24 : 30,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Gap(20),
        ..._buildExperiences(context),
      ],
    );
  }

  List<Widget> _buildExperiences(BuildContext context) {
    final experiences = [
      [jobAsianGroup, "Mar 24 - Present", "Livorno, Italy (Remote)", jobAsianGroupSubtitle],
      [jobUpwork, "Jan 20 - Mar 24", "(Remote)", jobUpworkDesc],
      [jobFiverr, "Jan 20 - Present", "(Remote)", jobFiverrDesc],
    ];

    return experiences
        .map((exp) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: buildJobExperience(
        title: exp[0],
        duration: exp[1],
        location: exp[2],
        description: exp[3],
        context: context,
      ),
    ))
        .toList();
  }

  // Reusable skill set widget
  Widget buildSkillSet({
    required String title,
    required String description,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.greenAccent,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(8),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Reusable job experience widget
  Widget buildJobExperience({
    required String title,
    required String duration,
    required String location,
    required String description,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.greenAccent,
          ),
          textAlign: TextAlign.center,
        ),
        const Gap(8),
        Text(
          "$duration • $location",
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const Gap(8),
        Text(
          description,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
