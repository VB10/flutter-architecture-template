class SettingsDynamicModel {
  final String? url;
  final String title;

  SettingsDynamicModel(this.title, {this.url});

  factory SettingsDynamicModel.fakeArchitecturePR() {
    return SettingsDynamicModel('Project Contributors',
        url: 'https://github.com/VB10/flutter-architecture-template/pulls?q=is%3Apr+is%3Aopen+sort%3Aupdated-desc');
  }

  factory SettingsDynamicModel.fakeNull() {
    return SettingsDynamicModel(
      'Project Contributors',
    );
  }
}
