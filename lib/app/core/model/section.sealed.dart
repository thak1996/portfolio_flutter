import '../../modules/contact_section/contact.model.dart';
import '../../modules/experience_section/experience.model.dart';
import '../../modules/footer_section/footer.model.dart';
import '../../modules/hero_section/hero.model.dart';
import '../../modules/projects_section/projects.model.dart';
import '../../modules/study_section/study.model.dart';

sealed class SectionSealed {}

class HeroData extends SectionSealed {
  HeroData({required this.content});

  final HeroModel content;
}

class ProjectsData extends SectionSealed {
  ProjectsData({required this.content});

  final ProjectsModel content;
}

class ExperienceData extends SectionSealed {
  ExperienceData({required this.content});

  final ExperienceModel content;
}

class StudyData extends SectionSealed {
  StudyData({required this.content});

  final StudyModel content;
}

class ContactData extends SectionSealed {
  ContactData({required this.content});

  final ContactModel content;
}

class FooterData extends SectionSealed {
  FooterData({required this.content});

  final FooterModel content;
}
