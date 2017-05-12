!function(e){"use strict";var o=e.tablesorter||{};o.themes={bootstrap:{table:"table table-bordered table-striped",caption:"caption",header:"bootstrap-header",sortNone:"",sortAsc:"",sortDesc:"",active:"",hover:"",icons:"",iconSortNone:"bootstrap-icon-unsorted",iconSortAsc:"icon-chevron-up glyphicon glyphicon-chevron-up",iconSortDesc:"icon-chevron-down glyphicon glyphicon-chevron-down",filterRow:"",footerRow:"",footerCells:"",even:"",odd:""},jui:{table:"ui-widget ui-widget-content ui-corner-all",caption:"ui-widget-content",header:"ui-widget-header ui-corner-all ui-state-default",sortNone:"",sortAsc:"",sortDesc:"",active:"ui-state-active",hover:"ui-state-hover",icons:"ui-icon",iconSortNone:"ui-icon-carat-2-n-s",iconSortAsc:"ui-icon-carat-1-n",iconSortDesc:"ui-icon-carat-1-s",filterRow:"",footerRow:"",footerCells:"",even:"ui-widget-content",odd:"ui-state-default"}},e.extend(o.css,{wrapper:"tablesorter-wrapper"}),o.addWidget({id:"uitheme",priority:10,format:function(s,t,r){var a,i,n,c,l,d,h,m,p,u,v,f,b=o.themes,C=t.$table.add(e(t.namespace+"_extra_table")),w=t.$headers.add(e(t.namespace+"_extra_headers")),g=t.theme||"jui",S=b[g]||{},j=e.trim([S.sortNone,S.sortDesc,S.sortAsc,S.active].join(" ")),D=e.trim([S.iconSortNone,S.iconSortDesc,S.iconSortAsc].join(" "));for(t.debug&&(c=new Date),C.hasClass("tablesorter-"+g)&&t.theme===t.appliedTheme&&r.uitheme_applied||(r.uitheme_applied=!0,p=b[t.appliedTheme]||{},f=!e.isEmptyObject(p),u=f?[p.sortNone,p.sortDesc,p.sortAsc,p.active].join(" "):"",v=f?[p.iconSortNone,p.iconSortDesc,p.iconSortAsc].join(" "):"",f&&(r.zebra[0]=e.trim(" "+r.zebra[0].replace(" "+p.even,"")),r.zebra[1]=e.trim(" "+r.zebra[1].replace(" "+p.odd,"")),t.$tbodies.children().removeClass([p.even,p.odd].join(" "))),S.even&&(r.zebra[0]+=" "+S.even),S.odd&&(r.zebra[1]+=" "+S.odd),C.children("caption").removeClass(p.caption||"").addClass(S.caption),h=C.removeClass((t.appliedTheme?"tablesorter-"+(t.appliedTheme||""):"")+" "+(p.table||"")).addClass("tablesorter-"+g+" "+(S.table||"")).children("tfoot"),t.appliedTheme=t.theme,h.length&&h.children("tr").removeClass(p.footerRow||"").addClass(S.footerRow).children("th, td").removeClass(p.footerCells||"").addClass(S.footerCells),w.removeClass((f?[p.header,p.hover,u].join(" "):"")||"").addClass(S.header).not(".sorter-false").unbind("mouseenter.tsuitheme mouseleave.tsuitheme").bind("mouseenter.tsuitheme mouseleave.tsuitheme",function(o){e(this)["mouseenter"===o.type?"addClass":"removeClass"](S.hover||"")}),w.each(function(){var s=e(this);s.find("."+o.css.wrapper).length||s.wrapInner('<div class="'+o.css.wrapper+'" style="position:relative;height:100%;width:100%"></div>')}),t.cssIcon&&w.find("."+o.css.icon).removeClass(f?[p.icons,v].join(" "):"").addClass(S.icons||""),C.hasClass("hasFilters")&&C.children("thead").children("."+o.css.filterRow).removeClass(f?p.filterRow||"":"").addClass(S.filterRow||"")),a=0;a<t.columns;a++)l=t.$headers.add(e(t.namespace+"_extra_headers")).not(".sorter-false").filter('[data-column="'+a+'"]'),d=o.css.icon?l.find("."+o.css.icon):e(),m=w.not(".sorter-false").filter('[data-column="'+a+'"]:last'),m.length&&(l.removeClass(j),d.removeClass(D),m[0].sortDisabled?d.removeClass(S.icons||""):(i=S.sortNone,n=S.iconSortNone,m.hasClass(o.css.sortAsc)?(i=[S.sortAsc,S.active].join(" "),n=S.iconSortAsc):m.hasClass(o.css.sortDesc)&&(i=[S.sortDesc,S.active].join(" "),n=S.iconSortDesc),l.addClass(i),d.addClass(n||"")));t.debug&&console.log("Applying "+g+" theme"+o.benchmark(c))},remove:function(e,s,t,r){if(t.uitheme_applied){var a=s.$table,i=s.appliedTheme||"jui",n=o.themes[i]||o.themes.jui,c=a.children("thead").children(),l=n.sortNone+" "+n.sortDesc+" "+n.sortAsc,d=n.iconSortNone+" "+n.iconSortDesc+" "+n.iconSortAsc;a.removeClass("tablesorter-"+i+" "+n.table),t.uitheme_applied=!1,r||(a.find(o.css.header).removeClass(n.header),c.unbind("mouseenter.tsuitheme mouseleave.tsuitheme").removeClass(n.hover+" "+l+" "+n.active).filter("."+o.css.filterRow).removeClass(n.filterRow),c.find("."+o.css.icon).removeClass(n.icons+" "+d))}}})}(jQuery);
