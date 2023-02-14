import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:open_house/const/colors.dart';
import 'package:open_house/controller/organization.dart';
import 'package:open_house/model/organization_detail.dart';
import 'package:open_house/model/past_model.dart';
import 'package:open_house/past_event_cubit/cubit/pastevent_cubit.dart';
import 'package:open_house/past_event_cubit/cubit/pastevent_state.dart';

import '../controller/favouritscubit.dart';

class Events extends StatefulWidget {
  // PastEvent pastevent;
  Events({
    super.key, //required this.pastevent
  });

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<PastEventCubit>();
      cubit.fetchPastEvent();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = context.read<FavoriteCubit>();
    // context.read<OrganizationCubit>().fetchPosts();
    return Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.98,
        // height: 500,
        color: Colors.black,
        child: BlocBuilder<PastEventCubit, PastEventState>(
            builder: (context, state) {
          if (state is InitPastEventState || state is LoadingPastEventState) {
            return CircularProgressIndicator();
          } else if (state is ResponsePastEventState) {
            final pasteventlist = state.pastevent;
            return GridView.builder(
                itemCount: pasteventlist.length, //state.length, //userList
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 2.0),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: eventcolor),
                    // color: Colors.pink,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(children: [
                          Container(
                            height: 90,
                            width: 190,
                            child: Image.network(
                              pasteventlist[index].image.toString(),
                              fit: BoxFit.cover,
                              // fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 5,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: eventcolor,
                              child: InkWell(
                                onTap: () {
                                  //   userList[index].isInterested.toString();
                                  // favoriteCubit.toggle();
                                },
                                child: Icon(
                                  // userList[index].isInterested,
                                  Icons.favorite_border,
                                  size: 15,
                                ),
                              ),
                            ),
                          )
                        ]),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            pasteventlist[index].name.toString(),
                            softWrap: false,
                            maxLines: 2,
                            style: TextStyle(
                                color: text1,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Roboto"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            pasteventlist[index].venue.toString(),
                            softWrap: false,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: text1,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Roboto"),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else if (state is ErrorTPastEventState) {
            return Text(
              state.message,
              style: TextStyle(color: Colors.white),
            );
          }
          return Text(state.toString());
        })

        // }
        );
    //   }
    //  ));
  }
}
