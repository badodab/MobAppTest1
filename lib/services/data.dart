import 'package:jaehub/models/product.dart';

Future getSlideShow() {
  // return Future.value(["https://www.nyip.edu/images/cms/photo-articles/the-best-place-to-focus-in-a-landscape.jpg", "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "https://petapixel.com/assets/uploads/2022/08/fdfs11-800x533.jpg", "https://media.macphun.com/img/uploads/macphun/blog/2063/_1.jpeg?q=75&w=1710&h=906&resize=cover"]);
  return Future.value(["https://jersacgymequipment.ph/images/thumbs/0000025_328442383_877670553496282_3320535227627306867_n%20(1).jpeg", "https://jersacgymequipment.ph/images/thumbs/0001076_ad.png", "https://jersacgymequipment.ph/images/thumbs/0001078_bodega%20sale.png", "https://jersacgymequipment.ph/images/thumbs/0001080_De%20Asis,%20Michelle%20L..png"]);
}

List<dynamic> getSlideShowInitial() {
  // return ["https://www.nyip.edu/images/cms/photo-articles/the-best-place-to-focus-in-a-landscape.jpg", "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg", "https://petapixel.com/assets/uploads/2022/08/fdfs11-800x533.jpg", "https://media.macphun.com/img/uploads/macphun/blog/2063/_1.jpeg?q=75&w=1710&h=906&resize=cover"];
  return ["https://jersacgymequipment.ph/images/thumbs/0000025_328442383_877670553496282_3320535227627306867_n%20(1).jpeg", "https://jersacgymequipment.ph/images/thumbs/0001076_ad.png", "https://jersacgymequipment.ph/images/thumbs/0001078_bodega%20sale.png", "https://jersacgymequipment.ph/images/thumbs/0001080_De%20Asis,%20Michelle%20L..png"];
}

List<dynamic> getShopGridInitial() {
  return [
    {
      'name': "Gym Equipment",
      'image': "https://www.nyip.edu/images/cms/photo-articles/the-best-place-to-focus-in-a-landscape.jpg",
      'price': 100,
    },
    {
      'name': "Gym Equipment 2 Gym Equipment 2 Gym Equipment 2 Gym Equipment 2 Gym Equipment 2 Gym Equipment 2",
      'image': "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
      'price': 200,
    },
    {
      'name': "Gym Equipment 3",
      'image': "https://petapixel.com/assets/uploads/2022/08/fdfs11-800x533.jpg",
      'price': 5074,
    },
    {
      'name': "Gym Equipment 4",
      'image': "https://media.macphun.com/img/uploads/macphun/blog/2063/_1.jpeg?q=75&w=1710&h=906&resize=cover",
      'price': 3217,
    },
    {
      'name': "Gym Equipment 5",
      'image': "https://media.macphun.com/img/uploads/macphun/blog/2063/_1.jpeg?q=75&w=1710&h=906&resize=cover",
      'price': 10999,
    },
  ];
}

