import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/presentation/details/details_cubit.dart';
import 'package:on_ground/presentation/details/details_cubit_state.dart';
import 'package:on_ground/utils/common.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({this.brokerId,Key? key}):super(key: key);
  final String? brokerId;
  @override
  State<StatefulWidget> createState() => _DetailsScreenState();

}

class _DetailsScreenState extends State<DetailsScreen> {

  final bloc = getIt<DetailsCubit>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
        bloc.getBrokerDatailsData(widget.brokerId ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
     return BlocProvider(
       create: (context) => bloc,
       child: SafeArea(
         child: Scaffold(
           appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.black, //change your color here
               ),
             elevation: 0,
             backgroundColor: Colors.transparent,
           ),
           body: BlocBuilder<DetailsCubit,DetailsCubitState>(builder: (context,state)=> Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               
               Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white
                    ),
                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom:10),
                          child: Row(
                            children: [
                              const SizedBox(
                                height: 70,
                                width: 60,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:  [
                                  Text(
                                    bloc.brokersData?.name ?? '',
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Text(
                                    bloc.brokersData?.orgName ?? '',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                      top: 4,
                                      bottom: 4
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 222, 217, 217),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: const Text(
                                      'No post in last 0 days',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 228, 224, 224),
                                      borderRadius: BorderRadius.circular(8)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 8
       
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  const [
                                          Icon(Icons.chat_bubble),
                                          SizedBox(width: 5,),
                                          Text(
                                            "CHAT",
                                             style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold
                                          ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                     if(bloc.brokersData?.phoneNumber != null) {
                                        Common.openwhatsapp(bloc.brokersData!.phoneNumber!, context);
                                      } 
                                  },
                                ),
                              ),
                              const SizedBox(width: 20,),
                               Expanded(
                                 child: InkWell(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 8
                                      ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.call,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          "CALL",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  if(bloc.brokersData?.phoneNumber != null) {
                                        launch("tel://${bloc.brokersData!.phoneNumber!}");
                                    }
                                  
                                },
                              ),
                              
                               )
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                            'History',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic
                            ),
                        ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                            'No History Available',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              
                            ),
                        ),
                )
             ],
           ),
         )
             ),
       ),
    );
  }
  
}