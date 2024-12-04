import 'package:flutter/material.dart';
import 'package:rnewapp/BankApp/Screen/detailPage.dart';
import 'package:rnewapp/BankApp/model/models.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => const HomePage(),
      "detail_page": (context) => const Detail_Page(),
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bank> Bank = <bank>[
    bank(
      name: "SBI(State bank of india)",
      web: "https://www.onlinesbi.com/",
      ceo: "Dinesh Kumar Khara",
      birth: "1 July 1955",
      // logo: const AssetImage("assets/images/sbi.jpg"),
      logo: const NetworkImage('https://i.pinimg.com/originals/2a/2c/1d/2a2c1d90075390b22e7e6060254dab0d.jpg'),
      contact: "tel: 1800 425 3800",
      branch: 24000,
    ),
    bank(
      name: "HDFC bank",
      web: "https://www.hdfcbank.com/",
      ceo: "Sashidhar Jagdishan ",
      birth: "August 1994",
      // logo: const AssetImage("assets/images/hdfc.png"),
      logo: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS91g86GYPEmouJD3LiPGSYtYYW9XycFIu4pA&s'),
      contact: "tel:1860 267 6161",
      branch: 123,
    ),
    bank(
      name: "Bank of Baroda",
      web: "https://www.bankofbaroda.in/",
      ceo: "Sanjiv Chadha",
      birth: "20 July 1908",
      // logo: const AssetImage("assets/images/baroda.png"),
      logo: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ21DczasyEOGH4wFRn263svGbuJAIMnvW8LQ&s'),
      contact: "tel:0265-2316384",
      branch: 4715,
    ),
    bank(
      name: "AXIS BANK",
      web: "https://www.paisabazaar.com/axis-bank/customer-care/",
      ceo: "Mr.amitabh choudhary",
      birth: "1993",
      logo: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAuyOR3I5O64YwunrwRTdAAnFeWBQc3xRDRg&s'),
      contact: "tel:1860 419 5555",
      branch: 4594,
    ),
    bank(
      name: "ICICI Bank",
      web: "https://www.fincash.com/l/brand/icici-bank",
      ceo: "Sandeep Bakhshi",
      birth: "5 January 1994",
      // logo: const AssetImage("assets/images/icici.png"),
      logo: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp8mXBusladp4eop5YLbiGOpipboZcpsGylw&s'),
      contact: "tel:1860 120 7777",
      branch: 5288,
    ),
    bank(
      name: "Punjab National Bank",
      web: "https://netpnb.com/",
      ceo: " S. S. Mallikarjuna Rao",
      birth: "19 May 1894",
      // logo: const AssetImage("assets/images/panjab.png"),
      logo: const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVRNqZPXTg8Ro-IShgqAp71IAb37aaYV8cfw&s'),
      contact: "tel:1800 103 2222",
      branch: 10769,
    ),
    bank(
      name: "Canara Bank",
      web: "https://canarabank.com/",
      ceo: "Shri LV Prabhakar",
      birth: "1 July 1906",
      logo: const AssetImage("assets/images/canara.jpg"),
      contact: "tel:1800 425 0018",
      branch: 10391,
    ),
    bank(
      name: "Union Bank of India",
      web: "https://www.unionbankofindia.co.in/english/home.aspx#",
      ceo: "Shri Rajkiran Rai G",
      birth: "11 November 1919",
      logo: const AssetImage("assets/images/union.png"),
      contact: "tel:1800 22 2244",
      branch: 9500,
    ),
    bank(
      name: "Bank of India",
      web: "https://www.bankofindia.co.in/",
      ceo: "Shri Atanu Kumar Das",
      birth: "7 September 1906",
      logo: const AssetImage("assets/images/boi.jpg"),
      contact: "tel:1800 22 0229",
      branch: 5825,
    ),
    bank(
      name: "Indian Bank",
      web: "https://www.indianbank.net.in/jsp/startIBPreview.jsp",
      ceo: "Shanti Lal Jain",
      birth: "15 August 1907",
      logo: const AssetImage("assets/images/indian.png"),
      contact: "tel:1800 4250 0000",
      branch: 6000,
    ),
    bank(
      name: "Central Bank of India",
      web: "https://www.centralbankofindia.co.in/en",
      ceo: "Tapan Ray",
      birth: "21 December 1911",
      logo: const AssetImage("assets/images/central.png"),
      contact: "tel:1800 22 1911",
      branch: 2876,
    ),
    bank(
      name: "Indian Overseas Bank",
      web: "https://www.iobnet.co.in/ibanking/html/index.html",
      ceo: "Partha Pratim Sengupta",
      birth: "10 February 1937",
      logo: const AssetImage("assets/images/over.png"),
      contact: "tel:+91(22) 67577200",
      branch: 2995,
    ),
    bank(
      name: "UCO Bank",
      web: "https://www.ucobank.com/Hindi/homehindi.aspx",
      ceo: "Atul Kumar Goel",
      birth: "6 January 1943",
      logo: const AssetImage("assets/images/uco.png"),
      contact: "tel:1800 274 0123",
      branch: 2377,
    ),
    bank(
      name: "Kotak Mahindra Bank",
      web:
      "https://www.kotak.com/811-savingsaccount-ZeroBalanceAccount/811/ahome2.action?Source=GoogleSEM&banner=sok-kotak-811-search-brand-bank_account-mobile_select-loc-3_exact&pubild=kotak%20mahindra&gclid=CjwKCAiAtdGNBhAmEiwAWxGcUm1-fVBKGLDjbYd-8Q5AgEPV4QLHA9zE5MHsv_I-Yqp4YY0RiIITsRoC_IsQAvD_BwE&gclsrc=aw.ds",
      ceo: "Uday Suresh Kotak",
      birth: "February 2003",
      logo: const AssetImage("assets/images/kotak.png"),
      contact: "tel:1860 267 7777",
      branch: 1600,
    ),
    bank(
        name: "IndusInd Bank",
        web: "https://www.indusind.com/in/en/personal.html",
        ceo: "Arun Tiwari",
        birth: "April 1994",
        logo: const AssetImage("assets/images/indus.png"),
        contact: "tel:1860 267 7777",
        branch: 2886),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Banks"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.lightBlueAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: Bank.length,
            itemBuilder: (context, i) {
              return Card(
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed("detail_page", arguments: [
                      Bank[i].name,
                      Bank[i].ceo,
                      Bank[i].logo,
                      Bank[i].birth,
                      Bank[i].branch,
                      Bank[i].contact,
                      Bank[i].web,
                    ]);
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      maxRadius: 30,
                      minRadius: 10,
                      backgroundImage: Bank[i].logo,
                      backgroundColor: Colors.green,
                    ),
                    title: Text(Bank[i].name),
                  ),
                ),
              );
            }),
      ),
    );
  }
}