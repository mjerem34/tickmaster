!function(t){"use strict";var e=t.tablesorter,i=function(e){var i,a,s,o,n,c=e.config;c&&(a=c.widgetOptions,c.$tbodies.each(function(){i=t(this).children(),n=i.length,i.filter(a.staticRow_class).each(function(){i=t(this),o=i.data(a.staticRow_index),"undefined"!=typeof o?(s=parseFloat(o),o=/%/.test(o)?Math.round(s/100*n):s):o=i.index(),i.data(a.staticRow_data,o)})}))};e.addWidget({id:"staticRow",options:{staticRow_class:".static",staticRow_data:"static-index",staticRow_index:"row-index",staticRow_event:"staticRowsRefresh"},init:function(t,a,s,o){i(t),s.$table.unbind(("updateComplete.tsstaticrows "+o.staticRow_event).replace(/\s+/g," ")).bind("updateComplete.tsstaticrows "+o.staticRow_event,function(){i(t),e.applyWidget(t)})},format:function(e,i,a){var s,o,n,c,d,r,l,p;i.$tbodies.each(function(){for(d=t.tablesorter.processTbody(e,t(this),!0),r=!0,n=0,l=d.children(a.staticRow_class),c=d.children("tr").length-1,p=l.length;r&&p>n;)r=!1,l.each(function(){s=t(this).data(a.staticRow_data),s=s>=c?c:0>s?0:s,s!==t(this).index()&&(r=!0,o=t(this).detach(),s>=c?o.appendTo(d):0===s?o.prependTo(d):o.insertBefore(d.find("tr:eq("+s+")")))}),n++;t.tablesorter.processTbody(e,d,!1)}),i.$table.triggerHandler("staticRowsComplete",e)},remove:function(t,e,i){e.$table.unbind(("updateComplete.tsstaticrows "+i.staticRow_event).replace(/\s+/g," "))}})}(jQuery);
