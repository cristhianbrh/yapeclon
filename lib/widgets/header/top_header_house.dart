import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yapeclon/data/models/user_model.dart';

class TopHeaderHouse extends StatelessWidget {
  final UserModel user;

  const TopHeaderHouse({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 5, 12, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.menu_rounded, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hola, " +
                          user.fullName.substring(
                            0,
                            min(9, user.fullName.length),
                          ) +
                          "...",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: () => {},
                      child: Text(
                        "Gratis",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(10, 10),
                        backgroundColor: Colors.amber,
                        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.headset_mic_outlined,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              IconButton(
                onPressed: () => {},
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
