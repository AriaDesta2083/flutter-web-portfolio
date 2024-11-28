class SkillModel {
  String label;
  String imgUrl;

  SkillModel({required this.label, required this.imgUrl});

  static List<SkillModel> getListModel() {
    return [
      SkillModel(label: 'Flutter', imgUrl: 'ic_flutter.png'),
      SkillModel(label: 'Dart', imgUrl: 'ic_dart.png'),
      SkillModel(label: 'Firebase', imgUrl: 'ic_firebase.png'),
      SkillModel(label: 'Laravel', imgUrl: 'ic_laravel.png'),
      SkillModel(label: 'php', imgUrl: 'ic_php.png'),
      SkillModel(label: 'Python', imgUrl: 'ic_python.png'),
      SkillModel(label: 'SqlLite', imgUrl: 'ic_sqlite.png'),
      SkillModel(label: 'MySql', imgUrl: 'ic_mysql.png'),
      SkillModel(label: 'Git', imgUrl: 'ic_git.png'),
      SkillModel(label: 'GitHub', imgUrl: 'ic_github.png'),
      SkillModel(label: 'GitLab', imgUrl: 'ic_gitlab.png'),
      SkillModel(label: 'Figma', imgUrl: 'ic_figma.png'),
      SkillModel(label: 'Android Studio', imgUrl: 'ic_androidstudio.png'),
      SkillModel(label: 'VS Code', imgUrl: 'ic_vscode.png'),
      SkillModel(label: 'Postman', imgUrl: 'ic_postman.png'),
      SkillModel(label: 'Flutter', imgUrl: 'ic_flutter.png'),
      SkillModel(label: 'Dart', imgUrl: 'ic_dart.png'),
      SkillModel(label: 'Firebase', imgUrl: 'ic_firebase.png'),
      SkillModel(label: 'Laravel', imgUrl: 'ic_laravel.png'),
      SkillModel(label: 'php', imgUrl: 'ic_php.png'),
      SkillModel(label: 'Python', imgUrl: 'ic_python.png'),
      SkillModel(label: 'SqlLite', imgUrl: 'ic_sqlite.png'),
      SkillModel(label: 'MySql', imgUrl: 'ic_mysql.png'),
      SkillModel(label: 'Git', imgUrl: 'ic_git.png'),
      SkillModel(label: 'GitHub', imgUrl: 'ic_github.png'),
      SkillModel(label: 'GitLab', imgUrl: 'ic_gitlab.png'),
      SkillModel(label: 'Figma', imgUrl: 'ic_figma.png'),
      SkillModel(label: 'Android Studio', imgUrl: 'ic_androidstudio.png'),
      SkillModel(label: 'VS Code', imgUrl: 'ic_vscode.png'),
      SkillModel(label: 'Postman', imgUrl: 'ic_postman.png'),
    ];
  }
}

class ExperienceModel {
  String label;
  String date;
  String jobs;
  String description;
  List<String> listPoin;

  ExperienceModel(
      {required this.label, required this.date, required this.jobs, required this.description, required this.listPoin});

  static List<ExperienceModel> getListModel() {
    return [
      ExperienceModel(
          label: 'PT Andalan Soulusi Cemerlang',
          date: 'Oct 2022 ~ Jan 2023',
          jobs: 'Flutter Mobile Developer',
          description: '',
          listPoin: [
            "Managed and developed multiple mobile application projects, successfully launching three apps on the Play Store.",
            "Led the development of a website using Flutter, integrating cross-platform functionality for enhanced performance.",
            "Engineered backend integrations with Firebase and microservices built with Node.js, deployed seamlessly on AWS.",
            "Demonstrated collaboration skills within a cross-functional team environment, ensuring timely project delivery."
          ]),
      ExperienceModel(
          label: 'RS Citra Husada Jember',
          date: 'Jan 2022 ~ Aug 2022',
          jobs: 'Flutter Mobile Developer',
          description: '',
          listPoin: [
            "Designed and implemented MEDKIT two apps, a mobile e-commerce application aimed at simplifying medical appointments and consultations.",
            "Developed features for customers to book appointments, consult with doctors, and order hospital services online.",
            "Built an admin panel to manage products, services, and user accounts.",
            "Used Flutter for mobile development and Firebase for database management.",
            "Provided detailed project documentation and a video demonstration for stakeholders."
          ]),
    ];
  }
}

class ProjectModel {
  String label;
  List image;
  String app;
  String url;
  List<String> listPoin;

  ProjectModel(
      {required this.label, required this.image, required this.app, required this.url, required this.listPoin});

  static List<ProjectModel> getListModel() {
    return [
      ProjectModel(
          label: 'PT Andalan Solusi Cemerlang',
          image: ['img_a1_d.jpg', 'img_pa_l.jpg'],
          app: 'Absensiku',
          url: 'https://play.google.com/store/apps/details?id=com.asc.absensiku',
          listPoin: [
            "Absensiku is an application that is suitable for companies in managing employee attendance. This application is designed in such a way as to make it easier to check all employee activities with several features including.",
            " For employees : Checking attendance with valid location",
            "Skills : Flutter, GetX , RestAPI, Firebase",
          ]),
      ProjectModel(
          label: 'PT Andalan Soulusi Cemerlang',
          image: ['img_p2_d.jpg', 'img_p2_l.jpg'],
          app: 'Propertiku',
          url: 'https://play.google.com/store/apps/details?id=com.asc.pr0pertiku',
          listPoin: [
            "Propertiku is an application made to make it easier to apply for mortgages. You can apply for a mortgage purchase by entering your personal data and files requested for submission through this application, then you can monitor the application process until you know the application has been accepted or rejected without having to contact the bank manually.",
            "Skills : Flutter, GetX , RestAPI, Firebase",
          ]),
      ProjectModel(
          label: 'PT Andalan Solusi Cemerlang',
          image: ['img_p1_d.jpg', 'img_p1_l.jpg'],
          app: 'Propertiku Bank',
          url: 'https://play.google.com/store/apps/details?id=com.asc.propertiku',
          listPoin: [
            "Propertiku Bank is a version of the Propertiku application for banks that aims to make it easier to check, evaluate and process mortgage applications. With this application, the Bank can more easily receive and revise data, provide assessments in the selection process, and send proposals to users",
            "Skills : Flutter, GetX , RestAPI, Firebase",
          ]),
      ProjectModel(
          label: 'RS Citra Husada Jember',
          image: ['img_rs2.jpg', 'img_rs1.jpg'],
          app: 'Medkit Admin',
          url: 'https://github.com/AriaDesta2083/admin_medkit',
          listPoin: [
            'MEDKIT is a mobile-based application designed to facilitate the buying and selling of products and services offered by our partners. This process operates on an E-Commerce concept, allowing customers to browse and place orders for products or services through the available features within the app.',
            'The system aims to save time and costs in reaching individuals, attract more new customers, simplify consultations with doctors, make it easier to find treatment options, and streamline the process of booking appointments or registering for medical services.',
            "Skills : Flutter, GetX , RestAPI, Firebase",
          ]),
      ProjectModel(
          label: 'RS Citra Husada Jember',
          image: ['img_rs1.jpg', 'img_rs2.jpg'],
          app: 'Medkit',
          url: 'https://github.com/AriaDesta2083/medkit_app',
          listPoin: [
            'MEDKIT ADMIN is a platform designed to efficiently manage products, services, and other operational features, providing seamless administration for partners and ensuring smooth integration with the MEDKIT mobile application.',
            "Skills : Flutter, GetX , RestAPI, Firebase",
          ]),
    ];
  }
}
