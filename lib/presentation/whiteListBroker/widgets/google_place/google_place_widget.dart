import 'package:flutter/material.dart';
import 'package:google_place/google_place.dart';

class GooglePlaceWidget extends StatefulWidget {
  const GooglePlaceWidget({this.hintText,this.onGetPlace,Key? key}) : super(key: key);
  final String? hintText;
  final void Function(AutocompletePrediction?)?  onGetPlace;
  @override
  State<StatefulWidget> createState() => _GooglePlaceWidgetState();
  
}

class _GooglePlaceWidgetState extends State<GooglePlaceWidget> {
  String? selectedText = '';
  List<AutocompletePrediction>? predictions;
  final googlePlace = GooglePlace('AIzaSyBc5Ag5toJfGVsDsqdsTrvIgsaae4RqGQw');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                    markAsLostBroker(context);
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width-30,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1
                      )
                    )
                  ),
                  child:  (selectedText != null && selectedText!.isNotEmpty) ?  Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 15,left: 0),
                    child: Text(
                      selectedText ?? ""
                    ),
                  ): Padding(
                    padding: const EdgeInsets.only(top: 15,bottom: 15,left: 5),
                    child: Text(
                              widget.hintText ?? '',
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey
                              ),
                            ),
                  )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void markAsLostBroker(BuildContext context) {
    
        showModalBottomSheet(
      context: context,
      builder: (modelContex) {
       
        return StatefulBuilder(
          builder: (cont,modelState) {
            
             onFindPlace(String? searchText) async{
                
                AutocompleteResponse? result = await googlePlace.autocomplete.get(searchText ??'');

                if(result?.predictions !=null) {
                      predictions = result?.predictions;
                      modelState(() {
                        
                      });
                      setState(() {
                        
                      });
                }
              }

            return  Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search Places'
                    ),
                    onChanged: (text) {
                      if(text.isNotEmpty) {
                        onFindPlace(text);
                      }
                      
                    },
                  ),
                  SizedBox(
                    
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: predictions?.length ?? 0,
                      itemBuilder: (buildCont,index) {
                        return InkWell(
                          onTap: (){
                            widget.onGetPlace?.call(predictions?[index]);
                            setState(() {
                              selectedText = predictions?[index].description ?? '';
                            });
                            Navigator.of(context).pop();    
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              predictions?[index].description ?? '',
                              style: const TextStyle(
                                fontSize: 15
                              ),
                            ),
                          )
                        );
                      }
                    ),
                  )
                ],
              ),
            );
          },
        );
      }
    );
  }

}
