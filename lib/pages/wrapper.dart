import "package:flutter/material.dart";
import 'package:legal_app/pages/home/cases_menu.dart';
import "classes/users.dart";
import "classes/scroll_menu.dart";
import 'authenticate/register_screen.dart';
import 'package:provider/provider.dart';
import 'home/home_page.dart';
import 'classes/post_card.dart';


Client user1 = Client(
  'Billy Bobby',
  'Toronto',
  'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
  [
    [
      'Category',
      'jhkgjhkgfdsjhkgfsdjhkgfsdjhlkgfsdjhklgfsdhjlkgfjhlkfgsdgjhkjlhfkgjhkfsgdljkhgsfdkjhgsfjkhgfsjhgksfdjkhslgfjhkgfhjgkfsfhjgkdjslhgfkdjfgshdkljfkdsghsjdkfghskljdfhglskjdfghlskdjfghsdklfjgfskdjhsgkjghjksdflghsjkdfhgkjsdfhkdjshgskjdfhgksjdfhgjskdfhgskjldfghksjldfhgskjdfhgskjldfhgksljdfghsjkldfhgskldjfghjkdfhgskdlfhglsdfjkgshldjfkgh'
    ]
  ],
  [],
  [
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
  ],
);

CaseCard temp_case = CaseCard(user1);

CasesMenu temp_menu = CasesMenu([
  temp_case,
  temp_case,
  temp_case,
  temp_case,
  temp_case,
  temp_case,
  temp_case
]);

Post temp_post = Post(
    'https://media.sproutsocial.com/uploads/2017/02/10x-featured-social-media-image-size.png',
    'Htyehsdjksgdfjkhgkljgfkjhgfsjhgsfjkhsgfjhgkfdjkghfsdjkgfdljkghshjdkfgjlhs',
    DateTime.now(),
    [Comments(user1, 'wow'), Comments(user1, 'woow')],
    4);

PostCard temp_postcard = PostCard(user1, temp_post);

HomeMenu temp_home = HomeMenu([temp_postcard, temp_postcard]);


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<OurUser>(context);
    if (user == null) {
      return InitScreen();
    } else {
      return temp_home;
    }
  }
}
