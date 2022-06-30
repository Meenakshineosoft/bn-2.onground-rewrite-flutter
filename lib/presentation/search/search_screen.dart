import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/presentation/search/search_cubit.dart';
import 'package:on_ground/presentation/search/search_cubit_state.dart';
import 'package:on_ground/utils/routes.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final bloc = getIt<SearchCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=> bloc,
      child: Scaffold(
        body: SafeArea(
          
          child: BlocBuilder<SearchCubit,SearchCubitState>(
            builder :(context, state) =>  Column(
            
            children: [
              const SizedBox(height: 20,),
              Row(
                children: [
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                      child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 4),
                          borderRadius: BorderRadius.circular(5)
                        )
                      ),
                      onChanged: (text){
                        if(text.length > 3) {
                          bloc.searchData(text);
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 10,),
                ],
              ),
              ( bloc.searchModel?.suggestions != null && bloc.searchModel!.suggestions!.isEmpty && bloc.isSeach) ?
                const Expanded(
                  child: Center(
                    child: Text('No record found'),
                  ),
                )
               :
              Expanded(
                child: ListView.builder(
              itemCount: bloc.searchModel?.suggestions?.length ?? 0,
              itemBuilder: (context,index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed(Routes.detailsScreen,arguments: bloc.searchModel?.suggestions?[index].id ).toString();
                  },
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              bloc.searchModel?.suggestions?[index].name ?? '',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Text(
                              bloc.searchModel?.suggestions?[index].phoneNumber ?? '',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey
                              ),
                            )
                          ],
                        ),
                      )
                    ),
                );
              }
            ),
              )
            ],
          ),
        ),
      ),
    )
    );
  }
  
}