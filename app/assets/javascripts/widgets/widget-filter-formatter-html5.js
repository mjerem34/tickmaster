!function(e){"use strict";var t=e.tablesorter||{},a=".compare-select",n=t.filterFormatter=e.extend({},t.filterFormatter,{addCompare:function(t,n,i){if(i.compare&&e.isArray(i.compare)&&i.compare.length>1){var l="",d=[a.slice(1)," "+a.slice(1),""],r=i.cellText?'<label class="'+d.join("-label")+n+'">'+i.cellText+"</label>":"";e.each(i.compare,function(e,t){l+="<option "+(i.selected===e?"selected":"")+">"+t+"</option>"}),t.wrapInner('<div class="'+d.join("-wrapper")+n+'" />').prepend(r+'<select class="'+d.join("")+n+'" />').find("select").append(l)}},updateCompare:function(t,n,i){var l=n.val()||"",d=l.replace(/\s*?[><=]\s*?/g,""),r=l.match(/[><=]/g)||"";return i.compare&&(e.isArray(i.compare)&&(r=(r||[]).join("")||i.compare[i.selected||0]),t.find(a).val(r)),[l,d]},html5Number:function(i,l,d){var r,c,o=e.extend({value:0,min:0,max:100,step:1,delayed:!0,disabled:!1,addToggle:!1,exactMatch:!1,cellText:"",compare:"",skipTest:!1},d),s=e('<input type="number" style="visibility:hidden;" value="test">').appendTo(i),p=o.skipTest||"number"===s.attr("type")&&"test"!==s.val(),u=[],f=i.closest("table")[0].config,m=function(t,n){var l=o.addToggle?i.find(".toggle").is(":checked"):!0,d=i.find(".number").val(),r=(e.isArray(o.compare)?i.find(a).val()||o.compare[o.selected||0]:o.compare)||"",s=f.$table[0].hasInitialized?(t?t:o.delayed)||"":!0;c.val(!o.addToggle||l?(r?r:o.exactMatch?"=":"")+d:"").trigger(n?"":"search",s).end().find(".number").val(d),i.find(".number").length&&(i.find(".number")[0].disabled=o.disabled||!l),u.length&&(u.find(".number").val(d)[0].disabled=o.disabled||!l,u.find(a).val(r),o.addToggle&&(u.find(".toggle")[0].checked=l))};return s.remove(),p&&(r=o.addToggle?'<div class="button"><input id="html5button'+l+'" type="checkbox" class="toggle" /><label for="html5button'+l+'"></label></div>':"",r+='<input class="number" type="number" min="'+o.min+'" max="'+o.max+'" value="'+o.value+'" step="'+o.step+'" />',i.append(r+'<input type="hidden" />').find(".toggle, .number").bind("change",function(){m()}).closest("thead").find("th[data-column="+l+"]").addClass("filter-parsed").closest("table").bind("filterReset",function(){e.isArray(o.compare)&&i.add(u).find(a).val(o.compare[o.selected||0]),o.addToggle&&(i.find(".toggle")[0].checked=!1,u.length&&(u.find(".toggle")[0].checked=!1)),i.find(".number").val(o.value),setTimeout(function(){m()},0)}),c=i.find("input[type=hidden]").bind("change",function(){i.find(".number").val(this.value),m()}),f.$table.bind("filterFomatterUpdate",function(){var e=n.updateCompare(i,c,o)[0]||o.value;i.find(".number").val(((e||"")+"").replace(/[><=]/g,"")),m(!1,!0),t.filter.formatterUpdated(i,l)}),o.compare&&(n.addCompare(i,l,o),i.find(a).bind("change",function(){m()})),f.$table.bind("stickyHeadersInit",function(){u=f.widgetOptions.$sticky.find(".tablesorter-filter-row").children().eq(l).empty(),u.append(r).find(".toggle, .number").bind("change",function(){i.find(".number").val(e(this).val()),m()}),o.compare&&(n.addCompare(u,l,o),u.find(a).bind("change",function(){i.find(a).val(e(this).val()),m()})),m()}),m()),p?i.find('input[type="hidden"]'):e('<input type="search">')},html5Range:function(i,l,d){var r,c=e.extend({value:0,min:0,max:100,step:1,delayed:!0,valueToHeader:!0,exactMatch:!0,cellText:"",compare:"",allText:"all",skipTest:!1},d),o=e('<input type="range" style="visibility:hidden;" value="test">').appendTo(i),s=c.skipTest||"range"===o.attr("type")&&"test"!==o.val(),p=[],u=i.closest("table")[0].config,f=function(t,n,d){t=("undefined"==typeof t?r.val():t).toString().replace(/[<>=]/g,"")||c.value;var o=(e.isArray(c.compare)?i.find(a).val()||c.compare[c.selected||0]:c.compare)||"",s=" ("+(o?o+t:t==c.min?c.allText:t)+")",f=u.$table[0].hasInitialized?(n?n:c.delayed)||"":!0;i.find("input[type=hidden]").val(o?o+t:t==c.min?"":(c.exactMatch?"=":"")+t).trigger(d?"":"search",f).end().find(".range").val(t),i.closest("thead").find("th[data-column="+l+"]").find(".curvalue").html(s),p.length&&(p.find(".range").val(t).end().find(a).val(o),p.closest("thead").find("th[data-column="+l+"]").find(".curvalue").html(s))};return o.remove(),s&&(i.html('<input type="hidden"><input class="range" type="range" min="'+c.min+'" max="'+c.max+'" value="'+c.value+'" />').closest("thead").find("th[data-column="+l+"]").addClass("filter-parsed").find(".tablesorter-header-inner").append('<span class="curvalue" />'),r=i.find("input[type=hidden]").bind("change"+u.namespace+"filter",function(){var t=this.value,n=(e.isArray(c.compare)?i.find(a).val()||c.compare[c.selected||0]:c.compare)||"";t!==this.lastValue&&(this.lastValue=n?n+t:t==c.min?"":(c.exactMatch?"=":"")+t,this.value=this.lastValue,f(t))}),i.find(".range").bind("change",function(){f(this.value)}),u.$table.bind("filterFomatterUpdate",function(){var e=n.updateCompare(i,r,c)[0];i.find(".range").val(e),f(e,!1,!0),t.filter.formatterUpdated(i,l)}),c.compare&&(n.addCompare(i,l,c),i.find(a).bind("change",function(){f()})),u.$table.bind("stickyHeadersInit",function(){p=u.widgetOptions.$sticky.find(".tablesorter-filter-row").children().eq(l).empty(),p.html('<input class="range" type="range" min="'+c.min+'" max="'+c.max+'" value="'+c.value+'" />').find(".range").bind("change",function(){f(p.find(".range").val())}),f(),c.compare&&(n.addCompare(p,l,c),p.find(a).bind("change",function(){i.find(a).val(e(this).val()),f()}))}),i.closest("table").bind("filterReset",function(){e.isArray(c.compare)&&i.add(p).find(a).val(c.compare[c.selected||0]),setTimeout(function(){f(c.value,!1,!0)},0)}),f()),s?i.find('input[type="hidden"]'):e('<input type="search">')},html5Color:function(a,n,i){var l,d,r=e.extend({value:"#000000",disabled:!1,addToggle:!0,exactMatch:!0,valueToHeader:!1,skipTest:!1},i),c=e('<input type="color" style="visibility:hidden;" value="test">').appendTo(a),o=r.skipTest||"color"===c.attr("type")&&"test"!==c.val(),s=[],p=a.closest("table")[0].config,u=function(e,t){e=("undefined"==typeof e?d.val():e).toString().replace("=","")||r.value;var i=!0,l=" ("+e+")";r.addToggle&&(i=a.find(".toggle").is(":checked")),a.find(".colorpicker").length&&(a.find(".colorpicker").val(e)[0].disabled=r.disabled||!i),d.val(i?e+(r.exactMatch?"=":""):"").trigger(!p.$table[0].hasInitialized||t?"":"search"),r.valueToHeader?a.closest("thead").find("th[data-column="+n+"]").find(".curcolor").html(l):a.find(".currentColor").html(l),s.length&&(s.find(".colorpicker").val(e)[0].disabled=r.disabled||!i,r.addToggle&&(s.find(".toggle")[0].checked=i),r.valueToHeader?s.closest("thead").find("th[data-column="+n+"]").find(".curcolor").html(l):s.find(".currentColor").html(l))};return c.remove(),o&&(l=""+n+Math.round(100*Math.random()),l='<div class="color-controls-wrapper">'+(r.addToggle?'<div class="button"><input id="colorbutton'+l+'" type="checkbox" class="toggle" /><label for="colorbutton'+l+'"></label></div>':"")+'<input type="hidden"><input class="colorpicker" type="color" />'+(r.valueToHeader?"":'<span class="currentColor">(#000000)</span>')+"</div>",a.html(l),r.valueToHeader&&a.closest("thead").find("th[data-column="+n+"]").find(".tablesorter-header-inner").append('<span class="curcolor" />'),a.find(".toggle, .colorpicker").bind("change",function(){u(a.find(".colorpicker").val())}),d=a.find("input[type=hidden]").bind("change"+p.namespace+"filter",function(){u(this.value)}),p.$table.bind("filterFomatterUpdate",function(){u(d.val(),!0),t.filter.formatterUpdated(a,n)}),a.closest("table").bind("filterReset",function(){r.addToggle&&(a.find(".toggle")[0].checked=!1),setTimeout(function(){u()},0)}),p.$table.bind("stickyHeadersInit",function(){s=p.widgetOptions.$sticky.find(".tablesorter-filter-row").children().eq(n),s.html(l).find(".toggle, .colorpicker").bind("change",function(){u(s.find(".colorpicker").val())}),u(s.find(".colorpicker").val())}),u(r.value)),o?a.find('input[type="hidden"]'):e('<input type="search">')}})}(jQuery);
