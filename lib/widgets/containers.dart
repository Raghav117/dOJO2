import 'package:dojo/models/global.dart';
import 'package:dojo/pages/batch_edit.dart';
import 'package:dojo/pages/edit_other.dart';
import 'package:dojo/pages/membership_edit.dart';
import 'package:flutter/material.dart';

Widget batches(context) {
  return Container(
      height: 400.0,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Batch Timing and',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            subtitle: Text(
              'Schedule',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20),
            ),
            trailing: Container(
              width: 60,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.red,
                  )),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return BatchEdit();
                  },
                )),
                child: Center(
                    child: Text(
                  'Edit',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                      'Batch 1',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 120.0),
                    Text(
                      'Timing',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      m[dojos[currentlyindex]]["property_batch1"],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: Text(
                          m[dojos[currentlyindex]]["property_batch1_timing"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  children: <Widget>[
                    Text(
                      'Batch 2',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 120.0),
                    Text(
                      'Timing',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Text(
                      'Monday',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 120.0),
                    Text(
                      '7.00 PM-8.00PM',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  'and Tuesday',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.0),
                Row(
                  children: <Widget>[
                    Text(
                      'Batch 3',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 120.0),
                    Text(
                      'Timing',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Text(
                      'NA',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 150.0),
                    Text(
                      'NA',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 15.0),
                Row(
                  children: <Widget>[
                    Text(
                      'Batch 4',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 120.0),
                    Text(
                      'Timing',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Text(
                      'NA',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 150.0),
                    Text(
                      'NA',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ));
}

Widget membership(context) {
  return Container(
    height: 300.0,
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'Registration Fees',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.grey),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "₹" +
                      m[dojos[currentlyindex]]["property_registration_fee"]
                          .toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
                Text(
                  'Include Karate Dress,etc',
                  style: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ],
            ),
          ),
          trailing: Container(
            width: 60,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: Colors.red,
                )),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return MembershipEdit();
                  },
                ));
              },
              child: Center(
                  child: Text(
                'Edit',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Monthly Fees',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 80.0),
                  Text(
                    '3 Months Fees',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.0),
              Row(
                children: <Widget>[
                  Text(
                    ' ₹' +
                        m[dojos[currentlyindex]]["property_monthly_membership"],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(width: 110.0),
                  Text(
                      '₹${m[dojos[currentlyindex]]["property_3_months_membership"]}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22))
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Text(
                    '6 Months Fees',
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(width: 80.0),
                  Text(
                    'Yearly Fees',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  Text(
                    '₹${m[dojos[currentlyindex]]["property_6_months_membership"]}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(width: 100.0),
                  Text(
                    '₹${m[dojos[currentlyindex]]["property_yearly_membership"]}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

// Widget instructor = Container(
//   color: Colors.white,
//   height: 230.0,
//   child: Center(
//     child: Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(top: 15.0),
//           child: CircleAvatar(
//             maxRadius: 50,
//             backgroundImage: NetworkImage(
//               'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500',
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 15.0,
//         ),
//         Text(
//           m[dojos[currentlyindex]]["property_instructor_name"],
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
//         ),
//         SizedBox(height: 7.0),
//         Text(
//           m[dojos[currentlyindex]]["property_instructor_details"],
//           textAlign: TextAlign.center,
//         ),
//       ],
//     ),
//   ),
// );

Widget other(context) {
  return Container(
    // height: 220.0,
    width: MediaQuery.of(context).size.width,
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Location',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            m[dojos[currentlyindex]]["prooerty_searchadd"],
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10.0),
          Text(
            'Contact',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19.0,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(m[dojos[currentlyindex]]["property_instructor_contact"]),
              Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(300.0),
                ),
                child: InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return OtherEdit();
                    },
                  )),
                  child: Center(
                      child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
