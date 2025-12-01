import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/search_page_folder/recipe_preview/recipe_preview_widget.dart';
import '/index.dart';
import 'search_page_widget.dart' show SearchPageWidget;
import 'package:flutter/material.dart';

class SearchPageModel extends FlutterFlowModel<SearchPageWidget> {
  ///  Local state fields for this page.
  /// True - there exists a recipe.
  ///
  /// False - no recipe and show empty page
  bool recipeExists = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in SearchPage widget.
  List<RecipesRecord>? initialQ;
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in SearchField widget.
  RecipesRecord? recipeSearchByNameOut;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Models for recipePreview dynamic component.
  late FlutterFlowDynamicModels<RecipePreviewModel> recipePreviewModels;

  @override
  void initState(BuildContext context) {
    recipePreviewModels = FlutterFlowDynamicModels(() => RecipePreviewModel());
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    recipePreviewModels.dispose();
  }
}
