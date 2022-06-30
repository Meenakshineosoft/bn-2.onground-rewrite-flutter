import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_place/google_place.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/model/cityModel/city_model.dart';
import 'package:on_ground/model/employee/employee_model.dart';
import 'package:on_ground/model/polygon/polygon_model.dart';
import 'package:on_ground/presentation/whiteListBroker/white_list_broker_cubit.dart';
import 'package:on_ground/presentation/whiteListBroker/white_list_broker_cubit_state.dart';
import 'package:on_ground/presentation/whiteListBroker/widgets/city_buttons/city_buttons.dart';
import 'package:on_ground/presentation/whiteListBroker/widgets/google_place/google_place_widget.dart';
import 'package:on_ground/widgets/custom_text_field.dart';
class WhiteListBrokerScreen extends StatefulWidget {
  const WhiteListBrokerScreen({Key? key}):super(key: key);
  @override
  State<StatefulWidget> createState() => _WhiteListBrokerScreenState();
}
class _WhiteListBrokerScreenState extends State<WhiteListBrokerScreen> {
  final bloc = getIt<WhiteListBrokerCubit>();
  @override
  void initState() {
    super.initState();
    bloc.getListData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 20
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Whitelist broker',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                          CustomTextField(
                            controller: bloc.numberController,
                            title: 'Mobile Number',
                            padding: const EdgeInsets.only(top: 10,bottom: 10),
                            hintText: 'eg. 9876543210',
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10,), //n is maximum number of characters you want in textfield
                            ],
                          ),
                           CustomTextField(
                            controller: bloc.nameController,
                            title: 'Name',
                            padding: const EdgeInsets.only(top: 10,bottom: 10),
                            hintText: 'Broker Name',
                          ),
                           CustomTextField(
                             controller: bloc.orgNameController,
                            title: 'Organisation',
                            padding:const EdgeInsets.only(top: 10,bottom: 10),
                            hintText: 'Organisation Name',
                          ),
                          const Text(
                            'Organisation Address',
                            style: TextStyle(
                              fontSize: 15
                            ),
                          ),
                          GooglePlaceWidget(
                            hintText: 'Organisation address',
                            onGetPlace: (placeData){
                              bloc.place = placeData;
                            },
                          ),
                          BlocConsumer<WhiteListBrokerCubit,WhiteListBrokerCubiteState>
                          (
                          builder: (context,state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                
                              if (state is GetListDataState) 
                                  state.employeeList != null ?
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Search employee to assign',
                                          style:  TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15
                                            ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5
                                          ),
                                          child:
                                          
                                          DropdownSearch<EmployeeModel> (
                                          showSearchBox: true,
                                          mode: Mode.DIALOG,
                                          showSelectedItems: false,
                                          items: state.employeeList,
                                          dropdownSearchDecoration: const InputDecoration(
                                            hintText: 'Select employee'
                                          ),
                                          itemAsString: (item)=>item?.name ?? '',
                                          onChanged: (data){
                                            bloc.employeeModel = data;
                                          },
                                        ),
                                        )
                                      ],
                                    ),
                                  ): Container(),
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Search City',
                                          style:  TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15
                                            ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5
                                          ),
                                          child:
                                          
                                          DropdownSearch<CityModel> (
                                          showSearchBox: true,
                                          mode: Mode.DIALOG,
                                          showSelectedItems: false,
                                          items: bloc.cities,
                                          dropdownSearchDecoration: const InputDecoration(
                                            hintText: 'Select City'
                                          ),
                                          selectedItem: bloc.cities[0],
                                          itemAsString: (item)=>item?.name ?? '',
                                          onChanged: (data){
                                            if(data?.id != null) {
                                              bloc.getLOcationData(data!.id!);
                                            }
                                          },
                                        ),
                                        )
                                      ],
                                    )
                              ),
                              if (state is GetListDataState) 
                                state.polygonList != null ?
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 20
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Select Locality',
                                          style:  TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15
                                            ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 5
                                          ),
                                          child: 
                                          
                                        DropdownSearch<PolygoneModel> (
                                          showSearchBox: true,
                                          mode: Mode.DIALOG,
                                          showSelectedItems: false,
                                          items: state.polygonList,
                                          dropdownSearchDecoration: const InputDecoration(
                                            hintText: 'Select your location'
                                          ),
                                          itemAsString: (item)=>item?.name ?? '',
                                          onChanged: (data){
                                            bloc.polygoneModel = data;
                                          },
                                        ),

                                        )
                                      ],
                                    ),
                                  ): Container()
                              ],
                            );
                          },
                          listener: (context,state) {
          
                          }
                          )
                          
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30
                    ),
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black
                        ),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20
                            ),
                            child: Text(
                            'Whitelist broker',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          ),
                        ),
                      ),
                      onTap: (){
                        bloc.whitelistBoker();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  
}