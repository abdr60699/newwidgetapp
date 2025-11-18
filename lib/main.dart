import 'package:flutter/material.dart';
import 'sharedwidget/cards/reusable_info_card.dart';
import 'sharedwidget/cards/reusable_stat_card.dart';
import 'sharedwidget/feedback/reusable_empty_state.dart';
import 'sharedwidget/feedback/reusable_error_view.dart';
import 'sharedwidget/feedback/reusable_progress_indicator.dart';
import 'sharedwidget/navigation/reusable_app_bar.dart';
import 'sharedwidget/navigation/reusable_bottom_nav_bar.dart';
import 'sharedwidget/shared_widgets.dart';

void main() {
  runApp(const ReusableWidgetsApp());
}

class ReusableWidgetsApp extends StatelessWidget {
  const ReusableWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reusable Widgets Library',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WidgetCatalogScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WidgetCatalogScreen extends StatelessWidget {
  const WidgetCatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      WidgetCategory(
        name: 'Basic',
        icon: Icons.widgets,
        color: Colors.blue,
        builder: (context) => const BasicWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Buttons',
        icon: Icons.touch_app,
        color: Colors.green,
        builder: (context) => const ButtonWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Forms',
        icon: Icons.edit_note,
        color: Colors.cyan,
        builder: (context) => const FormWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Cards',
        icon: Icons.credit_card,
        color: Colors.orange,
        builder: (context) => const CardWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Dialogs',
        icon: Icons.open_in_new,
        color: Colors.indigo,
        builder: (context) => const DialogWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Effects',
        icon: Icons.blur_on,
        color: Colors.pink,
        builder: (context) => const EffectWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Feedback',
        icon: Icons.feedback,
        color: Colors.amber,
        builder: (context) => const FeedbackWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Layout',
        icon: Icons.view_quilt,
        color: Colors.deepPurple,
        builder: (context) => const LayoutWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Media',
        icon: Icons.perm_media,
        color: Colors.deepOrange,
        builder: (context) => const MediaWidgetsDemo(),
      ),
      WidgetCategory(
        name: 'Navigation',
        icon: Icons.navigation,
        color: Colors.lightBlue,
        builder: (context) => const NavigationWidgetsDemo(),
      ),
    ];

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reusable Widgets Catalog'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: TabBar(
            isScrollable: true,
            tabs: categories
                .map((cat) => Tab(
                      icon: Icon(cat.icon),
                      text: cat.name,
                    ))
                .toList(),
          ),
        ),
        body: TabBarView(
          children: categories.map((cat) => cat.builder(context)).toList(),
        ),
      ),
    );
  }
}

class WidgetCategory {
  final String name;
  final IconData icon;
  final Color color;
  final Widget Function(BuildContext) builder;

  WidgetCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.builder,
  });
}

