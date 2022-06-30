import 'package:flutter/material.dart';
import 'package:on_ground/model/dashborad/organisation_data.dart';
import 'package:on_ground/utils/uicolors.dart';

class AllBokerWidget extends StatelessWidget {
  const AllBokerWidget({this.organisationList,Key? key}) : super(key: key);
  final List<OrganisationData>? organisationList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: organisationList?.length ?? 0,
            itemBuilder: (context,index) {
              return Container(
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
                          organisationList?[index].brokersData?[0].name ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          organisationList?[index].brokersData?[0].phoneNumber ?? '',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  )
                );
            }
          ),
        )
      ],
    );
  }
  
}