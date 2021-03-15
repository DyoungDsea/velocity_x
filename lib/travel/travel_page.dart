import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  final imgUrl = 'images/young.jpg';
  final imgUrl1 = 'images/8.jpg';
  final imgUrl2 = 'images/9.jpg';
  final imgUrl3 = 'images/10.jpg';

  TabController _tabController;
  double anim = 1.0;
  double anim2 = 1.0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    withAnimation(
      vsync: this,
      tween: Tween(begin: 1.0, end: 0.0),
      callBack: (animationVal, controllerVal) {
        anim = animationVal;
        setState(() {});
      },
    );

    withRepeatAnimation(
      vsync: this,
      isRepeatReversed: true,
      tween: Tween(begin: 2.0, end: 3.0),
      callBack: (animationVal, controllerVal) {
        anim2 = animationVal;
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = _tabController.index;
    return Scaffold(
      backgroundColor: Vx.purple500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: VStack(
          [
            VxBox().size(20, 2).white.make(),
            5.heightBox,
            VxBox().size(28, 2).white.make(),
            5.heightBox,
            VxBox().size(20, 2).white.make(),
          ],
        ).pOnly(left: 16, top: 16),
      ),
      body: VStack([
        VxBox(
                child: [
          VxBox()
              .square(100)
              .roundedFull
              .neumorphic(
                color: Vx.purple500,
                elevation: 30.0,
              )
              .bgImage(DecorationImage(
                image: AssetImage(imgUrl),
              ))
              .make(),
          "Hi, "
              .richText
              .withTextSpanChildren(["Young Elefiku".textSpan.bold.make()])
              .white
              .xl2
              .make()
              .p8()
              .offset(offset: Offset(-300 * anim, 0.0)),
          "Solo Traveler".text.white.make(),
          VxTextField(
            borderType: VxTextFieldBorderType.none,
            borderRadius: 18,
            hint: "Search",
            fillColor: Vx.gray200.withOpacity(0.3),
            contentPaddingTop: 13,
            autofocus: false,
            prefixIcon: Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
          )
              .customTheme(
                themeData: ThemeData(
                  brightness: Brightness.dark,
                ),
              )
              .cornerRadius(10)
              .p16(),
        ].column())
            .makeCentered()
            .h40(context),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: VxBox(
            child: VStack([
              TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.purple,
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Vx.purple500,
                  unselectedLabelColor: Vx.gray400,
                  labelPadding: Vx.m16,
                  tabs: [
                    Icon(Icons.map, size: 10)
                        .scale(scaleValue: tabIndex == 0 ? anim2 : 3.00),
                    Icon(Icons.pin_drop, size: 10)
                        .scale(scaleValue: tabIndex == 1 ? anim2 : 3.00),
                    Icon(Icons.restaurant, size: 10)
                        .scale(scaleValue: tabIndex == 2 ? anim2 : 3.00),
                    Icon(Icons.person, size: 10)
                        .scale(scaleValue: tabIndex == 3 ? anim2 : 3.00),
                  ]),
              TabBarView(
                controller: _tabController,
                children: ["1", "2", "3", "4"]
                    .map(
                      (e) => VStack([
                        "Discover places in Nigeria"
                            .text
                            .gray600
                            .bold
                            .xl2
                            .make(),
                        20.heightBox,
                        TravelCard(
                          imgUrl: imgUrl1,
                          title: "Tower Bridge",
                          subTitle: "Southwork",
                        ),
                      ]).p16(),
                    )
                    .toList(),
              ).expand()
            ]),
          ).white.make(),
        ).expand(),
      ]),
    );
  }
}

class TravelCard extends StatelessWidget {
  const TravelCard({
    Key key,
    @required this.imgUrl,
    this.title,
    this.subTitle,
  }) : super(key: key);

  final String imgUrl, subTitle, title;

  @override
  Widget build(BuildContext context) {
    return HStack([
      Image.asset(
        imgUrl,
        fit: BoxFit.cover,
      ).wh(context.percentWidth * 35, 100).cornerRadius(10),
      20.widthBox,
      VStack(
        [
          title.text.semiBold.make(),
          3.heightBox,
          subTitle.text.make().shimmer(),
          5.heightBox,
          [
            VxRating(
              size: 13,
              onRatingUpdate: (value) {},
            ),
            5.widthBox,
            "(100)".text.xs.gray600.make()
          ].row()
        ],
        crossAlignment: CrossAxisAlignment.start,
      ).expand()
    ]).cornerRadius(8).backgroundColor(Vx.gray200);
  }
}
