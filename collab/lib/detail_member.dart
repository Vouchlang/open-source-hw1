import 'package:flutter/material.dart';
import 'home_page.dart';

class NeumorphicContainer extends StatelessWidget {
  final Widget child;
  final double blurRadius;
  final BorderRadiusGeometry borderRadius;
  final double depth;
  final EdgeInsetsGeometry padding;

  const NeumorphicContainer({
    super.key,
    required this.child,
    this.blurRadius = 15,
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.depth = 10,
    this.padding = const EdgeInsets.all(20),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            offset: Offset(-depth / 2, -depth / 2),
            blurRadius: blurRadius,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: Offset(depth, depth),
            blurRadius: blurRadius,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}

const Color _kBackgroundColor = Color(0xFFE0E5EC);
const Color _kPrimaryBlue = Color(0xFF005086);
const Color _kAccentBlue = Color(0xFF0077B6);

class DetailMember extends StatelessWidget {
  final Member member;
  const DetailMember({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    Widget buildProfileAvatar() {
      const double avatarRadius = 80.0;
      const double imageSize = avatarRadius * 2;

      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 20,
              offset: const Offset(0, 5),
            ),
            const BoxShadow(
              color: Colors.white10,
              blurRadius: 5,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: avatarRadius,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: member.imageUrl == ''
                ? Icon(
                    Icons.person_4_rounded,
                    size: avatarRadius + 10,
                    color: Colors.grey[400],
                  )
                : Image.asset(
                    member.imageUrl,
                    width: imageSize,
                    height: imageSize,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: _kBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320.0,
            floating: false,
            pinned: true,
            backgroundColor: _kPrimaryBlue,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 20),
              title: Text(
                member.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  shadows: [Shadow(blurRadius: 5, color: Colors.black45)],
                ),
              ),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_kPrimaryBlue, _kAccentBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const Positioned(
                      top: 60,
                      child: Text(
                        'MEMBER PROFILE',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    buildProfileAvatar(),
                  ],
                ),
              ),
            ),
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            elevation: 10,
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 0,
                ),
                child: NeumorphicContainer(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        child: Text(
                          member.description,
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      _buildInfoRow(
                        icon: Icons.school_rounded,
                        label: "${member.degree} in ${member.major}",
                        detail: "Class of ${member.year}",
                      ),

                      const Divider(
                        height: 30,
                        thickness: 0.5,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.grey,
                      ),

                      _buildInfoRow(
                        icon: Icons.work_history_rounded,
                        label: "Current Role",
                        detail: member.job,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String detail,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NeumorphicContainer(
          depth: 2,
          blurRadius: 5,
          borderRadius: BorderRadius.circular(15),
          padding: const EdgeInsets.all(10),
          child: Icon(icon, color: _kAccentBlue),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              const SizedBox(height: 2),
              Text(
                detail,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: _kPrimaryBlue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
