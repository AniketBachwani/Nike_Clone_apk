// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';

import 'package:currency_convertor/Shoe.dart';

class Shoetile extends StatelessWidget {
  Shoe shoe;
  void Function()? ontap;
  Shoetile({
    super.key,
    required this.ontap,
    required this.shoe,
  });

  @override 
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      width: 280,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //shoe image
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      shoe.imagepath,
                      height: 250,
                    )),
              ),
            ),
            //description
            Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  shoe.description,
                  style: TextStyle(color: Colors.grey[600]),
                  maxLines: 2, // Set the maximum number of lines
                  overflow:
                      TextOverflow.ellipsis, // Add ellipsis for overflowed text
                ),
              ),
            ),
            //price+details
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 0, bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        shoe.price,
                        style: const TextStyle(color: Colors.green),
                      )
                    ],
                  ),

                  //button to add to cart
                  GestureDetector(
                    onTap: ontap,
                    child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12))),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