// Demo sections for each category
class BasicWidgetsDemo extends StatelessWidget {
  const BasicWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableBadge',
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ReusableBadge(
                count: 5,
                child: Icon(Icons.shopping_cart, size: 40),
              ),
              ReusableBadge(
                label: 'NEW',
                badgeColor: Colors.green,
                child: Icon(Icons.mail, size: 40),
              ),
              ReusableBadge(
                count: 99,
                child: Icon(Icons.notifications, size: 40),
              ),
            ],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableAvatar',
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ReusableAvatar(
                initials: 'JD',
                radius: 30,
                backgroundColor: Colors.blue,
                status: AvatarStatus.online,
              ),
              ReusableAvatar(
                initials: 'JS',
                radius: 30,
                backgroundColor: Colors.purple,
                status: AvatarStatus.away,
              ),
              ReusableAvatar(
                initials: 'BW',
                radius: 30,
                backgroundColor: Colors.orange,
                status: AvatarStatus.offline,
              ),
            ],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableDivider',
          child: const Column(
            children: [
              Text('Section 1'),
              ReusableDivider(thickness: 2, color: Colors.grey),
              SizedBox(height: 8),
              Text('Section 2'),
              ReusableDivider(thickness: 2, color: Colors.blue, isDashed: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class ButtonWidgetsDemo extends StatelessWidget {
  const ButtonWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableElevatedButton',
          child: Column(
            children: [
              ReusableElevatedButton(
                label: 'Primary Button',
                onPressed: () {},
              ),
              const SizedBox(height: 8),
              const ReusableElevatedButton(
                label: 'Disabled Button',
                enabled: false,
              ),
            ],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableIconButton',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ReusableIconButton(
                icon: Icons.favorite,
                onPressed: () {},
                backgroundColor: Colors.red.shade50,
                iconColor: Colors.red,
              ),
              ReusableIconButton(
                icon: Icons.share,
                onPressed: () {},
                backgroundColor: Colors.blue.shade50,
                iconColor: Colors.blue,
              ),
              ReusableIconButton(
                icon: Icons.download,
                onPressed: () {},
                backgroundColor: Colors.green.shade50,
                iconColor: Colors.green,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class FormWidgetsDemo extends StatefulWidget {
  const FormWidgetsDemo({super.key});

  @override
  State<FormWidgetsDemo> createState() => _FormWidgetsDemoState();
}

class _FormWidgetsDemoState extends State<FormWidgetsDemo> {
  String? selectedValue;
  double sliderValue = 50;
  double ratingValue = 3.0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableTextFormField',
          child: const ReusableTextFormField(
            label: 'Email Address',
            hintText: 'Enter your email',
            prefixIcon: Icon(Icons.email),
          ),
        ),
        _buildDemoSection(
          title: 'ReuabelDropdown',
          child: ReuabelDropdown<String>(
            labelText: 'Select Country',
            initialValue: selectedValue,
            items: const ['USA', 'Canada', 'UK', 'Australia'],
            onChanged: (value) => setState(() => selectedValue = value),
          ),
        ),
        _buildDemoSection(
          title: 'ReusableSliderInput',
          child: ReusableSliderInput(
            label: 'Volume',
            value: sliderValue,
            min: 0,
            max: 100,
            onChanged: (value) => setState(() => sliderValue = value),
          ),
        ),
        _buildDemoSection(
          title: 'ReusableRating',
          child: ReusableRating(
            rating: ratingValue,
            readOnly: false,
            onChanged: (value) => setState(() => ratingValue = value),
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class CardWidgetsDemo extends StatelessWidget {
  const CardWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableInfoCard',
          child: const ReusableInfoCard(
            title: 'Information',
            subtitle: 'This is an informational card',
            leading: Icon(Icons.info, color: Colors.blue, size: 40),
          ),
        ),
        _buildDemoSection(
          title: 'ReusableStatCard',
          child: const Row(
            children: [
              Expanded(
                child: ReusableStatCard(
                  title: 'Users',
                  value: '1,234',
                  icon: Icons.people,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: ReusableStatCard(
                  title: 'Sales',
                  value: '\$45K',
                  icon: Icons.shopping_bag,
                ),
              ),
            ],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableProgressCard',
          child: const ReusableProgressCard(
            title: 'Project Progress',
            progress: 0.65,
            // subtitle: '65% Complete',
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class DialogWidgetsDemo extends StatelessWidget {
  const DialogWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableConfirmationDialog',
          child: ElevatedButton(
            onPressed: () async {
              final result = await ReusableConfirmationDialog.showConfirm(
                context: context,
                title: 'Confirm Action',
                message: 'Are you sure you want to proceed?',
              );
              if (result == true && context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Confirmed!')),
                );
              }
            },
            child: const Text('Show Confirmation Dialog'),
          ),
        ),
        _buildDemoSection(
          title: 'Custom Dialog',
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Custom Dialog'),
                  content: const Text('This is a custom dialog example'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Show Custom Dialog'),
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class EffectWidgetsDemo extends StatelessWidget {
  const EffectWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'GlassMorphism',
          child: SizedBox(
            height: 150,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple, Colors.blue],
                    ),
                  ),
                ),
                Center(
                  child: ReusableGlassMorphism(
                    blur: 10,
                    tint: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        'Glass Effect',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        _buildDemoSection(
          title: 'GradientContainer',
          child: const ReusableGradientContainer(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.red],
            ),
            padding: EdgeInsets.all(20),
            child: Text(
              'Gradient Background',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        _buildDemoSection(
          title: 'NeuMorphism',
          child: const Center(
            child: ReusableNeuMorphism(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Center(child: Text('Neumorphic')),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class FeedbackWidgetsDemo extends StatelessWidget {
  const FeedbackWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableProgressIndicator',
          child: const Column(
            children: [
              ReusableProgressIndicator(circular: true, size: 50),
              SizedBox(height: 16),
              ReusableProgressIndicator(
                  circular: true, size: 50, color: Colors.green),
              SizedBox(height: 16),
              ReusableProgressIndicator(value: 0.7, height: 10),
            ],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableEmptyState',
          child: const ReusableEmptyState(
            title: 'No items found',
            subtitle: 'Try adding some items',
            icon: Icons.inbox,
          ),
        ),
        _buildDemoSection(
          title: 'ReusableErrorView',
          child: ReusableErrorView(
            title: 'Error',
            message: 'Something went wrong',
            onRetry: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class LayoutWidgetsDemo extends StatelessWidget {
  const LayoutWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableStepper',
          child: ReusableStepper(
            currentStep: 1,
            steps: [
              StepItem(title: 'Step 1', subtitle: 'First step'),
              StepItem(title: 'Step 2', subtitle: 'Second step'),
              StepItem(title: 'Step 3', subtitle: 'Third step'),
            ],
          ),
        ),
        _buildDemoSection(
          title: 'ReusableExpansionPanelList',
          child: ReusableExpansionPanelList(
            items: [
              ReusableExpansionPanelItem(
                header: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Panel 1',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                body: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Content of panel 1'),
                ),
              ),
              ReusableExpansionPanelItem(
                header: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Panel 2',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                body: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text('Content of panel 2'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class MediaWidgetsDemo extends StatelessWidget {
  const MediaWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableImage.network',
          child: const ReusableImage.network(
            'https://picsum.photos/300/200',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        _buildDemoSection(
          title: 'ReusableAudioPlayer',
          child: const ReusableAudioPlayer(
            url:
                'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
          ),
        ),
        _buildDemoSection(
          title: 'ReusableQRGenerator',
          child: const Center(
            child: ReusableQRGenerator(
              data: 'https://flutter.dev',
              size: 200,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class NavigationWidgetsDemo extends StatelessWidget {
  const NavigationWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildDemoSection(
          title: 'ReusableAppBar',
          child: Container(
            height: 60,
            color: Colors.blue,
            child: const ReusableAppBar(
              titleText: 'App Bar Demo',
              leading: Icon(Icons.menu, color: Colors.white),
              actions: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 16),
                Icon(Icons.more_vert, color: Colors.white),
                SizedBox(width: 8),
              ],
            ),
          ),
        ),
        _buildDemoSection(
          title: 'ReusableBottomNavBar',
          child: ReusableBottomNavBar(
            currentIndex: 0,
            items: [
              NavBarItem(icon: Icons.home, label: 'Home'),
              NavBarItem(icon: Icons.search, label: 'Search'),
              NavBarItem(icon: Icons.person, label: 'Profile'),
            ],
            onTap: (index) {},
          ),
        ),
      ],
    );
  }

  Widget _buildDemoSection({required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}
