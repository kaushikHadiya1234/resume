import 'package:flutter/material.dart';
import 'package:prectics/Screen/countrymodal.dart';

class CountryName extends StatefulWidget {
  const CountryName({Key? key}) : super(key: key);

  @override
  State<CountryName> createState() => _CountryNameState();
}

class _CountryNameState extends State<CountryName> {
  List color = [
    Colors.blue,
    Colors.purple,
    Colors.red,
    Colors.pink,
    Colors.yellow,
    Colors.blue,
    Colors.purple,
    Colors.red,
    Colors.pink,
    Colors.yellow,
  ];

  List l1 = [
    "🇮🇳 India",
    "🇳🇵 Nepal",
    "🇸🇬 Singapore",
    "🇪🇸 Spain",
    "🇹🇬 Togo",
    "🇺🇲 U.S",
    "🇩🇿 Algeria",
    "🇦🇴 Angola",
    "🇦🇲 Armenia",
    "🇦🇺 Australia",
  ];

  List Images = [
    "Assets/Image/india.jpg",
    "Assets/Image/nepal.jpg",
    "Assets/Image/singapor.jpg",
    "Assets/Image/spain.jpg",
    "Assets/Image/togo.jpg",
    "Assets/Image/us.jpg",
    "Assets/Image/algeria.jpg",
    "Assets/Image/angola.jpg",
    "Assets/Image/arm.jpg",
    "Assets/Image/austalia.jpg",
  ];

  List d2 = [
    "India, officially the Republic of India (Hindi: Bhārat Gaṇarājya),[25] is a country in South Asia. It is the seventh-largest country by area, the second-most populous country, and the most populous democracy in the world.",
    "The Constitution of Nepal, adopted in 2015, affirms the country as a secular federal parliamentary republic divided into seven provinces. Nepal was admitted to the United Nations in 1955, and friendship treaties were signed with India in 1950 and China in 1960.",
    "Singapore, officially the Republic of Singapore, is a sovereign country as well as a city-state. It is an island state at the southern end of the Malay Peninsula in Asia, between the Straits of Malacca and the South China Sea.",
    "Spain is a country in Southern Europe. It is in the Iberian Peninsula. Spain has borders with France, Portugal, Andorra and Gibraltar. Ceuta and Melilla border with Morocco in North Africa. In Spain's northeast side are the Pyrenees mountains.",
    "Archaeological finds indicate that tribes were able to produce pottery and process iron. The name Togo is translated from the Ewe language as ",
    "The United States of America (U.S.A. or USA), commonly known as the United States (U.S. or US) or America, is a country primarily located in North America.",
    " Algeria is bordered to the northeast by Tunisia; to the east by Libya; to the southeast by Niger; to the southwest by Mali, Mauritania, and Western Sahara; to the west by Morocco; and to the north by the Mediterranean Sea",
    "Angola has been inhabited since the Paleolithic Age. Its formation as a nation-state originates from Portuguese colonisation, which initially began with coastal settlements and trading posts founded in the 16th century. In the 19th century, European settlers gradually began to establish themselves in the interior. ",
    "Armenia is a unitary, multi-party, democratic nation-state with an ancient cultural heritage. The first Armenian state of Urartu was established in 860 BC, and by the 6th century BC it was replaced by the Satrapy of Armenia. ",
    "Austria emerged from the remnants of the Eastern and Hungarian March at the end of the first millennium. Originally a margraviate of Bavaria, it developed into a duchy of the Holy Roman Empire in 1156 and was later made an archduchy in 1453"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CountryList"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              CountryModal c1 = CountryModal(l1:l1[index],Images: Images[index],d2: d2[index] );
              Navigator.pushNamed(context, "view",arguments: c1);
            },
            child: Container(margin: EdgeInsets.all(5),
             height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: color[index]
              ),
              child: Center(child: Text('${l1[index]}',style: TextStyle(
                fontSize: 20
              ),)),
            ),
          );
        },
        itemCount: l1.length,
        itemExtent: 100,
      ),
    );
  }
}