List<dynamic> getCategories() {
  return [
    {"name": "SALE ITEMS"},
    {"name": "BEST SELLER"},
    {"name": "SAUNA ROOMS"},
    {
      "name": "HOME GYMS",
      "subitems": [
        {"name": "Multi-Station Home Gyms"},
        {"name": "Smith Machines"},
        {"name": "Functional Trainers"}
      ]
    },
    {
      "name": "MATTING",
      "subitems": [
        {"name": "Yoga Mat / Exercise Mat"},
        {"name": "4ft x 8ft Rubber Matting"},
        {"name": "Puzzle Mat"},
        {"name": "Pure Rubber Mat"}
      ]
    },
    {
      "name": "RACKS AND CAGES",
      "subitems": [
        {"name": "Power Racks"},
        {"name": "Power Rack Packages"},
        {"name": "Half Racks"},
        {"name": "Squat Rack and Stands"},
        {"name": "Power Rack Attachments"}
      ]
    },
    {
      "name": "FREE WEIGHTS",
      "subitems": [
        {"name": "Long Bar"},
        {"name": "Pec Fly /Rear Delt Machine"},
        {"name": "Free Weight Packages"},
        {"name": "Weight Benches"},
        {"name": "Weight Plates"},
        {"name": "Weight Sets"},
        {"name": "Barbells"},
        {"name": "Barbell Collars & Grips"},
        {
          "name": {
            "name": "Dumbbells",
            "subitems": [
              {"name": "Rubber Hex Dumbbell"},
              {"name": "Vinyl Dumbbell"},
              {"name": "Round Dumbbell"}
            ]
          }
        },
        {"name": "Rubber Hex Dumbbell"},
        {"name": "Vinyl Dumbbell"},
        {"name": "Round Dumbbell"},
        {"name": "Kettlebells"},
        {"name": "Medicine Balls"},
        {"name": "Body Weight Vests"},
        {"name": "Weight Racks & Storage"},
        {"name": "Calf Machines"}
      ]
    },
    {
      "name": "WEIGHTS MACHINES",
      "subitems": [
        {"name": "Leg Raise / Knee Raise"},
        {"name": "Cable Machines, Crossovers"},
        {"name": "Cable Attachments, Handles"},
        {"name": "Ab Machines"},
        {"name": "Chest, Shoulder Press Machine"},
        {"name": "Back, Lat Pulldown Machines"},
        {"name": "Biceps Machines"},
        {"name": "Smith Machines"},
        {"name": "Triceps Machine"},
        {"name": "Leg Press Machines"},
        {"name": "Leg Extension, Leg Curl Machines"},
        {"name": "Power Plates"},
        {"name": "Wight Machine Plates & Adapters"}
      ]
    },
    {
      "name": "CROSS TRAINING",
      "subitems": [
        {"name": "Cross Training Equipment Packages"},
        {"name": "Power Towers & Pull-up Bars"},
        {"name": "Olympic Weigth Sets"},
        {"name": "Olympic Barbells & Collars"},
        {"name": "Olympic Bumper Plates"},
        {"name": "Kettlebells"},
        {"name": "Medicine Balls"},
        {"name": "Plyo Boxes"},
        {"name": "Ropes & Ropes Climbers"},
        {"name": "Ab Benches & Roman Chair"},
        {"name": "Lower Back, Ham, Glute Machines"},
        {"name": "Wall Ball"},
        {"name": "Slam Ball"},
        {"name": "Olympic Tri-Grip Plates"},
        {"name": "Bulgarian Bag"},
        {"name": "Sand Bag"},
        {"name": "Weighted Bar"},
        {"name": "Olympic Bench"}
      ]
    },
    {
      "name": "CARDIO MACHINES",
      "subitems": [
        {"name": "Treadmill"},
        {"name": "Bike"},
        {"name": "Elliptical Bike"},
        {"name": "Upright Bike"},
        {"name": "Rowing Machine"}
      ]
    },
    {
      "name": "ACCESSORIES",
      "subitems": [
        {"name": "Jumping Rope"},
        {"name": "Resistance Band"},
        {"name": "Muscle Tape & Handwraps"},
        {"name": "Fitness Gloves"},
        {"name": "Timer / Scoreboard / Stopwatch"},
        {"name": "Gym Ball/ Stability Ball/Swiss Ball/Yoga Ball"},
        {"name": "Foam Roller / Massager"},
        {"name": "Sauna Suit"},
        {"name": "Cooling Towel"},
        {"name": "TRX Trainer & Accessories"},
        {"name": "Supports"},
        {"name": "Knee Wrap /Wrist Wrap/ Wrist Strap"},
        {"name": "Lifting Belt"}
      ]
    },
    {
      "name": "SPORTS",
      "subitems": [
        {"name": "Basketball"},
        {"name": "Dart"},
        {"name": "Softball"},
        {"name": "Baseball"},
        {"name": "Badminton"},
        {"name": "Archery"},
        {"name": "Table Tennis"},
        {"name": "Running"}
      ]
    },
    {"name": "CAMPING"}
  ];
}

Product productTestItem() {
  return Product(
    id: 99999,
    name: 'Dry Sauna infrared Steam Room / Sauna Room Good for 1 to 2 Seaters',
    subtitle: 'SKU: JA-0056',
    description: '• FM Stereo,MP3,Usb• Soft Reading Light 3x• Double control Panel Inside/Outside• Oxygen ionizer• Ceramic Heater : 3 Pcs• Carbon Heater: 4 Pcs• Family,Beauty Parlor, Sanatorium , Gymnasium, hospital, Hotel Etc.• Removes toxins, heavy metals and harmful materials• Removes fatigue, replenish oxygen and energy• Reduces stress, promotes better sleep• Provides the same effects of exercise• Makes skin beautiful and smooth, looks young• Burns calories and weight loss ( 600 calories / 30min )• Remarkable pain relief• Improves blood circulation, caradiovascular and cerebral system• Safe• Natural and green• Humanistic design• Comfortable• Easy operation, easy installation• Easy for transportation• Effective• Luxurious appearance• Easy to Assemble• Assembled Size : for MM 900 x 900 x 1900 mm• Assembled Size : for CM 90 x 90 x 190 cm• Assembled Size : for INCHES 35.5 x 35.5 x 75 inches• Model: LYK 01 Canadian Hemlock• Package: 2box• Weight 105kgs• Power: 1350 Watts'
        .replaceAll('•', "\n•"),
    price: 1999,
		oldPrice: null,
    ratings: 3.5,
    thumbnails: ['https://jersacgymequipment.ph/images/thumbs/0000725_livepro-porta-bar-parallel-bar_550.png', 'https://jersacgymequipment.ph/images/thumbs/0000726_livepro-porta-bar-parallel-bar.png', 'https://jersacgymequipment.ph/images/thumbs/0000728_livepro-porta-bar-parallel-bar.png'],
    covers: ['https://jersacgymequipment.ph/images/thumbs/0000725_livepro-porta-bar-parallel-bar_550.png', 'https://jersacgymequipment.ph/images/thumbs/0000726_livepro-porta-bar-parallel-bar.png', 'https://jersacgymequipment.ph/images/thumbs/0000728_livepro-porta-bar-parallel-bar.png'],
  );
}
