          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.info_outline,
                    color: Color(0xFFDAA520),
                  ),
                  title: const Text('App Version'),
                  subtitle: const Text('1.0.0'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.help_outline,
                    color: Color(0xFFDAA520),
                  ),
                  title: const Text('Help & Support'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.privacy_tip_outlined,
                    color: Color(0xFFDAA520),
                  ),
                  title: const Text('Privacy Policy'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(
                    Icons.add_circle_outline,
                    color: Color(0xFFDAA520),
                  ),
                  title: const Text('Add New Hymn'),
                  subtitle: const Text('Create and add custom hymns'),
                  onTap: () {
                    Navigator.pushNamed(context, '/add-hymn');
                  },
                ),
              ],
            ),
          ),