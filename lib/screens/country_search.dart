import 'package:flutter/material.dart';
import 'package:country_insight/models/country.dart';

class CountrySearch extends SearchDelegate<Country?> {
  final Future<List<Country>> futureCountries;

  CountrySearch(this.futureCountries);

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<Country>>(
      future: futureCountries,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load countries'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No countries found'));
        } else {
          final countries = snapshot.data!;
          final filteredCountries = countries.where((country) {
            return country.name.toLowerCase().startsWith(query.toLowerCase());
          }).toList();

          return ListView.builder(
            itemCount: filteredCountries.length,
            itemBuilder: (context, index) {
              final country = filteredCountries[index];
              return ListTile(
                title: Text(country.name),
                subtitle: Text(country.region),
                leading: Image.network(country.flagUrl, width: 50),
                onTap: () {
                  close(context, country);
                },
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context,
            null); 
      },
    );
  }
}
