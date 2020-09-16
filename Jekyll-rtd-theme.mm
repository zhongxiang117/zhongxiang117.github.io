<map version="freeplane 1.8.0">
<!--To view this file, download free mind mapping software Freeplane from http://freeplane.sourceforge.net -->
<node TEXT="Jekyll-rtd-theme" FOLDED="false" ID="ID_34005013" CREATED="1599958819316" MODIFIED="1600224032020" STYLE="oval" UNIFORM_SHAPE="true">
<font SIZE="18"/>
<hook NAME="MapStyle">
    <properties fit_to_viewport="false" edgeColorConfiguration="#808080ff,#ff0000ff,#0000ffff,#00ff00ff,#ff00ffff,#00ffffff,#7c0000ff,#00007cff,#007c00ff,#7c007cff,#007c7cff,#7c7c00ff"/>

<map_styles>
<stylenode LOCALIZED_TEXT="styles.root_node" STYLE="oval" UNIFORM_SHAPE="true" VGAP_QUANTITY="24.0 pt">
<font SIZE="24"/>
<stylenode LOCALIZED_TEXT="styles.predefined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="default" ICON_SIZE="12.0 pt" COLOR="#000000" STYLE="fork">
<font NAME="SansSerif" SIZE="10" BOLD="false" ITALIC="false"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.details"/>
<stylenode LOCALIZED_TEXT="defaultstyle.attributes" MAX_WIDTH="20.0 cm">
<font NAME="Consolas" SIZE="9"/>
</stylenode>
<stylenode LOCALIZED_TEXT="defaultstyle.note" COLOR="#000000" BACKGROUND_COLOR="#ffffff" TEXT_ALIGN="LEFT"/>
<stylenode LOCALIZED_TEXT="defaultstyle.floating">
<edge STYLE="hide_edge"/>
<cloud COLOR="#f0f0f0" SHAPE="ROUND_RECT"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.user-defined" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="styles.topic" COLOR="#18898b" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subtopic" COLOR="#cc3300" STYLE="fork">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.subsubtopic" COLOR="#669900">
<font NAME="Liberation Sans" SIZE="10" BOLD="true"/>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.important">
<icon BUILTIN="yes"/>
</stylenode>
</stylenode>
<stylenode LOCALIZED_TEXT="styles.AutomaticLayout" POSITION="right" STYLE="bubble">
<stylenode LOCALIZED_TEXT="AutomaticLayout.level.root" COLOR="#000000" STYLE="oval" SHAPE_HORIZONTAL_MARGIN="10.0 pt" SHAPE_VERTICAL_MARGIN="10.0 pt">
<font SIZE="18"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,1" COLOR="#0033ff" STYLE="fork">
<font NAME="Consolas" SIZE="16"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,2" COLOR="#00b439" STYLE="fork">
<font NAME="Consolas" SIZE="14"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,3" COLOR="#990000" STYLE="fork">
<font NAME="Consolas" SIZE="12"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,4" COLOR="#111111">
<font SIZE="10"/>
</stylenode>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,5"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,6"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,7"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,8"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,9"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,10"/>
<stylenode LOCALIZED_TEXT="AutomaticLayout.level,11"/>
</stylenode>
</stylenode>
</map_styles>
</hook>
<hook NAME="AutomaticEdgeColor" COUNTER="4" RULE="ON_BRANCH_CREATION"/>
<node TEXT="_layouts/default.liquid" LOCALIZED_STYLE_REF="AutomaticLayout.level,1" POSITION="right" ID="ID_124330539" CREATED="1599958884355" MODIFIED="1599960106547" HGAP_QUANTITY="14.0 pt" VSHIFT_QUANTITY="112.49999664723882 pt">
<icon BUILTIN="full-1"/>
<edge COLOR="#ff0000"/>
</node>
<node TEXT="reset/defaults.liquid" LOCALIZED_STYLE_REF="AutomaticLayout.level,1" POSITION="right" ID="ID_178572315" CREATED="1599958886835" MODIFIED="1599960098669" HGAP_QUANTITY="113.74999702721843 pt" VSHIFT_QUANTITY="116.99999651312838 pt">
<icon BUILTIN="full-2"/>
<arrowlink SHAPE="CUBIC_CURVE" COLOR="#000000" WIDTH="2" TRANSPARENCY="200" FONT_SIZE="9" FONT_FAMILY="SansSerif" DESTINATION="ID_124330539" MIDDLE_LABEL="include" STARTINCLINATION="46;-23;" ENDINCLINATION="74;19;" STARTARROW="DEFAULT" ENDARROW="NONE"/>
<edge COLOR="#00ff00"/>
<hook NAME="AlwaysUnfoldedNode"/>
<node TEXT="{%- assign description = content | strip_html | split: &quot; &quot; | join: &quot; &quot; | escape | truncate: 150 -%}&#xa;{%- assign version = &quot;1.1.6&quot; -%}&#xa;{%- assign addons = &quot;github, i18n, plugins, analytics&quot; | split: &quot;, &quot; -%}&#xa;{%- assign schema_date = page.date | default: site.time | date_to_xmlschema -%}&#xa;{%- assign schema_modi = site.time | date_to_xmlschema -%}&#xa;{%- assign schema_surl = page.url | absolute_url | xml_escape -%}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_995503459" CREATED="1599959318923" MODIFIED="1599959587307" HGAP_QUANTITY="107.74999720603235 pt" VSHIFT_QUANTITY="-18.749999441206484 pt" MAX_WIDTH="20.0 cm">
<icon BUILTIN="full-1"/>
</node>
<node TEXT="{%- capture site_scss -%}&#xa;    @import &quot;jekyll-rtd-theme.scss&quot;;&#xa;    {% if site.fluid %}@import &quot;fluid.scss&quot;;{% endif %}&#xa;    {% include assets/custom.scss %} {{ site.scss }}&#xa;{%- endcapture -%}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1346542099" CREATED="1599959417203" MODIFIED="1599959589082" HGAP_QUANTITY="149.74999595433485 pt" VSHIFT_QUANTITY="-50.24999850243334 pt" MAX_WIDTH="20.0 cm">
<icon BUILTIN="full-2"/>
</node>
<node TEXT="{%- if site.debug -%}&#xa;    {%- assign cdn = site.baseurl -%}&#xa;{%- else -%}&#xa;    {%- assign cdn = &quot;https://cdn.jsdelivr.net/gh/rundocs/jekyll-rtd-theme@&quot; | append: version -%}&#xa;{%- endif -%}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_999459781" CREATED="1599959424172" MODIFIED="1599959990505" HGAP_QUANTITY="202.24999438971298 pt" VSHIFT_QUANTITY="-22.499999329447768 pt" MAX_WIDTH="20.0 cm">
<icon BUILTIN="full-3"/>
</node>
<node TEXT="{%- if site.github_metadata != false -%}&#xa;    {%- assign author = site.author | default: site.github.owner_name -%}&#xa;    {%- assign branch = site.github.source.branch -%}&#xa;    {%- assign commit = site.github.build_revision | slice: 0, 7 -%}&#xa;    {%- assign repository_url = site.github.repository_url -%}&#xa;    {%- assign issues_url = site.github.issues_url -%}&#xa;    {%- assign zip_url = site.github.zip_url -%}&#xa;    {%- capture github_edit_link %}{% github_edit_link %}{% endcapture -%}&#xa;{%- else -%}&#xa;    {%- assign author = site.author -%}&#xa;    {%- assign branch = &quot;&quot; -%}&#xa;    {%- assign commit = &quot;&quot; -%}&#xa;    {%- assign repository_url = &quot;&quot; -%}&#xa;    {%- assign issues_url = &quot;&quot; -%}&#xa;    {%- assign zip_url = &quot;&quot; -%}&#xa;    {%- assign github_edit_link = &quot;&quot; -%}&#xa;    {%- assign addons = &quot;i18n, plugins, analytics&quot; | split: &quot;, &quot; -%}&#xa;{%- endif -%}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_844823904" CREATED="1599959635869" MODIFIED="1599959988648" HGAP_QUANTITY="234.49999342858808 pt" VSHIFT_QUANTITY="-1.4999999552965235 pt">
<icon BUILTIN="full-4"/>
</node>
<node TEXT="include reset/site_pages.liquid" ID="ID_1947930189" CREATED="1599959686789" MODIFIED="1599959973779" HGAP_QUANTITY="263.7499925568702 pt" VSHIFT_QUANTITY="-39.74999881535772 pt">
<icon BUILTIN="full-5"/>
<hook NAME="AlwaysUnfoldedNode"/>
<node TEXT="{%- assign site_pages = site.html_pages&#xa;    | sort: &quot;path&quot;&#xa;    | sort: &quot;sort&quot;&#xa;    | where_exp: &quot;item&quot;, &quot;item.url != &apos;/404.html&apos;&quot;&#xa;    | where_exp: &quot;item&quot;, &quot;item.url != &apos;/search.html&apos;&quot; -%}&#xa;&#xa;{%- assign site_dirs  = site_pages | where_exp: &quot;item&quot;, &quot;item.dir == item.url&quot; -%}&#xa;{%- assign site_files = site_pages | where_exp: &quot;item&quot;, &quot;item.dir != item.url&quot; -%}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1521703154" CREATED="1599959920216" MODIFIED="1599959973778" HGAP_QUANTITY="206.74999425560253 pt" VSHIFT_QUANTITY="-36.74999890476469 pt"/>
</node>
<node TEXT="include reset/i18n.liquid" ID="ID_19130824" CREATED="1599959714047" MODIFIED="1599959968623" HGAP_QUANTITY="247.2499930486085 pt" VSHIFT_QUANTITY="-33.74999899417165 pt">
<icon BUILTIN="full-6"/>
<hook NAME="AlwaysUnfoldedNode"/>
<richcontent TYPE="DETAILS">

