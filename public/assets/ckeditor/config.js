
CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...

  config.toolbar_mini = [
    { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
	   { name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
	{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
	{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote',
	'-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
	{ name: 'links', items : [ 'Link','Unlink','Anchor' ] },
	{ name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
	{ name: 'colors', items : [ 'TextColor','BGColor' ] }
  ];
  config.toolbar = "mini";
  config.height = 300;
  config.extraPlugins = 'wordcount', 'notification';
  config.wordcount = {

    // Whether or not you want to show the Word Count
    showParagraphs: true,
    showWordCount: true,

    // Whether or not you want to show the Char Count
    showCharCount: true,
    countSpacesAsChars: true,
    countHTML: true,

    // Maximum allowed Word Count
    maxWordCount: -1,

    // Maximum allowed Char Count
    maxCharCount: -1
  };
  // ... rest of the original config.js  ...
}
;
