import 'package:elt_machine_task/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorShimmer extends StatelessWidget {
  const AuthorShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.grey[300],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                         Expanded(
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              authorbox(15),
                              SizedBox(height: 8,),
                              authorbox(10),
                              SizedBox(height: 10,),
                              authorbox(10)
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                itemCount: 15);
  }
}

Widget authorbox(double height){
  return Container(width: 250,
  height: 10,
  color: Colors.grey[300],);
}