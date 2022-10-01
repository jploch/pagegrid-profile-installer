CKEDITOR.skin.name = "lightwire";
CKEDITOR.skin.ua_editor = "ie,iequirks,ie7,ie8,gecko";
CKEDITOR.skin.ua_dialog = "ie,iequirks,ie7,ie8,opera";
CKEDITOR.skin.chameleon = function () {
  var a = function () {
      return function (g, l) {
        for (var i = g.match(/[^#]./g), n = 0; 3 > n; n++) {
          var k = i
            , j = n
            , m;
          m = parseInt(i[n], 16);
          m = ("0" + (0 > l ? 0 | m * (1 + l) : 0 | m + (255 - m) * l).toString(16)).slice(-2);
          k[j] = m
        }
        return "#" + i.join("")
      }
    }()
    , e = function () {
      var c = new CKEDITOR.template("background:#{to};background-image:-webkit-gradient(linear,lefttop,leftbottom,from({from}),to({to}));background-image:-moz-linear-gradient(top,{from},{to});background-image:-webkit-linear-gradient(top,{from},{to});background-image:-o-linear-gradient(top,{from},{to});background-image:-ms-linear-gradient(top,{from},{to});background-image:linear-gradient(top,{from},{to});filter:progid:DXImageTransform.Microsoft.gradient(gradientType=0,startColorstr='{from}',endColorstr='{to}');");
      return function (f, b) {
        return c.output({
          from: f
          , to: b
        })
      }
    }()
    , d = {
      editor: new CKEDITOR.template("{id}.cke_chrome [border-color:{defaultBorder};] {id} .cke_top [ {defaultGradient}border-bottom-color:{defaultBorder};] {id} .cke_bottom [{defaultGradient}border-top-color:{defaultBorder};] {id} .cke_resizer [border-right-color:{ckeResizer}] {id} .cke_dialog_title [{defaultGradient}border-bottom-color:{defaultBorder};] {id} .cke_dialog_footer [{defaultGradient}outline-color:{defaultBorder};border-top-color:{defaultBorder};] {id} .cke_dialog_tab [{lightGradient}border-color:{defaultBorder};] {id} .cke_dialog_tab:hover [{mediumGradient}] {id} .cke_dialog_contents [border-top-color:{defaultBorder};] {id} .cke_dialog_tab_selected, {id} .cke_dialog_tab_selected:hover [background:{dialogTabSelected};border-bottom-color:{dialogTabSelectedBorder};] {id} .cke_dialog_body [background:{dialogBody};border-color:{defaultBorder};] {id} .cke_toolgroup [{lightGradient}border-color:{defaultBorder};] {id} a.cke_button_off:hover, {id} a.cke_button_off:focus, {id} a.cke_button_off:active [{mediumGradient}] {id} .cke_button_on [{ckeButtonOn}] {id} .cke_toolbar_separator [background-color: {ckeToolbarSeparator};] {id} .cke_combo_button [border-color:{defaultBorder};{lightGradient}] {id} a.cke_combo_button:hover, {id} a.cke_combo_button:focus, {id} .cke_combo_on a.cke_combo_button [border-color:{defaultBorder};{mediumGradient}] {id} .cke_path_item [color:{elementsPathColor};] {id} a.cke_path_item:hover, {id} a.cke_path_item:focus, {id} a.cke_path_item:active [background-color:{elementsPathBg};] {id}.cke_panel [border-color:{defaultBorder};] ")
      , panel: new CKEDITOR.template(".cke_panel_grouptitle [{lightGradient}border-color:{defaultBorder};] .cke_menubutton_icon [background-color:{menubuttonIcon};] .cke_menubutton:hover .cke_menubutton_icon, .cke_menubutton:focus .cke_menubutton_icon, .cke_menubutton:active .cke_menubutton_icon [background-color:{menubuttonIconHover};] .cke_menuseparator [background-color:{menubuttonIcon};] a:hover.cke_colorbox, a:focus.cke_colorbox, a:active.cke_colorbox [border-color:{defaultBorder};] a:hover.cke_colorauto, a:hover.cke_colormore, a:focus.cke_colorauto, a:focus.cke_colormore, a:active.cke_colorauto, a:active.cke_colormore [background-color:{ckeColorauto};border-color:{defaultBorder};] ")
    };
  return function (c, f) {
    var b = c.uiColor
      , b = {
        id: "." + c.id
        , defaultBorder: a(b, -0.1)
        , defaultGradient: e(a(b, 0.9), b)
        , lightGradient: e(a(b, 1), a(b, 0.7))
        , mediumGradient: e(a(b, 0.8), a(b, 0.5))
        , ckeButtonOn: e(a(b, 0.6), a(b, 0.7))
        , ckeResizer: a(b, -0.4)
        , ckeToolbarSeparator: a(b, 0.5)
        , ckeColorauto: a(b, 0.8)
        , dialogBody: a(b, 0.7)
        , dialogTabSelected: e("#FFFFFF", "#FFFFFF")
        , dialogTabSelectedBorder: "#FFF"
        , elementsPathColor: a(b, -0.6)
        , elementsPathBg: b
        , menubuttonIcon: a(b, 0.5)
        , menubuttonIconHover: a(b, 0.3)
      };
    return d[f].output(b).replace(/\[/g, "{").replace(/\]/g, "}")
  }
}();
$(".InputfieldCKEditorInline").click(function () {
  var a = $("#cke_" + $(this).attr("id"));
  if (a.length) {
    $(this).parent().after(a)
  }
});