import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/model/dashborad/organisation_data.dart';
import 'package:on_ground/presentation/home/all_broker_widget.dart';
import 'package:on_ground/presentation/home/home_cubit.dart';
import 'package:on_ground/presentation/home/home_cubit_state.dart';
import 'package:on_ground/presentation/home/inactive_widget.dart';
import 'package:on_ground/utils/common.dart';
import 'package:on_ground/utils/routes.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}):super(key: key);
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
   HomeScreenState() : super();

 final bloc = getIt<HomeCubit>();

  @override
  void initState() {
    super.initState();
    bloc.getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> bloc,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(0, 110, 107, 107),
        body: SafeArea(
          child: BlocBuilder<HomeCubit,HomeCubitState>(builder: ((context, state) {
            return Column(
            children: [
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:  [
                         Text(
                          'Your Brokers ${((state is OrgListData) ? state.organisationList?.length ?? 0 : 0) > 0 ? '(${((state is OrgListData) ? state.organisationList?.length ?? 0 : 0)})' : ''}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 2,),
                       
                        Text(
                          '${bloc.inactiveBroker} Inactive Broker'
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      child: const Icon(
                        Icons.search_rounded,
                        size: 30,
                        color: Colors.grey,
                      ),
                      onTap: (){
                        Navigator.of(context).pushNamed(Routes.searchScreen);
                      },
                    )
                  ],
                ),
              ),
               Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children:  [
                      const TabBar(
                        indicatorColor: Colors.black,
                        labelColor:Colors.black,
                        indicatorPadding: EdgeInsets.only(left: 40,right: 40),
                        tabs: [
                          Tab(
                            text: 'Inactive',
                          ),
                          Tab(
                            text: 'All broker',

                          )
                        ],
                      ),
                      Expanded(
                        child:TabBarView(
                        children: [
                          InactiveScreen(
                            organisationList: (state is OrgListData) ? state.organisationList : [],
                            onTapChat: (data){
                              if(data?.brokersData?[0].phoneNumber != null) {
                                Common.openwhatsapp(data!.brokersData![0].phoneNumber!, context);
                              } 
                            },
                            onTapCall: (data){

                              if(data?.brokersData?[0].phoneNumber != null) {
                                launch("tel://${data!.brokersData![0].phoneNumber!}");
                              } 
                              
                            },
                            onTapMore: (data) {
                              showModalBottomSheet(
                                context: context,
                                builder: (modelContex) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      top: 30,
                                      bottom: 30
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children:  [
                                        InkWell(
                                          child: const Text(
                                            'Mark as lost',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          onTap: (){
                                            Navigator.of(context).pop();
                                            markAsLostBroker(context,data);
                                          },
                                        ),
                                        const SizedBox(height: 30,),
                                        InkWell(
                                          child: const Text(
                                            'Add note',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          onTap: (){
                                            Navigator.of(context).pop();
                                            addNoteBroker(context,data);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                }
                              );
                            },
                          ),
                          AllBokerWidget(
                            organisationList: (state is OrgListData) ? state.organisationList : [],
                          )
                        ]
                      )
                      )
                    ],
                  ),
                  initialIndex: 0,

                )
              )
            ],
          );
          } )),
        ),
      ),
    );
  }
  

  void markAsLostBroker(BuildContext context,OrganisationData? data) {
    bloc.markReson = null;
        showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modelContex) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'State Reason',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5)
                ),
                
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(modelContex).viewInsets.bottom),
                    child: TextField(
                      maxLines: 8,
                      maxLength: 250,
                      decoration: const InputDecoration.collapsed(hintText: "Start typing here.."),
                      onChanged: (text){
                        bloc.markReson = text;
                      },
                    ),
                  ),
                ),
              
              const SizedBox(height: 20,),
               Row(
                  children:[ InkWell(
                    onTap: () {
                      if(bloc.markReson == null) {
                        Common.showToast('Enter reason');
                        return;
                      }
                      if(bloc.markReson!.isEmpty) {
                        Common.showToast('Enter reason');
                        return;
                      }
                      bloc.markLostBroker(data);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black
                      ),
                      child: const Center(
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  ]
                ),
              
            ],
          );
      }
    );
  }

  void addNoteBroker(BuildContext context,OrganisationData? data) {
    bloc.noteData = null;
    bloc.radioValue = -1;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (modelContex) {
        return  StatefulBuilder(

            builder: (cont,mSetState) =>Padding(
          padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8,),
                const Text(
                  'Add Note',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding:const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                  padding: const EdgeInsets.all(
                      10.0 ),
                  child:
                    TextFormField(
                      
                      maxLines: 8,
                      decoration: const InputDecoration.collapsed(hintText: "Enter your text here"),
                      onChanged: (text){
                          bloc.noteData = text;
                      },
                    )),
                  ),
                ),
                const SizedBox(height: 15,),
                const Text(
                  'Select Note Type',
                  style: TextStyle(
                    
                    fontSize: 15,
                    fontWeight: FontWeight.normal
                  ),
                ),
                ListTile(
                  title: const Text("Issue"),
                  leading: Radio<int>(
                    value: 1,
                    groupValue: bloc.radioValue,
                    onChanged: (value) {
                      mSetState(() {
                        bloc.radioValue = value ?? 1;
                      });
                    },
                    activeColor: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text("Text"),
                  leading: Radio<int>(
                    value: 2,
                    groupValue: bloc.radioValue,
                    onChanged: (value) {
                      mSetState(() {
                        bloc.radioValue = value ?? 2;
                      });
                    },
                    activeColor: Colors.black,
                  ),
                ),
                ListTile(
                  title: const Text("Disable"),
                  leading: Radio<int>(
                    value: 3,
                    groupValue: bloc.radioValue,
                    onChanged: (value) {
                      mSetState(() {
                        bloc.radioValue = value ?? 3;
                      });
                    },
                    activeColor: Colors.black,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[ InkWell(
                    onTap: () {
                      if (bloc.noteData ==null) {
                      
                        Common.showToast('please enter note');
                        return;
                      }
                      if(bloc.noteData!.isEmpty) {
                        Common.showToast('please enter note');
                        return;
                      }
                      if (bloc.radioValue==-1) {
                        Common.showToast('please select type');
                        return;
                      }
                      
                      bloc.addBrokerNote(data);
                      Navigator.of(context).pop();
                    }, 
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.black
                      ),
                      child: const Center(
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ),
                  ]
                )
              ],
            ),
          ),
        );
      }
    );
  }

}