import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:phones_test_case/app_model.dart';
import 'package:phones_test_case/exhibit/models/exhibit.dart';

part 'exhibit_state.dart';

class ExhibitCubit extends Cubit<ExhibitState> {
  ExhibitCubit() : super(const ExhibitInitial([])) {
    getExhibitList();
  }

  getExhibitList() {
    GetIt.instance<AppModel>()
        .exhibitsLoader
        .getExhibitList()
        .then((value) => emit(ExhibitState(value)));
  }
}
