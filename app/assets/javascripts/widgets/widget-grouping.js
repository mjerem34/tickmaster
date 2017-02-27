!function(r){"use strict";var o=r.tablesorter,e=o.grouping={types:{number:function(r,e,u,p){var t,a=e.hasClass(o.css.sortAsc);return p>1&&""!==u?(t=a?Math.floor(parseFloat(u)/p)*p:Math.ceil(parseFloat(u)/p)*p,t+=" - "+(t+(p-1)*(a?1:-1))):t=parseFloat(u)||u,t},separator:function(o,e,u,p){var t=(u+"").split(o.widgetOptions.group_separator);return r.trim(t[p-1]||"")},text:function(r,o,e){return e},word:function(r,o,e,u){var p=(e+" ").match(/\w+/g)||[];return p[u-1]||""},letter:function(r,o,e,u){return e?(e+" ").substring(0,u):""},date:function(r,o,u,p,t){var a,n,s=r.widgetOptions,g=new Date(u||"");return g instanceof Date&&isFinite(g)?(a=g.getFullYear(),n=e.findMonth(s,g.getMonth()),"year"===p?a:"month"===p?n:"monthyear"===p?n+" "+a:"day"===p?n+" "+g.getDate():"week"===p?e.findWeek(s,g.getDay()):"time"===p?e.findTime(s,g):s.group_dateString(g,r,o)):s.group_dateInvalid}},findMonth:function(r,o){return r.group_months[o+(""===(r.group_months[0]||"")?1:0)]},findWeek:function(o,e){if(r.isArray(o.group_week))return o.group_week[e];if(!r.isEmptyObject(o.group_week)){var u=["sun","mon","tue","wed","thu","fri","sat"];return o.group_week[u[e]]}},findTime:function(r,o){var e,u=r.group_time.am&&r.group_time.pm,p=o.getHours(),t=p>=12?1:0,a=r.group_time24Hour&&p>12?p-12:r.group_time24Hour&&0===p?p+12:p,n=("00"+a).slice(-2),s=("00"+o.getMinutes()).slice(-2);return e=r.group_time[u?["am","pm"][t]:t],n+":"+s+(r.group_time24Hour?"":" "+(e||""))},update:function(o,u,p){if(!r.isEmptyObject(u.cache)){var t="undefined"!=typeof u.sortList[0],a={},n=r.isArray(p.group_forceColumn)&&"undefined"!=typeof p.group_forceColumn[0]?p.group_enforceSort&&!t?-1:p.group_forceColumn[0]:t?u.sortList[0][0]:-1;u.$table.find("tr.group-hidden").removeClass("group-hidden").end().find("tr.group-header").remove(),p.group_collapsible&&u.$table.data("pagerSavedHeight",0),n>=0&&n<u.columns&&!u.$headerIndexed[n].hasClass("group-false")&&(p.group_collapsedGroup="",p.group_collapsedGroups={},a.column=n,a.groupClass=(u.$headerIndexed[n].attr("class")||"").match(/(group-\w+(-\w+)?)/g),a.grouping=a.groupClass?a.groupClass[0].split("-"):["group","letter",1],a.savedGroup=e.saveCurrentGrouping(u,p,a),e.findColumnGroups(u,p,a),e.processHeaders(u,p,a),u.$table.triggerHandler(p.group_complete))}},processHeaders:function(o,e,u){var p,t,a,n,s,g,l=o.$table.find("tr.group-header"),i=l.length;for(l.bind("selectstart",!1),p=0;i>p;p++)g=l.eq(p),s=g.nextUntil("tr.group-header").filter(":visible"),(e.group_count||r.isFunction(e.group_callback))&&(a=g.find(".group-count"),a.length&&(e.group_count&&a.html(e.group_count.replace(/\{num\}/g,s.length)),r.isFunction(e.group_callback)&&e.group_callback(g.find("td"),s,u.column,o.table))),e.group_saveGroups&&!r.isEmptyObject(e.group_collapsedGroups)&&e.group_collapsedGroups[e.group_collapsedGroup].length?(n=g.find(".group-name").text().toLowerCase()+g.attr("data-group-index"),t=r.inArray(n,e.group_collapsedGroups[e.group_collapsedGroup])>-1,g.toggleClass("collapsed",t),s.toggleClass("group-hidden",t)):e.group_collapsed&&e.group_collapsible&&(g.addClass("collapsed"),s.addClass("group-hidden"))},groupHeaderHTML:function(r,o,e){return'<tr class="group-header '+r.selectorRemove.slice(1)+'" unselectable="on" '+(r.tabIndex?'tabindex="0" ':"")+'data-group-index="'+e.groupIndex++ +'"><td colspan="'+r.columns+'">'+(o.group_collapsible?"<i/>":"")+'<span class="group-name">'+e.currentGroup+'</span><span class="group-count"></span></td></tr>'},saveCurrentGrouping:function(r,e,u){var p,t,a=!1;return e.group_collapsible&&e.group_saveGroups&&o.storage&&(e.group_collapsedGroups=o.storage(r.table,"tablesorter-groups")||{},t="dir"+r.sortList[0][1],p=e.group_collapsedGroup=""+r.sortList[0][0]+t+u.grouping.join(""),e.group_collapsedGroups[p]?a=!0:e.group_collapsedGroups[p]=[]),a},findColumnGroups:function(r,u,p){var t,a,n,s,g=o.hasWidget(r.table,"pager");for(p.groupIndex=0,t=0;t<r.$tbodies.length;t++)for(a=r.cache[t].normalized,p.group="",n=g?r.pager.startRow-1:0,s=g?r.pager.endRow:a.length;s>n;n++)p.rowData=a[n],p.$row=p.rowData[r.columns].$row,p.$row.is(":visible")&&e.types[p.grouping[1]]&&e.insertGroupHeader(r,u,p)},insertGroupHeader:function(o,u,p){var t=o.$headerIndexed[p.column],a=p.rowData[p.column],n=/date/.test(p.groupClass)?p.grouping[2]:parseInt(p.grouping[2]||1,10)||1;p.currentGroup=p.rowData?e.types[p.grouping[1]](o,t,a,n,p.group):p.currentGroup,p.group!==p.currentGroup&&(p.group=p.currentGroup,r.isFunction(u.group_formatter)&&(p.currentGroup=u.group_formatter((p.group||"").toString(),p.column,o.table,o,u,p)||p.group),p.$row.before(e.groupHeaderHTML(o,u,p)),u.group_saveGroups&&!p.savedGroup&&u.group_collapsed&&u.group_collapsible&&u.group_collapsedGroups[u.group_collapsedGroup].push(p.currentGroup))},bindEvents:function(u,p,t){t.group_collapsible&&(t.group_collapsedGroups=[],p.$table.on("click toggleGroup keyup","tr.group-header",function(e){if(e.stopPropagation(),"keyup"!==e.type||13===e.which){var a,n,s,g=r(this),l=g.find(".group-name").text().toLowerCase()+g.attr("data-group-index");!e.shiftKey||"click"!==e.type&&"keyup"!==e.type||g.siblings(".group-header").trigger("toggleGroup"),g.toggleClass("collapsed"),g.nextUntil("tr.group-header").toggleClass("group-hidden",g.hasClass("collapsed")),t.group_saveGroups&&o.storage&&(n=p.$table.find(".group-header"),a=g.hasClass("collapsed"),t.group_collapsedGroups[t.group_collapsedGroup]||(t.group_collapsedGroups[t.group_collapsedGroup]=[]),a&&t.group_collapsedGroup?t.group_collapsedGroups[t.group_collapsedGroup].push(l):t.group_collapsedGroup&&(s=r.inArray(l,t.group_collapsedGroups[t.group_collapsedGroup]),s>-1&&t.group_collapsedGroups[t.group_collapsedGroup].splice(s,1)),o.storage(u,"tablesorter-groups",t.group_collapsedGroups))}})),r(t.group_saveReset).on("click",function(){e.clearSavedGroups(u)}),p.$table.on("pagerChange.tsgrouping",function(){e.update(u,p,t)})},clearSavedGroups:function(r){r&&o.storage&&(o.storage(r,"tablesorter-groups",""),e.update(r,r.config,r.config.widgetOptions))}};o.addWidget({id:"group",priority:100,options:{group_collapsible:!0,group_collapsed:!1,group_saveGroups:!0,group_saveReset:null,group_count:" ({num})",group_separator:"-",group_formatter:null,group_callback:null,group_complete:"groupingComplete",group_forceColumn:[],group_enforceSort:!0,group_checkbox:["checked","unchecked"],group_months:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],group_week:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],group_time:["AM","PM"],group_time24Hour:!1,group_dateInvalid:"Invalid Date",group_dateString:function(r){return r.toLocaleString()}},init:function(r,o,u,p){e.bindEvents(r,u,p)},format:function(r,o,u){e.update(r,o,u)},remove:function(r,o,e){o.$table.off("click","tr.group-header").off("pagerChange.tsgrouping").find(".group-hidden").removeClass("group-hidden").end().find("tr.group-header").remove()}})}(jQuery);
