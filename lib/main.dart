import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new ListDisplay(),
    );
  }
}

class ListDisplay extends StatefulWidget {
  _ListDisplayState createState() => _ListDisplayState();
}

class Tx {
  String type;
  double amount;
  DateTime dateTime;

  Tx(this.type, this.amount, this.dateTime);
}

class TxList {
  DateTime dateTime;
  Tx tx;

  TxList(this.dateTime, this.tx);
}

class _ListDisplayState extends State<ListDisplay> {

  List<String> listItems = ["first", "second", "the quick brown fox", "jumps over", "the lazy dog!"];

  final List<Tx> txns = new List<Tx>();
  final List<TxList> txnLists = new List<TxList>();
 
  var dateTimeFormatter = new DateFormat('yyyy-MM-dd H:m:s');
  var dateFormatter = new DateFormat('yyyy-MM-dd');
  //print(new DateFormat.yMMMMEEEEd().format(new DateTime.now()));

  @override
  void initState() {
    super.initState();
    setState(() {
      txns.add(new Tx("Transfer to A", 20.0, DateTime.now()));
      txns.add(new Tx("Transfer to B", -10.0, DateTime.now()));
      txns.add(new Tx("Transfer to C", 200.0, DateTime.now()));
      txns.add(new Tx("Transfer to D", -50.0, DateTime.now()));
      txns.add(new Tx("Transfer to E", -24.0, DateTime.now()));
      txns.add(new Tx("Transfer to F", 190.0, DateTime.now()));

      //new list
      txnLists.add(new TxList(DateTime.now(), new Tx("Transfer to A", 20.0, DateTime.now())));
      txnLists.add(new TxList(DateTime.now(), new Tx("Transfer to B", -10.0, DateTime.now())));
      txnLists.add(new TxList(DateTime.now(), new Tx("Transfer to C", 200.0, DateTime.now())));
      txnLists.add(new TxList(DateTime.now(), new Tx("Transfer to D", -50.0, DateTime.now())));
      txnLists.add(new TxList(DateTime.now(), new Tx("Transfer to E", -24.0, DateTime.now())));
      txnLists.add(new TxList(DateTime.now(), new Tx("Transfer to F", 190.0, DateTime.now())));
    });
  }

  final TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {

    Widget buildBody(BuildContext context, int index) {
      return Card(
          child: Text(listItems[index]),
        );
    }

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ]
          )
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
            ),
          Text('41'),
      ],)
    );

    Column buildButtonColumn(IconData icon, String label) {

      Color color = Theme.of(context).primaryColor;

      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                color: color,
              ),
              ),
          ),
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE')
        ],
      ),
    );

    Widget textSection = Container(
      padding: EdgeInsets.all(32.0),
      child: Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    
    Widget gridView = new Expanded(
        child: GridView.builder(
          itemBuilder: (context, position) {
            return Card(
              child: Text(listItems[position]),
            );
          },
          itemCount: listItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),    
        )
      );

    Widget card = Center(
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
                padding:
                  const EdgeInsets.fromLTRB(12.0, 24.0, 50.0, 12.0),
                child: const ListTile(
              leading: Icon(
                Icons.account_balance_wallet, 
                color: Colors.redAccent, 
                size: 50.0,),
              title: Text(
                  '€ 54.08',
                  style: TextStyle(
                    fontSize: 40.0, fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              subtitle: Text(
                'EUR · Euro',
                style: TextStyle(
                  fontSize: 20.0, 
                  fontWeight: FontWeight.bold                  
                ),
                textAlign: TextAlign.center,
              ),
            ),
        ),
          ],
        ),
      ),
    );

    Widget emailView = ListView.builder(
      itemCount: listItems.length,
      itemBuilder: (context, position) {
        
        Tx txn = txns[position];
        TxList txnList = txnLists[position];

        return Column(
          children: <Widget>[

            // ListTile(
            //     title: Text(
            //       dateFormatter.format(txnList.dateTime),
            //       style: Theme.of(context).textTheme.headline,
            //     ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      // Text(
                      //   "5m",
                      //   style: TextStyle(color: Colors.grey),
                      // ),
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.credit_card,
                          size: 35.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                      child: Text(
                        txn.type,
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                      child: Text(
                        dateTimeFormatter.format(txn.dateTime),
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        txn.amount.toString(),
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              height: 2.0,
              color: Colors.grey,
            )
          ],
        );
      },
    );

    return Scaffold(
       appBar: new AppBar(
         title: new Text('ListView with TextBox'),
       ),
       body: new Column(
         children: <Widget>[
          card,
          Padding(
            padding:const EdgeInsets.fromLTRB(12.0, 24.0, 12.0, 12.0),
            child: Text(
              'Recent transactions',
              style: TextStyle(
                fontSize: 24.0, fontWeight: FontWeight.normal
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //titleSection,
          //buttonSection,
          // new TextField(
          //   controller: textEditingController,
          //   onSubmitted: (text) {
          //     listItems.add(text);
          //     textEditingController.clear();
          //     setState(() {});
          //   },
          // ),
          //textSection,
          // new Expanded(
          //     child: new ListView.builder(
          //       itemCount: listItems.length,
          //       itemBuilder: (BuildContext ctxt, int index) {
          //         return buildBody(context, index);
          //       }
          //     )
          // ),
           new Expanded(
              child: emailView,
           ),
          //gridView,
         ],
       ),
    );
  }
}