import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 500,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc['color_id']].withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(children: [
        Text(
          doc['note_title'],
          // style: AppStyle.mainTitle,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 254, 207, 244)),
        ),
        SizedBox(
          height: 6.0,
        ),
        Center(
          child: Text(
            doc["creation_dates"],
            // style: AppStyle.dateTitle,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 10,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          doc["note_content"],
          // style: AppStyle.mainContent,
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 30.0,
        ),
        GestureDetector(
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          onTap: () async {
            await FirebaseFirestore.instance
                .collection("Notes")
                .doc(doc.id)
                .delete();
          },
        ),
      ]),
    ),
  );
}
