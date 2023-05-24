import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:machinetest_techfriar/core/models/questionmodel.dart';
import 'package:machinetest_techfriar/view/home_screen/home_bloc/bloc/home_bloc.dart';
import 'package:machinetest_techfriar/widgets/question_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    super.initState();
    homeBloc.add(const LoadData());
  }

  final _controller = ScrollController();
  int currentIndex = 0;

  List<Widget> items = [
    Image.asset('assets/images/Rectangle 5198.png'),
    Image.asset('assets/images/Rectangle 5198.png'),
    Image.asset('assets/images/Rectangle 5198.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              20.0,
            ),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Image.asset(
                  'assets/images/search-normal.png',
                ),
                hintText: 'Search',
                hintStyle: GoogleFonts.outfit(),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 10 / 3,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            items: items,
          ),
          const SizedBox(
            height: 20,
          ),
          DotsIndicator(
            decorator: DotsDecorator(
              activeColor: HexColor(
                '#32A693',
              ),
            ),
            dotsCount: items.length,
            position: currentIndex,
          ),
          Padding(
            padding: const EdgeInsets.all(
              15.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending Questions',
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View all',
                  style: GoogleFonts.outfit(),
                ),
              ],
            ),
          ),
          BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              _controller.addListener(() {
                log('Loading more');
                if (_controller.position.atEdge) {
                  bool isTop = _controller.position.pixels == 0;
                  if (state is DataLoaded) {
                    if (isTop) {
                    } else {
                      if (state.questionModel.pagination!.nextUrl != null) {
                        homeBloc.add(
                          LoadMoreData(
                            url: state.questionModel.pagination!.nextUrl!,
                          ),
                        );
                      } else {
                        null;
                      }
                    }
                  }
                }
              });
            },
            bloc: homeBloc,
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is DataLoaded) {
                return SingleChildScrollView(
                  child: SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                      controller: _controller,
                      itemBuilder: (context, index) {
                        return Column(
                          children: listWidget(
                            data: state.questionModel.data!,
                          ),
                        );
                      },
                      separatorBuilder: ((context, index) {
                        return const SizedBox();
                      }),
                      itemCount: state.questionModel.data!.length,
                    ),
                  ),
                );
              } else {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }
            },
          )
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/textalign-right.png',
            ),
          )
        ],
        title: Text(
          'Trending',
          style: GoogleFonts.outfit(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 14.0,
            ),
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ),
      ),
    );
  }

  listWidget({required List<Datum> data}) {
    return data.map((e) {
      return QuestionCard(datum: e);
    }).toList();
  }
}

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  final String title;
  const EmptyWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
