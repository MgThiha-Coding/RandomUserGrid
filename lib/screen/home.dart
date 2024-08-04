import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notifier/notifier/notifier.dart'; // Import your notifier

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(dataProvider); // Your data provider
    final title = ref.watch(titleProvider); // Watch your title provider
   
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 28),
          ),
        ],
        title: Text(
          title, // Use the title from the provider
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            fontSize: 25,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      onPressed: () {
                        ref.read(titleProvider.notifier).updateTitle('Web Developer'); // Update title
                      },
                      child: Text(
                        'Web Developer',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      onPressed: () {
                        ref.read(titleProvider.notifier).updateTitle('Flutter'); // Update title
                      },
                      child: Text(
                        'Flutter',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      onPressed: () {
                        ref.read(titleProvider.notifier).updateTitle('Data Science'); // Update title
                      },
                      child: Text(
                        'Data Science',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      onPressed: () {
                        ref.read(titleProvider.notifier).updateTitle('Java Developer'); // Update title
                      },
                      child: Text(
                        'Java Developer',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      onPressed: () {
                        ref.read(titleProvider.notifier).updateTitle('Backend Developer'); // Update title
                      },
                      child: Text(
                        'Backend Developer',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextButton(
                      onPressed: () {
                        ref.read(titleProvider.notifier).updateTitle('UI UX'); // Update title
                      },
                      child: Text(
                        'UI UX',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: data.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 1;

                if (constraints.maxWidth > 1200) {
                  crossAxisCount = 3;
                } else if (constraints.maxWidth > 800) {
                  crossAxisCount = 2;
                }

                return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  padding: EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    final account = data[index];
                    final name = account.name;
                    final gender = account.gender;
                    final email = account.email;
                    final phone = account.phone;
                    final country = account.country;
                    final image = account.image;
                    final gendercolor = gender == "male" ? Colors.orange : Colors.blue;

                    return Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: NetworkImage(image),
                            ),
                            SizedBox(height: 20),
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              gender,
                              style: TextStyle(
                                fontSize: 20,
                                color: gendercolor,
                              ),
                            ),
                            SizedBox(height: 20),
                            Divider(),
                            ListTile(
                              leading: Icon(Icons.email, color: Colors.blue),
                              title: Text(
                                email,
                                style: TextStyle(
                                  fontSize: 19,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.phone, color: Colors.blue),
                              title: Text(
                                phone,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            ListTile(
                              leading: Icon(Icons.location_on, color: Colors.blue),
                              title: Text(
                                country,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
