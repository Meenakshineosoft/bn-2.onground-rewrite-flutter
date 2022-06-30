import 'package:flutter/material.dart';
import 'package:on_ground/di/di_module.dart';
import 'package:on_ground/presentation/whiteListBroker/widgets/city_buttons/city_button_cubit.dart';

class CityButton extends StatelessWidget {
  CityButton({this.id,this.onTapButton ,Key? key}):super(key: key);
  final Function(int id)? onTapButton;
  final int? id;
  final bloc = getIt<CityButtonCubit>();
  @override
  Widget build(BuildContext context) {
    bloc.changeState(id ?? 1);
    return  Container(
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(25)
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: (){
                  bloc.changeState(1);
                  onTapButton?.call(1);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color:(id != null ? (id==1) ? Colors.black :Colors.white : Colors.black)
                  ),
                  child: Center(
                    child: Text(
                      'Mumbai',
                      style: TextStyle(
                        color:(id != null ? (id==1) ? Colors.white :Colors.black : Colors.white)
                      ),
                    )
                  ),
                ),
              ),
            ),
            
            Expanded(
              child: InkWell(
                onTap: (){
                  bloc.changeState(37);
                  onTapButton?.call(37);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color:  (id != null ? (id==37) ? Colors.black :Colors.white : Colors.white) 
                  ),
                  child: Center(
                    child:  Text(
                      'Pune',
                      style: TextStyle(
                        color:  (id != null ? (id==37) ? Colors.white :Colors.black : Colors.black)
                      ),
                    )
                  ),
                ),
              ),
            ),
            
            Expanded(
              child: InkWell(
                onTap: (){
                  bloc.changeState(2);
                  onTapButton?.call(2);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color:  id != null ? (id==2) ? Colors.black :Colors.white : Colors.white),
                    child:  Center(
                    child: Text(
                      'Bangalore',
                      style: TextStyle(
                        color: (id != null ? (id==2) ? Colors.white :Colors.black : Colors.black) 
                      ),
                    ),
                  ),
                ),
              ),
            ),
                  
                  
          ],
        ),
      );
      }

}