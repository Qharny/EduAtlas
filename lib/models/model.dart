class University {
  final String country;
  final String name;
  final String alphaTwoCode;
  final String? stateProvince;
  final List<String> domains;
  final List<String> webPages;

  University({
    required this.country,
    required this.name,
    required this.alphaTwoCode,
    this.stateProvince,
    required this.domains,
    required this.webPages,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      country: json['country'],
      name: json['name'],
      alphaTwoCode: json['alpha_two_code'],
      stateProvince: json['state-province'],
      domains: List<String>.from(json['domains']),
      webPages: List<String>.from(json['web_pages']),
    );
  }
}