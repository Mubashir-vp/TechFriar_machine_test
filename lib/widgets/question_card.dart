import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:machinetest_techfriar/core/models/questionmodel.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({super.key, required this.datum});
  final Datum datum;
  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 335,
      color: HexColor(
        '#F7F7F8',
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 14.0,
              left: 8,
              right: 8,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  color: HexColor(
                    '#E0F2EF',
                  ),
                  child: Center(
                    child: Text(
                      'Q.',
                      style: GoogleFonts.outfit(
                          color: HexColor(
                        '#32A693',
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 11.0,
                  ),
                  child: SizedBox(
                    width: 260,
                    height: 80,
                    child: Text(
                      '${widget.datum.description}',
                      style: GoogleFonts.outfit(),
                      maxLines: 4,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Volume:',
                      style: GoogleFonts.outfit(fontSize: 12),
                    ),
                    Text(
                      "${widget.datum.poolSize}",
                      style: GoogleFonts.outfit(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ends in:',
                      style: GoogleFonts.outfit(fontSize: 12),
                    ),
                    Text(
                      "${widget.datum.publishOn}",
                      style: GoogleFonts.outfit(fontSize: 12),
                    ),
                  ],
                ),
                Container(
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: HexColor(
                    '#32A693',
                  ))),
                  child: Center(
                    child: Text(
                      'Predict',
                      style: GoogleFonts.outfit(
                        color: HexColor(
                          '#32A693',
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
