import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  final List<Project> projects = [
  
 Project(
      title: 'Skye wallet',
      description: "Skye Wallet is the simplest and most secure way to Buy, Sell, Swap, Send and Receive Bitcoin and Cryptocurrency in Nigeria. Skye Wallet offers our users a very easy and user-friendly experience to enable even newbies have access to own cryptocurrency. The crypto assets currently include, Bitcoin (BTC), USDT, USDC, Bitcoin Cash (BCH), Tron (TRX), Litecoin (LTC) and more.",
      imageUrl: 'assets/skye.webp',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.skyewallet.skye_wallet&hl=en',
      appStoreUrl: 'https://apps.apple.com/ng/app/skye-wallet-buy-sell-crypto/id1587180582',
    ),
     Project(
      title: 'Genti Audio ',
      description: 'Are you looking for a place to listen to African stories? Genti Audio is your answer! Genti Audio is a unique African storytelling platform that offers audiobooks, radio dramas, stories, and podcasts on the go. Genti features a wide range of original stories from across Nigeria and Africa, including drama, romance, folktales, religious messages and news.',
      imageUrl: 'assets/genti.webp',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.app.gentimedia',
      appStoreUrl: 'https://apps.apple.com/ng/app/genti-audio-african-stories/id1626263802',
    ),
     Project(
      title: 'Meritrade',
      description: 'Discover Meritrade by Meristem – your all-in-one online trading and stockbroking app for beginners and seasoned investors. Track the stock market today, find the best stocks to buy now, and invest confidently on one of the best trading platforms.',
      imageUrl: 'assets/meritrade.webp',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.meristem.meritradeapp&hl=en',
      appStoreUrl: 'https://apps.apple.com/ng/app/meritrade/id977562417',
    ),
      Project(
      title: 'Universal Insurance Plc Mobile',
      description: 'Our mobile services are specifically designed to give you a more convenient way to purchase and manage your plans and policies. Download and have affordable insurance options at your fingertips!.',
      imageUrl: 'assets/uip_mobile.webp',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.universalinsuranceplc.universal_insurance_mobile&hl=en',
      appStoreUrl: 'https://apps.apple.com/us/app/uip-mobile/',
    ),

     Project(
      title: 'Payment Pro',
      description: 'Payment Pro (Merchant) is your one stop application to ease all your payment needs. Experience easy payment collection from your mobile phone with Payment Pro (Merchant). Accept payments anywhere, anytime. Streamline your payment process and get paid faster with ease',
      imageUrl: 'assets/paymentpro.webp',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=net.blusalt.payment_pro_merchant&hl=en',
      appStoreUrl: 'https://apps.apple.com/us/app/payment_pro_merchant/',
    ),
    
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Engineer Portfolio',
      home: Scaffold(
        appBar: AppBar(title: Text('My Portfolio')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child:  Column(
    children: [
      HeaderSection(),
      SizedBox(height: 30,),
      ...projects.map((p) => ProjectCard(project: p)).toList(),
    ],
  ),
        ),
      ),
    );
  }
}

class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String playStoreUrl;
  final String appStoreUrl;

  Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.playStoreUrl,
    required this.appStoreUrl,
  });
}

class ProjectCard extends StatefulWidget {
  final Project project;
  const ProjectCard({required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: _hovering
            ? Matrix4.translationValues(0, -4, 0)
            : Matrix4.translationValues(0, 0, 0),
        child: Card(
          elevation: _hovering ? 8 : 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: InkWell(
            borderRadius: BorderRadius.circular(4),
            onTap: () {
              // You could open a modal or navigate on tap
            },
            child: SizedBox(
              height: 200,
              child: Row(
                children: [
                  // LEFT: Project Image
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(32)),
                      child: Image.asset(
                        widget.project.imageUrl,
                        width: 200,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // RIGHT: Details
                  Expanded(
                    child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.project.title,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            widget.project.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                icon: Icon(Icons.android),
                                label: Text('Play Store'),
                                onPressed: () => _launchURL(widget.project.playStoreUrl),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 197, 223, 199),
                                ),
                              ),
                              SizedBox(width: 12),
                              OutlinedButton.icon(
                                icon: Icon(Icons.apple),
                                label: Text('App Store'),
                                onPressed: () => _launchURL(widget.project.appStoreUrl),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.black,
                                  side: BorderSide(color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }
}


class HeaderSection extends StatelessWidget {

  final String cvUrl = "https://1drv.ms/w/c/8e2950c8b714ee53/EQ5UfNpuLQ5AuMKmXflWpSMBX6uSsvtbIyas75atG2ygUg?e=mxrvsY";
  final String emailAddress = 'mailto:gtaiwo.gt@gmail.com'; // Your email

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey.shade900, Colors.teal.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/profile_img.JPG'),
          ),
          SizedBox(height: 20),
          Text(
            'Hi, I\'m abiodun taiwo',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Flutter Engineer | UI/UX Enthusiast | Cross-platform Craftsman',
            style: TextStyle(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 12,
            children: [
              ElevatedButton.icon(
                icon: Icon(Icons.download),
                label: Text('Download CV'),
                 onPressed: () => _launchURL(cvUrl),
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.email),
                label: Text('Contact Me'),
                 onPressed: () => _launchURL(emailAddress),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white70),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }


class GradientButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final IconData icon;

  const GradientButton({
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: _hovering
                  ? [Colors.greenAccent.shade400, Colors.teal.shade600]
                  : [Colors.teal.shade600, Colors.green.shade800],
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: _hovering
                ? [BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3))]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: Colors.white),
              SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
