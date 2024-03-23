const subLabel1 =
    'Explore our wide selection of fresh fruits,\n vegetables, and organic produce, from farm to table.';
const subLabel2 =
    'Shop smart and make the most of your budget.\nExplore unbeatable deals and exclusive discounts.';
const subLabel3 =
    'Experience peace og mind with follow-up delivery\nnotifications right to your doorstep.';

List<String> listTitle1 = [
  'Let\'s find the ',
  'Best ',
  '&\n',
  ' Healthy Grocery'
];
List<String> listTitle2 = [
  'Discover ',
  'Offers ',
  'and\n',
  ' Discounts',
];
List<String> listTitle3 = [
  ' ',
  'Fast Delivery ',
  'and\n',
  ' Follow-Up',
];

const image1 = 'assets/1st.jpg';
const image2 = 'assets/2nd.jpg';
const image3 = 'assets/3rd.png';

List<OnboardModel> mainList = [
  OnboardModel(image: image1, titles: listTitle1, subtitle: subLabel1),
  OnboardModel(image: image2, titles: listTitle2, subtitle: subLabel2),
  OnboardModel(image: image3, titles: listTitle3, subtitle: subLabel3),
];

class OnboardModel {
  final String image;
  final List<String> titles;
  final String subtitle;

  OnboardModel({required this.image, required this.titles, required this.subtitle});
}
