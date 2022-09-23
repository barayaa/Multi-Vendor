import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 140,
            elevation: 0,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraint) {
                return FlexibleSpaceBar(
                  title: AnimatedOpacity(
                    opacity: constraint.biggest.height <= 120 ? 1 : 0,
                    duration: Duration(
                      microseconds: 300,
                    ),
                    child: Text(
                      'Account',
                    ),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.cyan,
                          Colors.black26,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        15.0,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/images/guest.png',
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'GUEST',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(
                              25,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Cart',
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                        ),
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Order',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(
                              25,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'WishList',
                              style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ReusableWidget(
                  title: 'Account Info',
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 290,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Column(
                      children: [
                        ReusiableListTile(
                          title: 'Email Adress',
                          subtitle: 'wahab.baraya@gmail.com',
                          leading: Icons.email,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Divider(
                            color: Colors.cyan,
                            thickness: 1,
                          ),
                        ),
                        ReusiableListTile(
                          title: 'Phone Number',
                          subtitle: '+22791831212',
                          leading: Icons.phone,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Divider(
                            color: Colors.cyan,
                            thickness: 1,
                          ),
                        ),
                        ReusiableListTile(
                          title: 'Location',
                          subtitle: 'Niamey City',
                          leading: Icons.location_pin,
                        ),
                      ],
                    ),
                  ),
                ),
                ReusableWidget(
                  title: 'Account Settings',
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 290,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    child: Column(
                      children: [
                        ReusiableListTile(
                          title: 'Edit Profile',
                          subtitle: '',
                          leading: Icons.edit,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Divider(
                            color: Colors.cyan,
                            thickness: 1,
                          ),
                        ),
                        ReusiableListTile(
                            title: 'Change Password',
                            subtitle: '',
                            leading: Icons.lock),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Divider(
                            color: Colors.cyan,
                            thickness: 1,
                          ),
                        ),
                        ReusiableListTile(
                          title: 'Logout',
                          subtitle: '',
                          leading: Icons.logout,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReusiableListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leading;

  const ReusiableListTile({
    required this.title,
    required this.subtitle,
    required this.leading,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(leading),
      // trailing: Text('10h15'),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title;
  const ReusableWidget({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 40,
          width: 50,
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 40,
          width: 50,
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        )
      ],
    );
  }
}
