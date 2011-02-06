class PygmentsLexersList
  def self.get_list
    lexer_list = [
                  # Changed after running python script:
                  #  - RHTML filenames, adding .erb
                  {:fullname => "JavaScript+Mako", :keywrd => :'js+mako', :names => ['js+mako','javascript+mako'], :filenames => [], :mimetypes => ['application/x-javascript+mako','application/javascript+mako','text/x-javascript+mako','text/javascript+mako','text/javascript+mako']},
                  {:fullname => "Brainfuck", :keywrd => :brainfuck, :names => ['brainfuck','bf'], :filenames => [/^(.*)\.bf$/,/^(.*)\.b$/], :mimetypes => ['application/x-brainfuck','application/brainfuck']},
                  {:fullname => "HTML+Cheetah", :keywrd => :'html+cheetah', :names => ['html+cheetah','html+spitfire'], :filenames => [], :mimetypes => ['text/html+cheetah','text/html+spitfire']},
                  {:fullname => "Bash", :keywrd => :bash, :names => ['bash','sh','ksh'], :filenames => [/^(.*)\.sh$/,/^(.*)\.ksh$/,/^(.*)\.bash$/,/^(.*)\.ebuild$/,/^(.*)\.eclass$/], :mimetypes => ['application/x-sh','application/sh','application/x-shellscript','application/shellscript']},
                  {:fullname => "CSS+Myghty", :keywrd => :'css+myghty', :names => ['css+myghty'], :filenames => [], :mimetypes => ['text/css+myghty']},
                  {:fullname => "Coldufsion HTML", :keywrd => :cfm, :names => ['cfm'], :filenames => [/^(.*)\.cfm$/,/^(.*)\.cfml$/,/^(.*)\.cfc$/], :mimetypes => ['application/x-coldfusion','application/coldfusion']},
                  {:fullname => "Smarty", :keywrd => :smarty, :names => ['smarty'], :filenames => [/^(.*)\.tpl$/], :mimetypes => ['application/x-smarty','application/smarty']},
                  {:fullname => "ApacheConf", :keywrd => :apacheconf, :names => ['apacheconf','aconf','apache'], :filenames => [/^.htaccess$/,/^apache.conf$/,/^apache2.conf$/], :mimetypes => ['text/x-apacheconf','text/apacheconf']},
                  {:fullname => "Java", :keywrd => :java, :names => ['java'], :filenames => [/^(.*)\.java$/], :mimetypes => ['text/x-java','text/java']},
                  {:fullname => "JavaScript+Genshi Text", :keywrd => :'js+genshitext', :names => ['js+genshitext','js+genshi','javascript+genshitext','javascript+genshi'], :filenames => [], :mimetypes => ['application/x-javascript+genshi','application/javascript+genshi','text/x-javascript+genshi','text/javascript+genshi','text/javascript+genshi']},
                  {:fullname => "Erlang", :keywrd => :erlang, :names => ['erlang'], :filenames => [/^(.*)\.erl$/,/^(.*)\.hrl$/], :mimetypes => ['text/x-erlang','text/erlang']},
                  {:fullname => "CoffeeScript", :keywrd => :'coffee-script', :names => ['coffee-script','coffeescript'], :filenames => [/^(.*)\.coffee$/], :mimetypes => ['text/coffeescript']},
                  {:fullname => "ANTLR With ActionScript Target", :keywrd => :'antlr-as', :names => ['antlr-as','antlr-actionscript'], :filenames => [/^(.*)\.G$/,/^(.*)\.g$/], :mimetypes => []},
                  {:fullname => "d-objdump", :keywrd => :'d-objdump', :names => ['d-objdump'], :filenames => [/^(.*)\.d-objdump$/], :mimetypes => ['text/x-d-objdump','text/d-objdump']},
                  {:fullname => "CSS+Ruby", :keywrd => :'css+erb', :names => ['css+erb','css+ruby'], :filenames => [], :mimetypes => ['text/css+ruby']},
                  {:fullname => "MySQL", :keywrd => :mysql, :names => ['mysql'], :filenames => [], :mimetypes => ['text/x-mysql','text/mysql']},
                  {:fullname => "C++", :keywrd => :cpp, :names => ['cpp','c++'], :filenames => [/^(.*)\.cpp$/,/^(.*)\.hpp$/,/^(.*)\.c\+\+$/,/^(.*)\.h\+\+$/,/^(.*)\.cc$/,/^(.*)\.hh$/,/^(.*)\.cxx$/,/^(.*)\.hxx$/], :mimetypes => ['text/x-c++hdr','text/c++hdr','text/x-c++src','text/c++src']},
                  {:fullname => "XML+Smarty", :keywrd => :'xml+smarty', :names => ['xml+smarty'], :filenames => [], :mimetypes => ['application/xml+smarty']},
                  {:fullname => "Felix", :keywrd => :felix, :names => ['felix','flx'], :filenames => [/^(.*)\.flx$/,/^(.*)\.flxh$/], :mimetypes => ['text/x-felix','text/felix']},
                  {:fullname => "CMake", :keywrd => :cmake, :names => ['cmake'], :filenames => [/^(.*)\.cmake$/], :mimetypes => ['text/x-cmake','text/cmake']},
                  {:fullname => "Mako", :keywrd => :mako, :names => ['mako'], :filenames => [/^(.*)\.mao$/], :mimetypes => ['application/x-mako','application/mako']},
                  {:fullname => "Python", :keywrd => :python, :names => ['python','py'], :filenames => [/^(.*)\.py$/,/^(.*)\.pyw$/,/^(.*)\.sc$/,/^SConstruct$/,/^SConscript$/,/^(.*)\.tac$/], :mimetypes => ['text/x-python','text/python','application/x-python','application/python']},
                  {:fullname => "JavaScript+Myghty", :keywrd => :'js+myghty', :names => ['js+myghty','javascript+myghty'], :filenames => [], :mimetypes => ['application/x-javascript+myghty','application/javascript+myghty','text/x-javascript+myghty','text/javascript+myghty','text/javascript+mygthy']},
                  {:fullname => "XML+Mako", :keywrd => :'xml+mako', :names => ['xml+mako'], :filenames => [], :mimetypes => ['application/xml+mako']},
                  {:fullname => "Boo", :keywrd => :boo, :names => ['boo'], :filenames => [/^(.*)\.boo$/], :mimetypes => ['text/x-boo','text/boo']},
                  {:fullname => "ActionScript", :keywrd => :as, :names => ['as','actionscript'], :filenames => [/^(.*)\.as$/], :mimetypes => ['application/x-actionscript','application/actionscript','text/x-actionscript','text/actionscript','text/actionscript']},
                  {:fullname => "VB.net", :keywrd => :'vb.net', :names => ['vb.net','vbnet'], :filenames => [/^(.*)\.vb$/,/^(.*)\.bas$/], :mimetypes => ['text/x-vbnet','text/vbnet','text/x-vba','text/vba']},
                  {:fullname => "SquidConf", :keywrd => :squidconf, :names => ['squidconf','squid.conf','squid'], :filenames => [/^squid.conf$/], :mimetypes => ['text/x-squidconf','text/squidconf']},
                  {:fullname => "D", :keywrd => :d, :names => ['d'], :filenames => [/^(.*)\.d$/,/^(.*)\.di$/], :mimetypes => ['text/x-dsrc','text/dsrc']},
                  {:fullname => "Logtalk", :keywrd => :logtalk, :names => ['logtalk'], :filenames => [/^(.*)\.lgt$/], :mimetypes => ['text/x-logtalk','text/logtalk']},
                  {:fullname => "BBCode", :keywrd => :bbcode, :names => ['bbcode'], :filenames => [], :mimetypes => ['text/x-bbcode','text/bbcode']},
                  {:fullname => "Haml", :keywrd => :haml, :names => ['haml','HAML'], :filenames => [/^(.*)\.haml$/], :mimetypes => ['text/x-haml','text/haml']},
                  {:fullname => "MuPAD", :keywrd => :mupad, :names => ['mupad'], :filenames => [/^(.*)\.mu$/], :mimetypes => []},
                  {:fullname => "XML+Ruby", :keywrd => :'xml+erb', :names => ['xml+erb','xml+ruby'], :filenames => [], :mimetypes => ['application/xml+ruby']},
                  {:fullname => "Debian Control file", :keywrd => :control, :names => ['control'], :filenames => [/^control$/], :mimetypes => []},
                  {:fullname => "RHTML", :keywrd => :rhtml, :names => ['rhtml','html+erb','html+ruby'], :filenames => [/^(.*)\.rhtml$/, /^(.*)\.erb$/], :mimetypes => ['text/html+ruby']},
                  {:fullname => "JavaScript+Cheetah", :keywrd => :'js+cheetah', :names => ['js+cheetah','javascript+cheetah','js+spitfire','javascript+spitfire'], :filenames => [], :mimetypes => ['application/x-javascript+cheetah','application/javascript+cheetah','text/x-javascript+cheetah','text/javascript+cheetah','text/javascript+cheetah','application/x-javascript+spitfire','application/javascript+spitfire','text/x-javascript+spitfire','text/javascript+spitfire','text/javascript+spitfire']},
                  {:fullname => "Python Traceback", :keywrd => :pytb, :names => ['pytb'], :filenames => [/^(.*)\.pytb$/], :mimetypes => ['text/x-python-traceback','text/python-traceback']},
                  {:fullname => "cfstatement", :keywrd => :cfs, :names => ['cfs'], :filenames => [], :mimetypes => []},
                  {:fullname => "Ada", :keywrd => :ada, :names => ['ada','ada95ada2005'], :filenames => [/^(.*)\.adb$/,/^(.*)\.ads$/,/^(.*)\.ada$/], :mimetypes => ['text/x-ada','text/ada']},
                  {:fullname => "objdump", :keywrd => :objdump, :names => ['objdump'], :filenames => [/^(.*)\.objdump$/], :mimetypes => ['text/x-objdump','text/objdump']},
                  {:fullname => "CSS+Mako", :keywrd => :'css+mako', :names => ['css+mako'], :filenames => [], :mimetypes => ['text/css+mako']},
                  {:fullname => "Gherkin", :keywrd => :Cucumber, :names => ['Cucumber','cucumber','Gherkin','gherkin'], :filenames => [/^(.*)\.feature$/], :mimetypes => ['text/x-gherkin','text/gherkin']},
                  {:fullname => "Ragel in Java Host", :keywrd => :'ragel-java', :names => ['ragel-java'], :filenames => [/^(.*)\.rl$/], :mimetypes => []},
                  {:fullname => "Io", :keywrd => :io, :names => ['io'], :filenames => [/^(.*)\.io$/], :mimetypes => ['text/x-iosrc','text/iosrc']},
                  {:fullname => "Vala", :keywrd => :vala, :names => ['vala','vapi'], :filenames => [/^(.*)\.vala$/,/^(.*)\.vapi$/], :mimetypes => ['text/x-vala','text/vala']},
                  {:fullname => "Haskell", :keywrd => :haskell, :names => ['haskell','hs'], :filenames => [/^(.*)\.hs$/], :mimetypes => ['text/x-haskell','text/haskell']},
                  {:fullname => "Lua", :keywrd => :lua, :names => ['lua'], :filenames => [/^(.*)\.lua$/], :mimetypes => ['text/x-lua','text/lua','application/x-lua','application/lua']},
                  {:fullname => "Sass", :keywrd => :sass, :names => ['sass','SASS'], :filenames => [/^(.*)\.sass$/], :mimetypes => ['text/x-sass','text/sass']},
                  {:fullname => "ANTLR With ObjectiveC Target", :keywrd => :'antlr-objc', :names => ['antlr-objc'], :filenames => [/^(.*)\.G$/,/^(.*)\.g$/], :mimetypes => []},
                  {:fullname => "XML", :keywrd => :xml, :names => ['xml'], :filenames => [/^(.*)\.xml$/,/^(.*)\.xsl$/,/^(.*)\.rss$/,/^(.*)\.xslt$/,/^(.*)\.xsd$/,/^(.*)\.wsdl$/], :mimetypes => ['text/xml','application/xml','image/svg+xml','application/rss+xml','application/atom+xml','application/xsl+xml','application/xslt+xml']},
                  {:fullname => "Groff", :keywrd => :groff, :names => ['groff','nroff','man'], :filenames => [/^(.*)\.[1234567]$/,/^(.*)\.man$/], :mimetypes => ['application/x-troff','application/troff','text/troff']},
                  {:fullname => "GLSL", :keywrd => :glsl, :names => ['glsl'], :filenames => [/^(.*)\.vert$/,/^(.*)\.frag$/,/^(.*)\.geo$/], :mimetypes => ['text/x-glslsrc','text/glslsrc']},
                  {:fullname => "Genshi Text", :keywrd => :genshitext, :names => ['genshitext'], :filenames => [], :mimetypes => ['application/x-genshi-text','application/genshi-text','text/x-genshi','text/genshi']},
                  {:fullname => "Objective-J", :keywrd => :'objective-j', :names => ['objective-j','objectivej','obj-j','objj'], :filenames => [/^(.*)\.j$/], :mimetypes => ['text/x-objective-j','text/objective-j']},
                  {:fullname => "GAS", :keywrd => :gas, :names => ['gas'], :filenames => [/^(.*)\.s$/,/^(.*)\.S$/], :mimetypes => ['text/x-gas','text/gas']},
                  {:fullname => "Python console session", :keywrd => :pycon, :names => ['pycon'], :filenames => [], :mimetypes => ['text/x-python-doctest','text/python-doctest']},
                  {:fullname => "MXML", :keywrd => :mxml, :names => ['mxml'], :filenames => [/^(.*)\.mxml$/], :mimetypes => []},
                  {:fullname => "XML+Cheetah", :keywrd => :'xml+cheetah', :names => ['xml+cheetah','xml+spitfire'], :filenames => [], :mimetypes => ['application/xml+cheetah','application/xml+spitfire']},
                  {:fullname => "Go", :keywrd => :go, :names => ['go'], :filenames => [/^(.*)\.go$/], :mimetypes => ['text/x-gosrc','text/gosrc']},
                  {:fullname => "Ragel in C Host", :keywrd => :'ragel-c', :names => ['ragel-c'], :filenames => [/^(.*)\.rl$/], :mimetypes => []},
                  {:fullname => "aspx-cs", :keywrd => :'aspx-cs', :names => ['aspx-cs'], :filenames => [/^(.*)\.aspx$/,/^(.*)\.asax$/,/^(.*)\.ascx$/,/^(.*)\.ashx$/,/^(.*)\.asmx$/,/^(.*)\.axd$/], :mimetypes => []},
                  {:fullname => "Ragel in Ruby Host", :keywrd => :'ragel-ruby', :names => ['ragel-ruby','ragel-rb'], :filenames => [/^(.*)\.rl$/], :mimetypes => []},
                  {:fullname => "HTML+Genshi", :keywrd => :'html+genshi', :names => ['html+genshi','html+kid'], :filenames => [], :mimetypes => ['text/html+genshi']},
                  {:fullname => "Perl", :keywrd => :perl, :names => ['perl','pl'], :filenames => [/^(.*)\.pl$/,/^(.*)\.pm$/], :mimetypes => ['text/x-perl','text/perl','application/x-perl','application/perl']},
                  {:fullname => "INI", :keywrd => :ini, :names => ['ini','cfg'], :filenames => [/^(.*)\.ini$/,/^(.*)\.cfg$/,/^(.*)\.properties$/], :mimetypes => ['text/x-ini','text/ini']},
                  {:fullname => "c-objdump", :keywrd => :'c-objdump', :names => ['c-objdump'], :filenames => [/^(.*)\.c-objdump$/], :mimetypes => ['text/x-c-objdump','text/c-objdump']},
                  {:fullname => "Tcsh", :keywrd => :tcsh, :names => ['tcsh','csh'], :filenames => [/^(.*)\.tcsh$/,/^(.*)\.csh$/], :mimetypes => ['application/x-csh','application/csh']},
                  {:fullname => "RConsole", :keywrd => :rconsole, :names => ['rconsole','rout'], :filenames => [/^(.*)\.Rout$/], :mimetypes => []},
                  {:fullname => "CSS+Smarty", :keywrd => :'css+smarty', :names => ['css+smarty'], :filenames => [], :mimetypes => ['text/css+smarty']},
                  {:fullname => "ANTLR With C# Target", :keywrd => :'antlr-csharp', :names => ['antlr-csharp','antlr-c#'], :filenames => [/^(.*)\.G$/,/^(.*)\.g$/], :mimetypes => []},
                  {:fullname => "Darcs Patch", :keywrd => :dpatch, :names => ['dpatch'], :filenames => [/^(.*)\.dpatch$/,/^(.*)\.darcspatch$/], :mimetypes => []},
                  {:fullname => "LLVM", :keywrd => :llvm, :names => ['llvm'], :filenames => [/^(.*)\.ll$/], :mimetypes => ['text/x-llvm','text/llvm']},
                  {:fullname => "Nginx configuration file", :keywrd => :nginx, :names => ['nginx'], :filenames => [], :mimetypes => ['text/x-nginx-conf','text/nginx-conf']},
                  {:fullname => "AppleScript", :keywrd => :applescript, :names => ['applescript'], :filenames => [/^(.*)\.applescript$/], :mimetypes => []},
                  {:fullname => "Text only", :keywrd => :text, :names => ['text'], :filenames => [/^(.*)\.txt$/], :mimetypes => ['text/plain']},
                  {:fullname => "Literate Haskell", :keywrd => :lhs, :names => ['lhs','literate-haskell'], :filenames => [/^(.*)\.lhs$/], :mimetypes => ['text/x-literate-haskell','text/literate-haskell']},
                  {:fullname => "PHP", :keywrd => :php, :names => ['php','php3','php4','php5'], :filenames => [/^(.*)\.php$/,/^(.*)\.php[345]$/], :mimetypes => ['text/x-php','text/php']},
                  {:fullname => "MiniD", :keywrd => :minid, :names => ['minid'], :filenames => [/^(.*)\.md$/], :mimetypes => ['text/x-minidsrc','text/minidsrc']},
                  {:fullname => "Ooc", :keywrd => :ooc, :names => ['ooc'], :filenames => [/^(.*)\.ooc$/], :mimetypes => ['text/x-ooc','text/ooc']},
                  {:fullname => "SQL", :keywrd => :sql, :names => ['sql'], :filenames => [/^(.*)\.sql$/], :mimetypes => ['text/x-sql','text/sql']},
                  {:fullname => "NASM", :keywrd => :nasm, :names => ['nasm'], :filenames => [/^(.*)\.asm$/,/^(.*)\.ASM$/], :mimetypes => ['text/x-nasm','text/nasm']},
                  {:fullname => "Debian Sourcelist", :keywrd => :sourceslist, :names => ['sourceslist','sources.list'], :filenames => [/^sources.list$/], :mimetypes => []},
                  {:fullname => "Delphi", :keywrd => :delphi, :names => ['delphi','pas','pascal','objectpascal'], :filenames => [/^(.*)\.pas$/], :mimetypes => ['text/x-pascal','text/pascal']},
                  {:fullname => "aspx-vb", :keywrd => :'aspx-vb', :names => ['aspx-vb'], :filenames => [/^(.*)\.aspx$/,/^(.*)\.asax$/,/^(.*)\.ascx$/,/^(.*)\.ashx$/,/^(.*)\.asmx$/,/^(.*)\.axd$/], :mimetypes => []},
                  {:fullname => "HTML+Evoque", :keywrd => :'html+evoque', :names => ['html+evoque'], :filenames => [/^(.*)\.html$/], :mimetypes => ['text/html+evoque']},
                  {:fullname => "NumPy", :keywrd => :numpy, :names => ['numpy'], :filenames => [], :mimetypes => []},
                  {:fullname => "Modula-2", :keywrd => :modula2, :names => ['modula2','m2'], :filenames => [/^(.*)\.def$/,/^(.*)\.mod$/], :mimetypes => ['text/x-modula2','text/modula2']},
                  {:fullname => "HTML+Django/Jinja", :keywrd => :'html+django', :names => ['html+django','html+jinja'], :filenames => [], :mimetypes => ['text/html+django','text/html+jinja']},
                  {:fullname => "CSS+PHP", :keywrd => :'css+php', :names => ['css+php'], :filenames => [], :mimetypes => ['text/css+php']},
                  {:fullname => "VimL", :keywrd => :vim, :names => ['vim'], :filenames => [/^(.*)\.vim$/,/^.vimrc$/], :mimetypes => ['text/x-vim','text/vim']},
                  {:fullname => "CSS+Genshi Text", :keywrd => :'css+genshitext', :names => ['css+genshitext','css+genshi'], :filenames => [], :mimetypes => ['text/css+genshi']},
                  {:fullname => "Ragel", :keywrd => :ragel, :names => ['ragel'], :filenames => [], :mimetypes => []},
                  {:fullname => "XML+Evoque", :keywrd => :'xml+evoque', :names => ['xml+evoque'], :filenames => [/^(.*)\.xml$/], :mimetypes => ['application/xml+evoque']},
                  {:fullname => "haXe", :keywrd => :hx, :names => ['hx','haXe'], :filenames => [/^(.*)\.hx$/], :mimetypes => ['text/haxe']},
                  {:fullname => "Redcode", :keywrd => :redcode, :names => ['redcode'], :filenames => [/^(.*)\.cw$/], :mimetypes => []},
                  {:fullname => "Django/Jinja", :keywrd => :django, :names => ['django','jinja'], :filenames => [], :mimetypes => ['application/x-django-templating','application/django-templating','application/x-jinja','application/jinja']},
                  {:fullname => "Scala", :keywrd => :scala, :names => ['scala'], :filenames => [/^(.*)\.scala$/], :mimetypes => ['text/x-scala','text/scala']},
                  {:fullname => "Lighttpd configuration file", :keywrd => :lighty, :names => ['lighty','lighttpd'], :filenames => [], :mimetypes => ['text/x-lighttpd-conf','text/lighttpd-conf']},
                  {:fullname => "Ragel in D Host", :keywrd => :'ragel-d', :names => ['ragel-d'], :filenames => [/^(.*)\.rl$/], :mimetypes => []},
                  {:fullname => "Ruby irb session", :keywrd => :rbcon, :names => ['rbcon','irb'], :filenames => [], :mimetypes => ['text/x-ruby-shellsession','text/ruby-shellsession']},
                  {:fullname => "CSS", :keywrd => :css, :names => ['css'], :filenames => [/^(.*)\.css$/], :mimetypes => ['text/css']},
                  {:fullname => "JavaScript+Smarty", :keywrd => :'js+smarty', :names => ['js+smarty','javascript+smarty'], :filenames => [], :mimetypes => ['application/x-javascript+smarty','application/javascript+smarty','text/x-javascript+smarty','text/javascript+smarty','text/javascript+smarty']},
                  {:fullname => "Asymptote", :keywrd => :asy, :names => ['asy','asymptote'], :filenames => [/^(.*)\.asy$/], :mimetypes => ['text/x-asymptote','text/asymptote']},
                  {:fullname => "XML+PHP", :keywrd => :'xml+php', :names => ['xml+php'], :filenames => [], :mimetypes => ['application/xml+php']},
                  {:fullname => "Fortran", :keywrd => :fortran, :names => ['fortran'], :filenames => [/^(.*)\.f$/,/^(.*)\.f90$/], :mimetypes => ['text/x-fortran','text/fortran']},
                  {:fullname => "Gnuplot", :keywrd => :gnuplot, :names => ['gnuplot'], :filenames => [/^(.*)\.plot$/,/^(.*)\.plt$/], :mimetypes => ['text/x-gnuplot','text/gnuplot']},
                  {:fullname => "REBOL", :keywrd => :rebol, :names => ['rebol'], :filenames => [/^(.*)\.r$/,/^(.*)\.r3$/], :mimetypes => ['text/x-rebol','text/rebol']},
                  {:fullname => "ERB", :keywrd => :erb, :names => ['erb'], :filenames => [], :mimetypes => ['application/x-ruby-templating','application/ruby-templating']},
                  {:fullname => "Befunge", :keywrd => :befunge, :names => ['befunge'], :filenames => [/^(.*)\.befunge$/], :mimetypes => ['application/x-befunge','application/befunge']},
                  {:fullname => "Dylan", :keywrd => :dylan, :names => ['dylan'], :filenames => [/^(.*)\.dylan$/], :mimetypes => ['text/x-dylan','text/dylan']},
                  {:fullname => "MoinMoin/Trac Wiki markup", :keywrd => :'trac-wiki', :names => ['trac-wiki','moin'], :filenames => [], :mimetypes => ['text/x-trac-wiki','text/trac-wiki']},
                  {:fullname => "Matlab", :keywrd => :matlab, :names => ['matlab','octave'], :filenames => [/^(.*)\.m$/], :mimetypes => ['text/matlab']},
                  {:fullname => "C", :keywrd => :c, :names => ['c'], :filenames => [/^(.*)\.c$/,/^(.*)\.h$/], :mimetypes => ['text/x-chdr','text/chdr','text/x-csrc','text/csrc']},
                  {:fullname => "HTML", :keywrd => :html, :names => ['html'], :filenames => [/^(.*)\.html$/,/^(.*)\.htm$/,/^(.*)\.xhtml$/,/^(.*)\.xslt$/], :mimetypes => ['text/html','application/xhtml+xml']},
                  {:fullname => "Genshi", :keywrd => :genshi, :names => ['genshi','kid','xml+genshi','xml+kid'], :filenames => [/^(.*)\.kid$/], :mimetypes => ['application/x-genshi','application/genshi','application/x-kid','application/kid']},
                  {:fullname => "reStructuredText", :keywrd => :rst, :names => ['rst','rest','restructuredtext'], :filenames => [/^(.*)\.rst$/,/^(.*)\.rest$/], :mimetypes => ['text/x-rst','text/rst','text/prs.fallenstein.rst']},
                  {:fullname => "IRC logs", :keywrd => :irc, :names => ['irc'], :filenames => [/^(.*)\.weechatlog$/], :mimetypes => ['text/x-irclog','text/irclog']},
                  {:fullname => "Prolog", :keywrd => :prolog, :names => ['prolog'], :filenames => [/^(.*)\.prolog$/,/^(.*)\.pro$/,/^(.*)\.pl$/], :mimetypes => ['text/x-prolog','text/prolog']},
                  {:fullname => "CSS+Django/Jinja", :keywrd => :'css+django', :names => ['css+django','css+jinja'], :filenames => [], :mimetypes => ['text/css+django','text/css+jinja']},
                  {:fullname => "Smalltalk", :keywrd => :smalltalk, :names => ['smalltalk','squeak'], :filenames => [/^(.*)\.st$/], :mimetypes => ['text/x-smalltalk','text/smalltalk']},
                  {:fullname => "YAML", :keywrd => :yaml, :names => ['yaml'], :filenames => [/^(.*)\.yaml$/,/^(.*)\.yml$/], :mimetypes => ['text/x-yaml','text/yaml']},
                  {:fullname => "HTML+Myghty", :keywrd => :'html+myghty', :names => ['html+myghty'], :filenames => [], :mimetypes => ['text/html+myghty']},
                  {:fullname => "Makefile", :keywrd => :make, :names => ['make','makefile','mf','bsdmake'], :filenames => [/^(.*)\.mak$/,/^Makefile$/,/^makefile$/,/^Makefile.*$/,/^GNUmakefile$/], :mimetypes => ['text/x-makefile','text/makefile']},
                  {:fullname => "XSLT", :keywrd => :xslt, :names => ['xslt'], :filenames => [/^(.*)\.xsl$/,/^(.*)\.xslt$/], :mimetypes => ['text/xml','application/xml','image/svg+xml','application/rss+xml','application/atom+xml','application/xsl+xml','application/xslt+xml']},
                  {:fullname => "S", :keywrd => :splus, :names => ['splus','s','r'], :filenames => [/^(.*)\.S$/,/^(.*)\.R$/], :mimetypes => ['text/S-plus','text/S','text/R']},
                  {:fullname => "sqlite3con", :keywrd => :sqlite3, :names => ['sqlite3'], :filenames => [/^(.*)\.sqlite3-console$/], :mimetypes => ['text/x-sqlite3-console','text/sqlite3-console']},
                  {:fullname => "OCaml", :keywrd => :ocaml, :names => ['ocaml'], :filenames => [/^(.*)\.ml$/,/^(.*)\.mli$/,/^(.*)\.mll$/,/^(.*)\.mly$/], :mimetypes => ['text/x-ocaml','text/ocaml']},
                  {:fullname => "Gettext Catalog", :keywrd => :pot, :names => ['pot','po'], :filenames => [/^(.*)\.pot$/,/^(.*)\.po$/], :mimetypes => ['application/x-gettext','application/gettext','text/x-gettext','text/gettext','text/gettext']},
                  {:fullname => "Ruby", :keywrd => :rb, :names => ['rb','ruby'], :filenames => [/^(.*)\.rb$/,/^(.*)\.rbw$/,/^Rakefile$/,/^(.*)\.rake$/,/^(.*)\.gemspec$/,/^(.*)\.rbx$/], :mimetypes => ['text/x-ruby','text/ruby','application/x-ruby','application/ruby']},
                  {:fullname => "HTML+Smarty", :keywrd => :'html+smarty', :names => ['html+smarty'], :filenames => [], :mimetypes => ['text/html+smarty']},
                  {:fullname => "POVRay", :keywrd => :pov, :names => ['pov'], :filenames => [/^(.*)\.pov$/,/^(.*)\.inc$/], :mimetypes => ['text/x-povray','text/povray']},
                  {:fullname => "Ragel in CPP Host", :keywrd => :'ragel-cpp', :names => ['ragel-cpp'], :filenames => [/^(.*)\.rl$/], :mimetypes => []},
                  {:fullname => "Evoque", :keywrd => :evoque, :names => ['evoque'], :filenames => [/^(.*)\.evoque$/], :mimetypes => ['application/x-evoque','application/evoque']},
                  {:fullname => "Java Server Page", :keywrd => :jsp, :names => ['jsp'], :filenames => [/^(.*)\.jsp$/], :mimetypes => ['application/x-jsp','application/jsp']},
                  {:fullname => "ABAP", :keywrd => :abap, :names => ['abap'], :filenames => [/^(.*)\.abap$/], :mimetypes => ['text/x-abap','text/abap']},
                  {:fullname => "HTML+Mako", :keywrd => :'html+mako', :names => ['html+mako'], :filenames => [], :mimetypes => ['text/html+mako']},
                  {:fullname => "Diff", :keywrd => :diff, :names => ['diff','udiff'], :filenames => [/^(.*)\.diff$/,/^(.*)\.patch$/], :mimetypes => ['text/x-diff','text/diff','text/x-patch','text/patch']},
                  {:fullname => "Matlab session", :keywrd => :matlabsession, :names => ['matlabsession'], :filenames => [], :mimetypes => []},
                  {:fullname => "HTML+PHP", :keywrd => :'html+php', :names => ['html+php'], :filenames => [/^(.*)\.phtml$/], :mimetypes => ['application/x-php','application/php','application/x-httpd-php','application/httpd-php','application/x-httpd-php3','application/httpd-php3','application/x-httpd-php4','application/httpd-php4','application/x-httpd-php5','application/httpd-php5']},
                  {:fullname => "Python 3.0 Traceback", :keywrd => :py3tb, :names => ['py3tb'], :filenames => [/^(.*)\.py3tb$/], :mimetypes => ['text/x-python3-traceback','text/python3-traceback']},
                  {:fullname => "ANTLR With Java Target", :keywrd => :'antlr-java', :names => ['antlr-java'], :filenames => [/^(.*)\.G$/,/^(.*)\.g$/], :mimetypes => []},
                  {:fullname => "JavaScript+Ruby", :keywrd => :'js+erb', :names => ['js+erb','javascript+erb','js+ruby','javascript+ruby'], :filenames => [], :mimetypes => ['application/x-javascript+ruby','application/javascript+ruby','text/x-javascript+ruby','text/javascript+ruby','text/javascript+ruby']},
                  {:fullname => "Makefile", :keywrd => :basemake, :names => ['basemake'], :filenames => [], :mimetypes => []},
                  {:fullname => "ANTLR With Python Target", :keywrd => :'antlr-python', :names => ['antlr-python'], :filenames => [/^(.*)\.G$/,/^(.*)\.g$/], :mimetypes => []},
                  {:fullname => "cpp-objdump", :keywrd => :'cpp-objdump', :names => ['cpp-objdump','c++-objdumb','cxx-objdump'], :filenames => [/^(.*)\.cpp-objdump$/,/^(.*)\.c\+\+-objdump$/,/^(.*)\.cxx-objdump$/], :mimetypes => ['text/x-cpp-objdump','text/cpp-objdump']},
                  {:fullname => "Python 3", :keywrd => :python3, :names => ['python3','py3'], :filenames => [], :mimetypes => ['text/x-python3','text/python3','application/x-python3','application/python3']},
                  {:fullname => "Batchfile", :keywrd => :bat, :names => ['bat'], :filenames => [/^(.*)\.bat$/,/^(.*)\.cmd$/], :mimetypes => ['application/x-dos-batch','application/dos-batch']},
                  {:fullname => "ANTLR", :keywrd => :antlr, :names => ['antlr'], :filenames => [], :mimetypes => []},
                  {:fullname => "JavaScript+Django/Jinja", :keywrd => :'js+django', :names => ['js+django','javascript+django','js+jinja','javascript+jinja'], :filenames => [], :mimetypes => ['application/x-javascript+django','application/javascript+django','application/x-javascript+jinja','application/javascript+jinja','text/x-javascript+django','text/javascript+django','text/x-javascript+jinja','text/javascript+jinja','text/javascript+django','text/javascript+jinja']},
                  {:fullname => "Cython", :keywrd => :cython, :names => ['cython','pyx'], :filenames => [/^(.*)\.pyx$/,/^(.*)\.pxd$/,/^(.*)\.pxi$/], :mimetypes => ['text/x-cython','text/cython','application/x-cython','application/cython']},
                  {:fullname => "Scheme", :keywrd => :scheme, :names => ['scheme','scm'], :filenames => [/^(.*)\.scm$/], :mimetypes => ['text/x-scheme','text/scheme','application/x-scheme','application/scheme']},
                  {:fullname => "Erlang erl session", :keywrd => :erl, :names => ['erl'], :filenames => [/^(.*)\.erl-sh$/], :mimetypes => ['text/x-erl-shellsession','text/erl-shellsession']},
                  {:fullname => "Clojure", :keywrd => :clojure, :names => ['clojure','clj'], :filenames => [/^(.*)\.clj$/], :mimetypes => ['text/x-clojure','text/clojure','application/x-clojure','application/clojure']},
                  {:fullname => "Modelica", :keywrd => :modelica, :names => ['modelica'], :filenames => [/^(.*)\.mo$/], :mimetypes => ['text/x-modelica','text/modelica']},
                  {:fullname => "ANTLR With Perl Target", :keywrd => :'antlr-perl', :names => ['antlr-perl'], :filenames => [/^(.*)\.G$/,/^(.*)\.g$/], :mimetypes => []},
                  {:fullname => "Myghty", :keywrd => :myghty, :names => ['myghty'], :filenames => [/^(.*)\.myt$/,/^autodelegate$/], :mimetypes => ['application/x-myghty','application/myghty']},
                  {:fullname => "Tcl", :keywrd => :tcl, :names => ['tcl'], :filenames => [/^(.*)\.tcl$/], :mimetypes => ['text/x-tcl','text/tcl','text/x-script.tcl','text/script.tcl','application/x-tcl','application/tcl']},
                  {:fullname => "MOOCode", :keywrd => :moocode, :names => ['moocode'], :filenames => [/^(.*)\.moo$/], :mimetypes => ['text/x-moocode','text/moocode']},
                  {:fullname => "Newspeak", :keywrd => :newspeak, :names => ['newspeak'], :filenames => [/^(.*)\.ns2$/], :mimetypes => ['text/x-newspeak','text/newspeak']},
                  {:fullname => "Bash Session", :keywrd => :console, :names => ['console'], :filenames => [/^(.*)\.sh-session$/], :mimetypes => ['application/x-shell-session','application/shell-session']},
                  {:fullname => "Raw token data", :keywrd => :raw, :names => ['raw'], :filenames => [], :mimetypes => ['application/x-pygments-tokens','application/pygments-tokens']},
                  {:fullname => "C#", :keywrd => :csharp, :names => ['csharp','c#'], :filenames => [/^(.*)\.cs$/], :mimetypes => ['text/x-csharp','text/csharp']},
                  {:fullname => "TeX", :keywrd => :tex, :names => ['tex','latex'], :filenames => [/^(.*)\.tex$/,/^(.*)\.aux$/,/^(.*)\.toc$/], :mimetypes => ['text/x-tex','text/tex','text/x-latex','text/latex']},
                  {:fullname => "Cheetah", :keywrd => :cheetah, :names => ['cheetah','spitfire'], :filenames => [/^(.*)\.tmpl$/,/^(.*)\.spt$/], :mimetypes => ['application/x-cheetah','application/cheetah','application/x-spitfire','application/spitfire']},
                  {:fullname => "Objective-C", :keywrd => :'objective-c', :names => ['objective-c','objectivec','obj-c','objc'], :filenames => [/^(.*)\.m$/], :mimetypes => ['text/x-objective-c','text/objective-c']},
                  {:fullname => "JavaScript", :keywrd => :js, :names => ['js','javascript'], :filenames => [/^(.*)\.js$/], :mimetypes => ['application/x-javascript','application/javascript','text/x-javascript','text/javascript','text/javascript']},
                  {:fullname => "Common Lisp", :keywrd => :'common-lisp', :names => ['common-lisp','cl'], :filenames => [/^(.*)\.cl$/,/^(.*)\.lisp$/,/^(.*)\.el$/], :mimetypes => ['text/x-common-lisp','text/common-lisp']},
                  {:fullname => "Embedded Ragel", :keywrd => :'ragel-em', :names => ['ragel-em'], :filenames => [/^(.*)\.rl$/], :mimetypes => []},
                  {:fullname => "ActionScript 3", :keywrd => :as3, :names => ['as3','actionscript3'], :filenames => [/^(.*)\.as$/], :mimetypes => ['application/x-actionscript','application/actionscript','text/x-actionscript','text/actionscript','text/actionscript']},
                  {:fullname => "ANTLR With CPP Target", :keywrd => :'antlr-cpp', :names => ['antlr-cpp'], :filenames => [/^(.*)\.G$/,/^(.*)\.g$/], :mimetypes => []},
                  {:fullname => "JavaScript+PHP", :keywrd => :'js+php', :names => ['js+php','javascript+php'], :filenames => [], :mimetypes => ['application/x-javascript+php','application/javascript+php','text/x-javascript+php','text/javascript+php','text/javascript+php']},
                  {:fullname => "Ragel in Objective C Host", :keywrd => :'ragel-objc', :names => ['ragel-objc'], :filenames => [/^(.*)\.rl$/], :mimetypes => []},
                  {:fullname => "XML+Django/Jinja", :keywrd => :'xml+django', :names => ['xml+django','xml+jinja'], :filenames => [], :mimetypes => ['application/xml+django','application/xml+jinja']},
                  {:fullname => "ANTLR With Ruby Target", :keywrd => :'antlr-ruby', :names => ['antlr-ruby','antlr-rb'], :filenames => [/^(.*)\.G$/,/^(.*)\.g$/], :mimetypes => []},
                  {:fullname => "XML+Myghty", :keywrd => :'xml+myghty', :names => ['xml+myghty'], :filenames => [], :mimetypes => ['application/xml+myghty']}
                 ]
    return lexer_list
  end

  def self.get_lexer_by_keyword(keywrd)
    self.get_list.each do |lexer|
      return lexer if lexer[:keywrd] == leywrd.to_sym
    end
    return false
  end

  def self.get_lexer_by_filename(filename)
    self.get_list.each do |lexer|
      ext_res = lexer[:filenames].map { |z| z =~ filename }
      return lexer if ext_res.include?(0)
    end
    return false
  end

  def self.get_lexer_by_mimetype(mimetype)
    self.get_list.each do |lexer|
      if lexer[:mimetypes].include?(mimetype)
        return lexer
      end
    end
    return false
  end

end