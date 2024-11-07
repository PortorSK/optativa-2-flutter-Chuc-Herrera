import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<String> categories = [];
  bool isLoading = true;
  bool hasError = false;

  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final fetchedCategories = await apiService.fetchCategories();
      setState(() {
        categories = fetchedCategories;
        isLoading = false;
        hasError = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorias'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(child: Text('Error al cargar las categorías'))
              : ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(Icons.category, color: index % 2 == 0 ? Colors.blue : Colors.red),
                      title: Text(categories[index]),
                      onTap: () {
                        // Acción al presionar cada categoría
                      },
                    );
                  },
                ),
    );
  }
}

