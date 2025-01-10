import 'package:flutter/material.dart';
import 'package:country_insight/models/country.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  CountryDetailScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),
      body: SingleChildScrollView(
        child: Container(
        padding: const EdgeInsets.all(16.0),
          color: Colors.grey[200], // Background color for better contrast
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(country.flagUrl, width: 150),
              ),
              SizedBox(height: 16),
              Text(
                country.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Capital: ${country.capital}',
                  style: TextStyle(fontSize: 18)),
              Text('Region: ${country.region}', style: TextStyle(fontSize: 18)),
              Text('Subregion: ${country.subregion}',
                  style: TextStyle(fontSize: 18)),
              Text('Population: ${country.population}',
                  style: TextStyle(fontSize: 18)),
              Text('Area: ${country.area} km²', style: TextStyle(fontSize: 18)),
              SizedBox(height: 16),
              Text('Languages:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              for (var language in country.languages)
                Text('$language', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Text('Currencies:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              for (var currency in country.currencies)
                Text('${currency['name']} (${currency['symbol']})',
                    style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Text('Timezones:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              for (var timezone in country.timezones)
                Text('$timezone', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Text('Country Codes:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Alpha-2 Code: ${country.alpha2Code}',
                  style: TextStyle(fontSize: 16)),
              Text('Alpha-3 Code: ${country.alpha3Code}',
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Text('Calling Codes:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              for (var callingCode in country.callingCodes)
                Text('$callingCode', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Text('Internet Domain:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(country.internetDomain, style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Text('Demonym:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(country.demonym, style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Text('Coat of Arms:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              country.coatOfArms != 'No Coat of Arms'
                  ? Image.network(country.coatOfArms, width: 100)
                  : Text('No Coat of Arms', style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Text('Independent:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text(country.independent ? 'Yes' : 'No',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
