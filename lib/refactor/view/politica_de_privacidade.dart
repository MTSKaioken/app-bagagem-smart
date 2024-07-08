import 'package:flutter/material.dart';

class PoliticaDePrivacidade extends StatefulWidget {
  const PoliticaDePrivacidade({super.key});

  @override
  _PoliticaDePrivacidade createState() => _PoliticaDePrivacidade();
}

class _PoliticaDePrivacidade extends State<PoliticaDePrivacidade> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bagagem Smart',
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Política de Privacidade',
              textDirection: TextDirection.ltr,
            ),
            backgroundColor: Colors.black87,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lorem Ipsum',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae quam non odio convallis tristique. Phasellus nec lorem nec lorem interdum finibus ac a tellus. Integer consequat risus sed risus tincidunt, quis commodo mi iaculis. Aenean eu mi eget velit semper gravida. Sed in orci non lorem lacinia cursus a eget lectus. Cras interdum congue mi, quis tempor odio aliquam nec. Fusce in vestibulum nulla.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Maecenas vel tristique odio. Phasellus ac turpis auctor, lobortis nisl vel, maximus elit. Proin viverra, elit a rutrum tristique, lorem odio dignissim nisl, non ultricies ipsum nisl quis metus. Suspendisse et est in nulla facilisis efficitur. Morbi molestie nulla et eros congue lobortis. Fusce vel dictum nisi. Duis sed tincidunt dolor. Nulla in justo ut odio placerat elementum a et nisi. Nam sit amet condimentum elit. Quisque id ante vitae tellus suscipit scelerisque. Nullam vitae odio metus. Phasellus vitae orci lacinia, iaculis quam ac, cursus sapien.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In semper dui eu leo vehicula lacinia. Cras volutpat est non elit volutpat, ac consequat lorem laoreet. Nullam eleifend leo id diam dignissim auctor. Nulla at consectetur ligula. Quisque id nisi non urna dapibus feugiat. Aenean auctor metus ut ligula consequat, nec rhoncus sapien varius.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Integer nec enim a sapien mollis eleifend non vel est. Vivamus a purus eu urna sollicitudin vestibulum. Phasellus ullamcorper mi id convallis sagittis. Aenean egestas at velit ac maximus. Ut ultricies, lacus non pharetra ullamcorper, mi eros gravida eros, a fringilla augue lacus eu mauris. Proin at feugiat odio. Phasellus consectetur neque non erat posuere, ac feugiat magna dignissim. Duis vestibulum, lectus id vehicula rutrum, nisi neque consectetur tortor, eget mattis nisi neque vitae sapien. Phasellus sit amet nulla nisi. Vestibulum elementum, orci sed volutpat pellentesque, orci augue placerat nunc, nec blandit est sem non odio. Vestibulum aliquam tellus et leo tempus congue. Phasellus scelerisque feugiat mauris sit amet maximus.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Vestibulum suscipit in dui ac condimentum. Morbi in mauris vel odio tristique euismod. Morbi et sollicitudin justo, vitae feugiat nulla. Nullam vel eros a libero cursus varius eu eu justo. Integer vehicula risus ac metus efficitur, et sollicitudin neque posuere. Quisque ac augue venenatis, interdum eros sed, mattis velit. Nam in sodales justo. Vivamus in arcu vitae tellus cursus aliquam. Integer eget dolor ac lacus rhoncus lobortis. Curabitur pharetra justo nec metus tempor, at efficitur mauris ullamcorper. Sed sit amet posuere nulla. Nulla facilisi. Morbi dictum hendrerit nisi, id posuere justo vehicula in. Duis vel nunc sit amet nisi condimentum volutpat a et ipsum. Cras ut metus vel tortor laoreet rutrum. Integer volutpat lorem in lorem eleifend, eget iaculis enim ultricies.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Donec efficitur condimentum risus. Duis nec interdum ipsum. Ut tincidunt, est vitae fermentum interdum, turpis nulla maximus arcu, nec molestie libero lorem nec lorem. In hac habitasse platea dictumst. Integer vehicula pharetra turpis vitae cursus. Nunc dapibus nisi purus, sed vehicula elit consectetur in. Vestibulum euismod magna vel tincidunt molestie. Integer ut metus mi. Sed maximus dolor ut enim consectetur, eu tincidunt quam dignissim.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nam eu orci vel eros fermentum consectetur. In non arcu ac ipsum luctus dictum. Nulla facilisi. Phasellus fermentum tellus at lobortis hendrerit. Cras dapibus vehicula sapien, ut ultrices lectus congue ac. Phasellus condimentum sollicitudin lorem, ut pellentesque urna dignissim a. Duis in ipsum in orci rutrum consequat. Mauris consequat sapien in orci tincidunt, in ultricies libero ultricies. Cras volutpat pharetra purus, nec eleifend erat varius at. Ut sed tincidunt felis. Sed malesuada urna et dolor posuere, non condimentum nulla efficitur. Aenean ut libero magna.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Vestibulum at elit vel purus rhoncus efficitur. Sed posuere malesuada venenatis. Aenean nec turpis rutrum, tempor orci sed, accumsan lectus. Etiam a orci eu purus fringilla interdum. Cras hendrerit accumsan scelerisque. Proin et libero nisl. Sed vitae lectus vel sem pellentesque tristique. In hac habitasse platea dictumst. Donec vel augue consequat, ultricies risus nec, fermentum sapien.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Fusce eu magna sit amet velit pretium gravida a non lorem. Curabitur sagittis volutpat semper. Donec at dapibus metus. Ut ultricies nibh non diam volutpat, vitae fringilla justo feugiat. Donec id mi eget est placerat volutpat. Phasellus eget nunc at nulla dictum rhoncus. Proin id fermentum lacus. Vestibulum nec sagittis sapien. Suspendisse potenti. Ut at est id sapien tempus molestie.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Suspendisse potenti. Aenean gravida vestibulum velit, id ultricies nulla. Phasellus ut risus dapibus, condimentum arcu in, viverra nulla. Duis nec ligula et leo congue hendrerit. Proin id purus id diam maximus volutpat ac sit amet dolor. Nullam suscipit odio non tellus congue, a mollis mi tincidunt. Proin id pharetra nisl. Pellentesque vel sollicitudin enim. Duis in est vitae arcu semper aliquet.',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
