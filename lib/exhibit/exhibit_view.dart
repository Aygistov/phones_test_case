import 'package:flutter/material.dart';
import 'package:phones_test_case/exhibit/exhibit.dart';
import 'package:phones_test_case/exhibit/rest_exhibit_loader.dart';

class ExhibitListView extends StatelessWidget {
  const ExhibitListView({
    super.key,
  });

  Future<List<Exhibit>> getExhibitList() {
    RestExhibitsLoader restExhibitsLoader = RestExhibitsLoader();
    return restExhibitsLoader.getExhibitList();
  }

  @override
  Widget build(BuildContext context) {
    double imageHeight = 100;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Phones'),
        ),
        body: FutureBuilder<List<Exhibit>>(
          future: getExhibitList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(snapshot.data![index].title),
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: snapshot.data![index].images
                                .map((entry) => Image.network(
                                      entry,
                                      height: imageHeight,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const ErrorImageWidget();
                                      },
                                    ))
                                .toList(),
                          )),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ));
  }
}

class ErrorImageWidget extends StatelessWidget {
  const ErrorImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      alignment: Alignment.center,
      child: const Text(
        'Not found',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