<html>
  <head>
    
  </head>
  <body>
    <p>
      decide page language
    </p>
  </body>
</html>

</richcontent>
</node>
<node TEXT="{%- case page.url -%}&#xa;    {%- when &quot;/&quot; -%}&#xa;        {%- assign title = site.title | append: &quot; · &quot; | append: site.description -%}&#xa;    {%- when &quot;/search.html&quot; -%}&#xa;        {%- assign title = __search   | append: &quot; · &quot; | append: site.title -%}&#xa;    {%- when &quot;/404.html&quot; -%}&#xa;        {%- assign title = __404      | append: &quot; · &quot; | append: site.title -%}&#xa;    {%- else -%}&#xa;        {%- assign title = page.title | default: page.url | append: &quot; · &quot; | append: site.title -%}&#xa;{%- endcase -%}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_92982824" CREATED="1599959715671" MODIFIED="1599959984156" HGAP_QUANTITY="142.99999615550053 pt" VSHIFT_QUANTITY="-35.249998949468164 pt">
<icon BUILTIN="full-7"/>
</node>
<node TEXT="{%- assign content = content&#xa;    | replace: &apos;’&apos;, &quot;&apos;&quot;&#xa;    | replace: &apos;&lt;pre class=&quot;highlight&quot;&gt;&lt;code&gt;&apos;, &apos;&lt;pre class=&quot;notranslate&quot;&gt;&apos;&#xa;    | replace: &apos;&lt;pre&gt;&lt;code class=&quot;&apos;, &apos;&lt;pre class=&quot;notranslate &apos;&#xa;    | replace: &quot;&lt;/code&gt;&lt;/pre&gt;&quot;, &quot;&lt;/pre&gt;&quot;&#xa;    | replace: &apos;&lt;code class=&quot;language-plaintext highlighter-rouge&quot;&gt;&apos;, &apos;&lt;code class=&quot;literal&quot;&gt;&apos;&#xa;    | replace: &quot;&lt;dl&gt;&quot;, &apos;&lt;dl class=&quot;definition&quot;&gt;&apos;&#xa;    | replace: &quot;&lt;table&gt;&quot;, &apos;&lt;div class=&quot;wy-table-responsive&quot;&gt;&lt;table class=&quot;docutils align-default&quot;&gt;&apos;&#xa;    | replace: &quot;&lt;/table&gt;&quot;, &apos;&lt;/table&gt;&lt;/div&gt;&apos; -%}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1397795726" CREATED="1599959839846" MODIFIED="1599959853031" HGAP_QUANTITY="110.7499971166254 pt" VSHIFT_QUANTITY="0.7499999776482589 pt">
<icon BUILTIN="full-8"/>
</node>
<node TEXT="{%- assign workdir_files = site_files | where_exp: &quot;item&quot;, &quot;item.dir == page.dir&quot; -%}&#xa;&#xa;{%- assign _index = 0 -%}&#xa;{%- for item in workdir_files %}&#xa;    {%- if item.url == page.url %}&#xa;        {%- assign _index = forloop.index -%}&#xa;    {%- endif %}&#xa;{%- endfor -%}&#xa;&#xa;{%- for item in workdir_files -%}&#xa;    {%- assign _index_prev = _index | minus: 1 -%}&#xa;    {%- assign _index_next = _index | plus: 1 -%}&#xa;    {%- if forloop.index == _index_prev -%}&#xa;        {%- assign prev = item -%}&#xa;    {%- endif %}&#xa;    {%- if forloop.index == _index_next and page.url != page.dir -%}&#xa;        {%- assign next = item -%}&#xa;    {%- endif %}&#xa;{%- endfor -%}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1214246435" CREATED="1599959871165" MODIFIED="1599959886438" HGAP_QUANTITY="142.99999615550053 pt" VSHIFT_QUANTITY="47.24999859184031 pt">
<icon BUILTIN="full-9"/>
</node>
</node>
<node TEXT="&lt;head&gt;&lt;/head&gt;" POSITION="right" ID="ID_1776117205" CREATED="1599959316131" MODIFIED="1600024395018" HGAP_QUANTITY="158.74999568611395 pt" VSHIFT_QUANTITY="-626.2499813362962 pt">
<icon BUILTIN="full-3"/>
<edge COLOR="#ff00ff"/>
<node TEXT="meta" ID="ID_1670700401" CREATED="1599960130678" MODIFIED="1600024380444" HGAP_QUANTITY="224.7499937191607 pt" VSHIFT_QUANTITY="568.4999830573803 pt" STYLE="oval">
<icon BUILTIN="25%"/>
</node>
<node TEXT="scripts" ID="ID_83056247" CREATED="1599960183024" MODIFIED="1600024388889" HGAP_QUANTITY="284.7499919310215 pt" VSHIFT_QUANTITY="-74.24999778717765 pt" STYLE="oval">
<icon BUILTIN="50%"/>
<hook NAME="AlwaysUnfoldedNode"/>
<node TEXT="&lt;script&gt;&#xa;        window.dataLayer = window.dataLayer || [];&#xa;&#xa;        function gtag() {&#xa;            dataLayer.push(arguments);&#xa;        }&#xa;&#xa;        function debug() {&#xa;            console.debug.apply(console, arguments);&#xa;        }&#xa;&#xa;        gtag(&quot;js&quot;, new Date());&#xa;&#xa;        if (&quot;serviceWorker&quot; in navigator) {&#xa;            navigator.serviceWorker.register(&quot;{{ site.baseurl }}/sw.caches.js&quot;);&#xa;        } else {&#xa;            debug(&quot;Service Worker not supported!&quot;);&#xa;        }&#xa;    &lt;/script&gt;" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_621862429" CREATED="1599960193429" MODIFIED="1599960248100" HGAP_QUANTITY="232.9999934732916 pt" VSHIFT_QUANTITY="-15.749999530613437 pt">
<icon BUILTIN="full-1"/>
</node>
<node TEXT="&lt;script type=&quot;application/ld+json&quot;&gt;&#xa;        {&#xa;            &quot;@context&quot;: &quot;https://schema.org&quot;,&#xa;            &quot;@type&quot;: &quot;Article&quot;,&#xa;            &quot;mainEntityOfPage&quot;: {&#xa;                &quot;@type&quot;: &quot;WebPage&quot;,&#xa;                &quot;@id&quot;: &quot;{{ schema_surl }}&quot;&#xa;            },&#xa;            &quot;headline&quot;: &quot;{{ title | truncate: 110 }}&quot;,&#xa;            &quot;image&quot;: [{% for image in page.images %}&quot;{{ image }}&quot;{% unless forloop.last %},{% endunless %}{% endfor %}],&#xa;            &quot;author&quot;: {&#xa;                &quot;@type&quot;: &quot;Person&quot;,&#xa;                &quot;name&quot;: &quot;{{ author }}&quot;&#xa;            },&#xa;            &quot;datePublished&quot;: &quot;{{ schema_date }}&quot;,&#xa;            &quot;dateModified&quot;: &quot;{{ schema_modi }}&quot;,&#xa;            &quot;publisher&quot;: {&#xa;                &quot;@type&quot;: &quot;Organization&quot;,&#xa;                &quot;name&quot;: &quot;RunDocs&quot;,&#xa;                &quot;logo&quot;: {&#xa;                    &quot;@type&quot;: &quot;ImageObject&quot;,&#xa;                    &quot;url&quot;: &quot;https://rundocs.io/logo.png&quot;&#xa;                }&#xa;            },&#xa;            &quot;description&quot;: &quot;{{ description }}&quot;&#xa;        }&#xa;    &lt;/script&gt;" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1081991767" CREATED="1599960243646" MODIFIED="1599960301725" HGAP_QUANTITY="347.7499900534752 pt" VSHIFT_QUANTITY="45.74999863654379 pt" MAX_WIDTH="30.0 cm">
<icon BUILTIN="full-2"/>
</node>
<node TEXT="&lt;script src=&quot;{{ cdn }}/assets/js/jquery.min.js&quot;&gt;&lt;/script&gt;&#xa;    &lt;script&gt;&#xa;        const ui = {&#xa;            baseurl: &quot;{{ site.baseurl }}&quot;,&#xa;            title: &quot;{{ site.title }}&quot;,&#xa;            lang: &quot;{{ lang }}&quot;,&#xa;            admonition: {&#xa;                note: &quot;{{ __note }}&quot;,&#xa;                tip: &quot;{{ __tip }}&quot;,&#xa;                warning: &quot;{{ __warning }}&quot;,&#xa;                danger: &quot;{{ __danger }}&quot;&#xa;            }&#xa;        };&#xa;    &lt;/script&gt;" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_408982374" CREATED="1599960321406" MODIFIED="1599960334047" HGAP_QUANTITY="496.99998560547874 pt" VSHIFT_QUANTITY="126.74999622255575 pt">
<icon BUILTIN="full-3"/>
</node>
</node>
<node TEXT="&lt;link rel=&quot;stylesheet&quot; href=&quot;{{ cdn }}/assets/css/theme.css&quot;&gt;&#xa;    &lt;link rel=&quot;stylesheet&quot; href=&quot;{{ cdn }}/assets/css/rougify/{{ site.rougify | default: &apos;github&apos; }}.css&quot;&gt;&#xa;    &lt;style&gt;{{ site_scss | scssify | strip_newlines }}&lt;/style&gt;" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1299762468" CREATED="1599960368926" MODIFIED="1600024392315" HGAP_QUANTITY="304.9999913275244 pt" VSHIFT_QUANTITY="-125.99999624490749 pt" MAX_WIDTH="25.0 cm">
<icon BUILTIN="75%"/>
</node>
<node TEXT="{% include extra/head.html %}" LOCALIZED_STYLE_REF="defaultstyle.attributes" ID="ID_1477192324" CREATED="1599960467965" MODIFIED="1600024395017" HGAP_QUANTITY="154.99999579787266 pt" VSHIFT_QUANTITY="-28.499999150633837 pt">
<icon BUILTIN="100%"/>
</node>
</node>
</node>
</map>
