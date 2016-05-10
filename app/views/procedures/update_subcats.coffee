$("#procedure_sous_category_id").empty().html("<%= escape_javascript(options_for_select(@sous_categories.collect{|sous_category| [sous_category.name.titleize, sous_category.id]}))%>");
