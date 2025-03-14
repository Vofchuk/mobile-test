import 'package:flutter/material.dart';

import '../../models/servisse_model.dart';
import '../../util/my_text.dart';
import '../../util/static_data.dart';
import '../bottom_navigation_bar.dart';
import 'components/servisse_card.dart';
import 'components/specialist_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Stores the selecte serveisse (current in use just for UI proposes)
  Servisse selectedServisse = StaticData.servisses.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildTopPortion(),
              _buildSpecialistsArea(),
              _buildWhatDoYouNeedArea()
            ],
          ),
        ),
      ),
    );
  }

  Column _buildWhatDoYouNeedArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          'What do you need?',
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          fontWeight: FontWeight.bold,
          size: 26,
        ),
        Container(
          height: 300,
          padding: const EdgeInsets.all(12),
          child: GridView.count(
            //Displays the UI in a consistant way - depending on the deveice aspect ratio and size
            crossAxisCount: 3,
            mainAxisSpacing: 22,
            crossAxisSpacing: 12,
            children: [
              ...StaticData.servisses.map(
                //Maps the static data sotored on the Util folder - this helps to add more features on the future
                (e) => ServisseCard(
                  servisse: e,
                  onTap: () {
                    setState(() {
                      selectedServisse = e;
                    });
                  },
                  isSelected: selectedServisse.title == e.title,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSpecialistsArea() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          'Specialists',
          margin: const EdgeInsets.symmetric(horizontal: 16),
          fontWeight: FontWeight.bold,
          size: 26,
        ),
        Container(
          height: 230,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SpecialistCard(
                  color: Color(0xffe5495e),
                  title: 'Heart Specialist',
                  docNum: 40,
                  image:
                      'icons/heart-shape-outline-with-lifeline.svg', //TODO: add as const
                ),
                SpecialistCard(
                  color: Color(0xfff6af3d),
                  title: 'Dental Care',
                  image: 'icons/tooth.svg',
                  docNum: 35,
                ),
                SpecialistCard(
                  color: Color(0xff7349e5),
                  title: 'Dermatology Specialist',
                  image: 'icons/pimples.svg',
                  docNum: 12,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildTopPortion() {
    return [
      SizedBox(
        height: 26,
      ),
      MyText(
        'Hello,',
        margin: const EdgeInsets.symmetric(horizontal: 16),
        size: 20,
      ),
      MyText(
        'Lorelle Luna',
        margin: const EdgeInsets.symmetric(horizontal: 16),
        size: 38,
        fontWeight: FontWeight.bold,
      ),
      SizedBox(
        height: 32,
      ),
    ];
  }
}
