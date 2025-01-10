class Country {
  final String name;
  final String capital;
  final String region;
  final String subregion;
  final int population;
  final String flagUrl;
  final double area;
  final List<String> languages;
  final List<Map<String, dynamic>> currencies; // Change to include symbol
  final List<String> timezones;
  final String alpha2Code;
  final String alpha3Code;
  final List<String> callingCodes;
  final String internetDomain;
  final String demonym;
  final String coatOfArms;
  final bool independent;

  Country({
    required this.name,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.population,
    required this.flagUrl,
    required this.area,
    required this.languages,
    required this.currencies,
    required this.timezones,
    required this.alpha2Code,
    required this.alpha3Code,
    required this.callingCodes,
    required this.internetDomain,
    required this.demonym,
    required this.coatOfArms,
    required this.independent,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    final name = json['name']['common'] ?? 'No Name';
    final capital = json['capital'] != null && json['capital'].isNotEmpty
        ? json['capital'][0]
        : 'No Capital';
    final region = json['region'] ?? 'No Region';
    final subregion = json['subregion'] ?? 'No Subregion';
    final population = json['population'] ?? 0;
    final flagUrl = json['flags']['png'] ?? 'No Flag';
    final area = json['area'] != null ? (json['area'] as num).toDouble() : 0.0;
    final languages = json['languages'] != null
        ? (json['languages'] as Map<String, dynamic>)
            .values
            .cast<String>()
            .toList()
        : ['No Languages'];
    final currencies = json['currencies'] != null
        ? (json['currencies'] as Map<String, dynamic>)
            .values
            .map((currency) => {
                  'name': currency['name'] ?? 'No Name',
                  'symbol': currency['symbol'] ?? 'No Symbol',
                })
            .toList()
        : [
            {'name': 'No Currency', 'symbol': 'No Symbol'}
          ];
    final timezones = json['timezones'] != null
        ? (json['timezones'] as List<dynamic>).cast<String>()
        : ['No Timezones'];
    final alpha2Code = json['cca2'] ?? 'No Alpha2 Code';
    final alpha3Code = json['cca3'] ?? 'No Alpha3 Code';
    final callingCodes = json['idd'] != null &&
            json['idd']['root'] != null &&
            json['idd']['suffixes'] != null
        ? (json['idd']['suffixes'] as List<dynamic>)
            .map((suffix) => '${json['idd']['root']}$suffix')
            .toList()
        : ['No Calling Codes'];
    final internetDomain =
        json['tld'] != null && (json['tld'] as List<dynamic>).isNotEmpty
            ? (json['tld'] as List<dynamic>)[0]
            : 'No Domain';
    final demonym = json['demonyms'] != null && json['demonyms']['eng'] != null
        ? json['demonyms']['eng']['m']
        : 'No Demonym';
    final coatOfArms =
        json['coatOfArms'] != null && json['coatOfArms']['png'] != null
            ? json['coatOfArms']['png']
            : 'No Coat of Arms';
    final independent = json['independent'] ?? false;

    return Country(
      name: name,
      capital: capital,
      region: region,
      subregion: subregion,
      population: population,
      flagUrl: flagUrl,
      area: area,
      languages: languages,
      currencies: currencies,
      timezones: timezones,
      alpha2Code: alpha2Code,
      alpha3Code: alpha3Code,
      callingCodes: callingCodes,
      internetDomain: internetDomain,
      demonym: demonym,
      coatOfArms: coatOfArms,
      independent: independent,
    );
  }

  factory Country.defaultCountry() {
    return Country(
      name: 'Unknown',
      capital: 'Unknown',
      region: 'Unknown',
      subregion: 'Unknown',
      population: 0,
      flagUrl: '',
      area: 0.0,
      languages: ['Unknown'],
      currencies: [
        {'name': 'Unknown', 'symbol': 'Unknown'}
      ],
      timezones: ['Unknown'],
      alpha2Code: 'Unknown',
      alpha3Code: 'Unknown',
      callingCodes: ['Unknown'],
      internetDomain: 'Unknown',
      demonym: 'Unknown',
      coatOfArms: 'Unknown',
      independent: false,
    );
  }
}
