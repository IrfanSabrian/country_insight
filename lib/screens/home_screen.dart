import 'package:flutter/material.dart';
import 'package:country_insight/models/country.dart';
import 'package:country_insight/services/api_service.dart';
import 'package:country_insight/screens/country_search.dart';
import 'package:country_insight/screens/country_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Country>> futureCountries;

  @override
  void initState() {
    super.initState();
    futureCountries = ApiService.fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Insight'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CountrySearch(futureCountries),
              ).then((result) {
                if (result != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CountryDetailScreen(country: result),
                    ),
                  );
                }
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Country>>(
        future: futureCountries,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Snapshot error: ${snapshot.error}');
            return Center(child: Text('Failed to load countries'));
          } else if (snapshot.hasData) {
            // Sort countries by name
            List<Country> countries = snapshot.data!;
            countries.sort((a, b) => a.name.compareTo(b.name));
            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    countries[index].name,
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                  subtitle: Text(
                    countries[index].region,
                    overflow: TextOverflow.ellipsis, // Handle overflow
                  ),
                  leading: Image.network(countries[index].flagUrl, width: 50),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CountryDetailScreen(country: countries[index]),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
