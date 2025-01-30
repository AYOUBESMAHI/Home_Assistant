import 'package:flutter/material.dart';
import 'package:home_assistant/Features/Home/Models/SmartTv.dart';
import 'package:home_assistant/Providers/RoomsProvider.dart';
import 'package:provider/provider.dart';
import '../../../../Utils/Constants.dart';

class TvBottomSheetWidget extends StatefulWidget {
  const TvBottomSheetWidget({super.key});

  @override
  State<TvBottomSheetWidget> createState() => _TvBottomSheetWidgetState();
}

class _TvBottomSheetWidgetState extends State<TvBottomSheetWidget> {
  late SmartTv tv;
  @override
  void initState() {
    tv = Provider.of<RoomsProvider>(context, listen: false).smartDevice
        as SmartTv;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<RoomsProvider>(context, listen: false).setSmartDevice(tv);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      tv.isOn = !tv.isOn;
                    });
                  },
                  child: Image.asset(
                    "Assets/Images/power-on.png",
                    scale: 8,
                    color: tv.isOn ? Colors.green : Colors.red,
                  ),
                ),
                if (tv.isOn)
                  Expanded(
                    child: Slider(
                      value: tv.volume,
                      onChanged: (val) {
                        setState(() => tv.volume = val);
                      },
                      label: tv.volume.round().toString(),
                      max: 100,
                      divisions: 10,
                    ),
                  )
              ],
            ),
            if (tv.isOn)
              Expanded(
                child: GridView.builder(
                  itemCount: Constants.tvImages.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1.5,
                  ),
                  itemBuilder: (_, index) => GridTile(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          tv.tvmode = TvModes.values[index];
                        });
                      },
                      child: Container(
                        color: tv.tvmode.index == index
                            ? const Color.fromARGB(255, 196, 190, 190)
                            : null,
                        child: Image.asset(
                          Constants.tvImages[index],
                          scale: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
