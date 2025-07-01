import 'package:flutter/material.dart';
import 'package:yapeclon/data/models/transaction_model.dart';
import 'package:yapeclon/data/models/useinscreen/datadetails_model.dart';
import 'package:yapeclon/utils/format_date_util.dart';

class MovementWidget extends StatelessWidget {
  final TransactionModel tx;
  const MovementWidget(this.tx, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => {
            Navigator.pushNamed(
              context,
              "/view-yapear",
              arguments: {
                "dataDetails": DatadetailsModel(
                  nameUser: tx.destinationPhone,
                  phone: tx.destinationPhone,
                  codeSecurity: tx.destinationPhone,
                  operation: tx.destinationPhone,
                  ammount: tx.amount,
                  date: tx.date,
                ),
                "ammountPreviousRoute": 1,
              },
            ),
          },
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(vertical: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.description.length > 21
                      ? tx.description.substring(0, 21) + "..."
                      : tx.description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  formatDateUtil(tx.date),
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Expanded(child: Container()),
            Text(
              "${tx.amount < 0 ? "-" : ""} S/ ${tx.amount.toStringAsFixed(2)}",
              style: TextStyle(
                color: tx.amount > 0 ? Colors.black : Colors.redAccent,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
