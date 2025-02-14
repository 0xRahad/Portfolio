import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/core/consts/strings.dart';
import 'package:portfolio/core/utils/screen_size.dart';

import '../widgets/project_card.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProjectModel> projects = [
      ProjectModel(
        title: "Sposhto-AI App",
        technologies: ["Kotlin", "Tensorflow light", "MVVM", "ML Model"],
        description: sposhtoAppDesc,
        imageUrl:
            "https://res.cloudinary.com/dgvpyx7at/image/upload/f_auto,q_auto/ygz45opnkri3x1ozoiyk",
      ),
      ProjectModel(
        title: "AGD SIM Activation",
        technologies: [
          "Flutter",
          "Riverpod",
          "MVVM",
          "Laravel",
          "MySQL",
          "Github"
        ],
        description: simAppDesc,
        imageUrl:
            "https://res.cloudinary.com/dgvpyx7at/image/upload/f_auto,q_auto/id7yl79mv1ouzoq3ctd6",
      ),
      ProjectModel(
        title: "Asian Group Distributor",
        technologies: [
          "Flutter",
          "Riverpod",
          "MVVM",
          "Laravel",
          "MySQL",
          "Github"
        ],
        description: asianGroupDesc,
        imageUrl:
            "https://res.cloudinary.com/dgvpyx7at/image/upload/f_auto,q_auto/eoc67lxbqeouixsurfho",
      ),
      ProjectModel(
        title: "Rio Bottom Navigation Bar",
        technologies: [
          "Kotlin",
          "Jetpack Compose",
        ],
        description: rioBottomNavDesc,
        imageUrl:
            "https://res.cloudinary.com/dgvpyx7at/image/upload/f_auto,q_auto/ny0voatub1zbpmiv8lq6",
      ),
    ];

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: context.isMobile ? 20.0 : 100.0),
      child: Column(
        children: [
          Center(
            child: Text(
              "Recent Projects",
              style: TextStyle(
                fontSize: context.isMobile ? 24 : 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Gap(20),
          Column(
            children: projects
                .map((project) => Column(
                      children: [
                        ProjectCard(
                          title: project.title,
                          description: project.description,
                          imageUrl: project.imageUrl,
                          technologies: project.technologies,
                        ),
                        const Gap(20),
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class ProjectModel {
  final String title;
  final List<String> technologies;
  final String description;
  final String imageUrl;

  ProjectModel({
    required this.title,
    required this.technologies,
    required this.description,
    required this.imageUrl,
  });
}
