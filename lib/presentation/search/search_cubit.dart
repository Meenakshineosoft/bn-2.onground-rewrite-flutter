import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/model/dashborad/organisation_data.dart';
import 'package:on_ground/model/search/search_model.dart';
import 'package:on_ground/presentation/search/search_cubit_state.dart';
import 'package:on_ground/repository/dashborad_repository.dart';

class SearchCubit extends Cubit<SearchCubitState> {
  SearchCubit({required this.repository}) : super(InitialState());
  final IDashboradRepository repository;
  List<OrganisationData>? organisationList;
  bool isSeach = false;
  SearchModel? searchModel;
  int count = 1;
  searchData(String text) async{
    final _data = await repository.getDashboardSearchData(text);
    if (_data != null ) {
      isSeach = true;
      searchModel = _data;
      count += 1;
      emit(SearchList(searchModel: count));
    }
  }
}