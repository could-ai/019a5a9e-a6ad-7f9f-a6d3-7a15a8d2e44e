      body: Column(
        children: [
          // Search Bar
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFDAA520),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Search hymn by number or title...',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w300,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFFDAA520),
                    ),
                    suffixIcon: _searchQuery.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              setState(() {
                                _searchQuery = '';
                              });
                            },
                          )
                        : IconButton(
                            icon: const Icon(Icons.mic_outlined),
                            color: const Color(0xFFDAA520),
                            onPressed: () {
                              // TODO: Implement voice search
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Voice search coming soon!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Theme Filters
          ThemeFilterChips(
            selectedTheme: _selectedTheme,
            onThemeSelected: (theme) {
              setState(() {
                _selectedTheme = theme == _selectedTheme ? null : theme;
              });
            },
          ),

          // Hymn List
          Expanded(
            child: Consumer<HymnProvider>(
              builder: (context, hymnProvider, child) {
                List<Hymn> hymns = hymnProvider.getFilteredHymns(
                  searchQuery: _searchQuery,
                  theme: _selectedTheme,
                );

                if (hymns.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(
                        Icons.search_off,
                        size: 80,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No hymns found',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: hymns.length,
                  itemBuilder: (context, index) {
                    final hymn = hymns[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: HymnListItem(
                        hymn: hymn,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HymnReadingScreen(hymn: hymn),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),