import 'package:flutter/material.dart';
import 'package:on_ground/model/dashborad/organisation_data.dart';

class InactiveScreen extends StatelessWidget {
  const InactiveScreen({
    this.organisationList,
    this.onTapMore,
    this.onTapCall,
    this.onTapChat,
    Key? key}) : super(key: key);
  final List<OrganisationData>? organisationList;
  final Function(OrganisationData? data)? onTapMore;
  final Function(OrganisationData? data)? onTapChat;
  final Function(OrganisationData? data)? onTapCall;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: organisationList?.length ?? 0,
            itemBuilder: (context,item) {
              return Padding(
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
                                  organisationList?[item].brokersData?[0].name ?? '',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                const SizedBox(height: 5,),
                                Text(
                                  organisationList?[item].orgName ?? '',
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
                            InkWell(
                              child: const Padding(
                                padding:  EdgeInsets.only(right: 25),
                                child: Icon(
                                Icons.more_vert,
                            ),
                              ),
                              onTap:  () {
                                onTapMore?.call(organisationList?[item]);
                              },
                            )
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
                                  onTapChat?.call(organisationList?[item]);
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
                                onTapCall?.call(organisationList?[item]);
                              },
                            ),
                            
                             )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          )
        )
      ],
    );
  }
  
}