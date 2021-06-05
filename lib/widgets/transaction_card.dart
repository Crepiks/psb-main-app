import "package:flutter/material.dart";

class TransactionCard extends StatelessWidget {
  late final String name;
  late final String date;
  late final String value;

  TransactionCard(
      {Key? key, required this.name, required this.date, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: double.infinity,
                  child: Icon(Icons.credit_card),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          date,
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ))
              ],
            ),
            Column(
              children: [
                Text(
                  value,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.green),
                ),
              ],
            )
          ],
        ));
  }
}
