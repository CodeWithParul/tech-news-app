// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsio/backend/functions.dart';
import 'package:newsio/components/newsbox.dart';
import 'package:newsio/utils/colors.dart';
import 'package:newsio/pages/home.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  static TextEditingController searchController =
      TextEditingController(text: '');

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: AppColors.darkgrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    onTap: () {
                      if (NewsBox.open == true) {
                        Navigator.pop(context);
                        setState(() {
                          NewsBox.open = false;
                        });
                      }
                    },
                    controller: SearchBar.searchController,
                    decoration: InputDecoration(
                      hintText: 'Search a Keyword or a Phrase',
                      hintStyle: GoogleFonts.lato(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            if (NewsBox.open == true) {
              Navigator.pop(context);
              setState(() {
                NewsBox.open = false;
              });
            }
            FocusScope.of(context).unfocus();
            fetchnews();
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: AppColors.darkgrey, shape: BoxShape.circle),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
