import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_place/google_place.dart';
import 'package:on_ground/model/broker_req_body.dart';
import 'package:on_ground/model/cityModel/city_model.dart';
import 'package:on_ground/model/employee/employee_model.dart';
import 'package:on_ground/model/polygon/polygon_model.dart';
import 'package:on_ground/presentation/whiteListBroker/white_list_broker_cubit_state.dart';
import 'package:on_ground/repository/whitelist_repository.dart';
import 'package:on_ground/utils/common.dart';

class WhiteListBrokerCubit extends Cubit<WhiteListBrokerCubiteState> {
  WhiteListBrokerCubit({required this.repository}) : super(InitialState());
  final IWhitelistRepository repository;
  List<EmployeeModel>? employeeList;
  List<PolygoneModel>? polygonList;
  EmployeeModel? employeeModel;
  PolygoneModel? polygoneModel;
  List<PolygoneModel>? polygonData;
  int cityId = 1;
  TextEditingController numberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController orgNameController = TextEditingController();
  TextEditingController orgAddController = TextEditingController();
  final googlePlace = GooglePlace('AIzaSyBc5Ag5toJfGVsDsqdsTrvIgsaae4RqGQw');
  List<AutocompletePrediction>? predictions;
  AutocompletePrediction? place;
  List<CityModel> cities = [
    CityModel(
      name: "Mumbai",
      id: 1
    ),
    CityModel(
      name: "Pune",
      id: 37
    ),
    CityModel(
      name: "Bangalore",
      id: 2
    ),
    CityModel(
      name: "Gurgaon",
      id: 3
    )
  ];

  getListData() async {
    final _employeeData = await repository.getAllBNEmployee();
    final _polygonData = await repository.getAllLocation(cityId.toString());
    employeeList = _employeeData;
    
    emit(GetListDataState(
      employeeList: _employeeData,
      polygonList: _polygonData,
      predictions: predictions
    ));
  }

  getLOcationData(int id) async{
    cityId = id;
    final _polygonData = await repository.getAllLocation(id.toString());
    polygonData = _polygonData;
    emit(GetListDataState(
      employeeList: employeeList,
      polygonList: polygonData,
      predictions: predictions
    ));
  }

  whitelistBoker() async{
    if(numberController.text.isEmpty ) {
      Common.showToast('Please enter phone number');
      return;
    }
    if(numberController.text.length < 10 ) {
      Common.showToast('Please enter valid phone number');
      return;
    }
    if(nameController.text.isEmpty) {
      Common.showToast('Please enter name');
      return;
    }
    if(orgNameController.text.isEmpty) {
      Common.showToast('Please enter organisation name');
      return;
    }
    if(employeeModel == null) {
      Common.showToast('Please enter employee');
    }
    if(polygoneModel == null) {
      Common.showToast('Please select locality');
    }
     
    showLoader();
    try {
      final data = await repository.whilteListBroker(
      
      WhitelistReqBody(
        assignTo: employeeModel?.uuid,
        brokerName: nameController.text,
        firmAddress:place?.description ?? '',
        organisationName:  orgNameController.text,
        phoneNumber:numberController.text,
        polygonUUID: polygoneModel?.uuid,
        placeId: place?.placeId ?? ''
      )
      
    );
    hideLoader();
    if(data??false) {
      nameController.text = '';
      orgAddController.text = '';
      orgNameController.text = '';
      numberController.text = '';
      Common.showToast('Broker Whitelisted.');
      return;
    }
    // ignore: empty_catches
    }catch (e) {

    }
    hideLoader();
    
    Common.showToast('Failed to whitelist broker');
      return;
  }



   onFindPlace(String? searchText) async{
    
    AutocompleteResponse? result = await googlePlace.autocomplete.get(searchText ??'');

    if(result?.predictions !=null) {
      predictions = result?.predictions;
      emit(GetListDataState(
      employeeList: employeeList,
      polygonList: polygonData,
      predictions: predictions
    ));
      
    }

    
    
  }
}