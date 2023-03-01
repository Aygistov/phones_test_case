import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:phones_test_case/exhibit/cubit/exhibit_cubit.dart';
import 'package:phones_test_case/exhibit/widgets/error_image_widget.dart';
import 'package:phones_test_case/exhibit/models/exhibit.dart';

GetIt getIt = GetIt.instance;

class ExhibitListView extends StatelessWidget {
  const ExhibitListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Phones'),
        ),
        body: BlocProvider(
          create: (context) => ExhibitCubit(),
          child: const ExhibitListWidget(),
        ));
  }
}

class ExhibitListWidget extends StatelessWidget {
  const ExhibitListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double imageHeight = 100;
    List<Exhibit> exhibits = context.watch<ExhibitCubit>().state.exhibits;

    return ListView(
      children: exhibits
          .map(
            (exhibit) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: exhibit.images
                      .map((entry) => Column(
                            children: [
                              Text(exhibit.title),
                              Image.network(
                                entry,
                                height: imageHeight,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return ErrorImageWidget(imageHeight);
                                },
                              ),
                            ],
                          ))
                      .toList(),
                )),
          )
          .toList(),
    );
  }
}
