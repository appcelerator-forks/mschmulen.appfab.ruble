require 'ruble'

bundle do |bundle|
  bundle.display_name = 'APPFAB'
  bundle.name = "Application Fabricator for Titanium"
  bundle.author = "Matt Schmulen"
#  bundle.repository = "git://github.com/aptana/rails.ruble.git"
    
    bundle.menu "Titanium APPFAB" do | fabricator_menu|
      fabricator_menu.scope = [ "app.js", "*.js"]
      
      fabricator_menu.menu "Insert factory" do | goto_menu |
        goto_menu.command "insert YACK"
        goto_menu.command "insert FOO"
        goto_menu.seperator
        goto_menu.command "YACK C"
        goto_menu.command "YACK D"
        goto_menu.command "YACK E"
        goto_menu.seperator
      end 
    end
end


# ********************************************************
# Snippets: 
# ********************************************************

# insert some code
#snippet "My Insert Snippet" do |snip|
#  snip.trigger = "foo"
#  snip.expansion = "snippet code to be inserted "
#end

# execute a shell command
#snippet "My shell Snippet" do |s|
#  s.trigger = "foo"
#  s.expansion = "${1:method_name}: function(${2:attribute}){}"
#end

# API Snippets for functional enclosures 
snippet "function" do |s|
  s.trigger = "API."
  s.scope = "*.js"
  s.expansion = "$1 = function(opts){ \n\n };"
end


# ********************************************************
# Commands: 
# ********************************************************

# ********************************************************
# COMMAND+3 WindowFactories 
# ********************************************************

command 'Chess' do |cmd|
  #cmd.scope = '*.js'
  cmd.key_binding = "Control+3"
  cmd.key_binding.mac = "Command+3"
  #cmd.key_binding = "M1+M3+Q C" # Multiple key stroke key binding
  
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do |context|
    
    input = STDIN.read
    input << "\n"
    input << IO.read("#{File.dirname(ENV['TM_BUNDLE_SUPPORT'])}/factoryWindow/chess.js")
    input << "\n"
  end
end

command 'BouncingBall' do |cmd|
  #cmd.scope = '*.js'
  cmd.key_binding = "Control+3"
  cmd.key_binding.mac = "Command+3"
  #cmd.key_binding = "M1+M3+Q C" # Multiple key stroke key binding
  
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do |context|
    
    input = STDIN.read
    input << "\n"
    input << IO.read("#{File.dirname(ENV['TM_BUNDLE_SUPPORT'])}/factoryWindow/bouncingBalls.js")
    input << "\n"
  end
end

command 'TableView' do |cmd|
  #cmd.scope = '*.js'
  cmd.key_binding = "Control+3"
  cmd.key_binding.mac = "Command+3"
  #cmd.key_binding = "M1+M3+Q C" # Multiple key stroke key binding
  
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do |context|
    
    input = STDIN.read
    input << "\n"
    input << IO.read("#{File.dirname(ENV['TM_BUNDLE_SUPPORT'])}/factoryWindow/tableView.js")
    input << "\n"
  end
end

command 'MapView' do |cmd|
  #cmd.scope = '*.js'
  cmd.key_binding = "Control+3"
  cmd.key_binding.mac = "Command+3"
  #cmd.key_binding = "M1+M3+Q C" # Multiple key stroke key binding
  
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do |context|
    
    input = STDIN.read
    input << "\n"
    input << IO.read("#{File.dirname(ENV['TM_BUNDLE_SUPPORT'])}/factoryWindow/map.js")
    input << "\n"
  end
end



command 'Twitter' do |cmd|
  #cmd.scope = '*.js'
  cmd.key_binding = "Control+3"
  cmd.key_binding.mac = "Command+3"
  #cmd.key_binding = "M1+M3+Q C" # Multiple key stroke key binding
  
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do |context|
    
    input = STDIN.read
    input << "\n"
    input << IO.read("#{File.dirname(ENV['TM_BUNDLE_SUPPORT'])}/factoryWindow/twitter.js")
    input << "\n"
  end
end


#newWindow
command 'new Win+ new Tab' do |cmd|
  #cmd.scope = '*.js'
  cmd.key_binding = "Control+3"
  cmd.key_binding.mac = "Command+3"
  #cmd.key_binding = "M1+M3+Q C" # Multiple key stroke key binding
  
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do |context|
    
    className = STDIN.read
    input = STDIN.read
    
    input << "var win"+className+" = Titanium.UI.createWindow({   \n"
    input << "  title:'"+className+"', \n"
    input << "  backgroundColor:'#fff'  \n"
    input << "}); \n"
    
    input << "var tab"+className+" = Titanium.UI.createTab({   \n"
    input << "  icon:'KS_nav_views.png',  \n"
    input << "  title:'"+className+"', \n"
    input << "  window:win"+className+" \n"
    input << "});  \n"
    input << "\n"
    input << "tabGroup.addTab(tab"+className+");\n"
  end
end



# ********************************************************
# COMMAND+1
# ********************************************************

#closures
command 'js encapsulate' do |cmd|
  #cmd.scope = '*.js'
  cmd.key_binding = "Control+1"
  cmd.key_binding.mac = "Command+1"
  #cmd.key_binding = "M1+M3+Q C" # Multiple key stroke key binding
  
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do |context|
    
    className = STDIN.read
    input = STDIN.read
    
    input << "var " + className + " = (function() {\n"
    input << "  \n"
    input << "  var API = { }; \n"
    input << "  \n"
    input << "  var myPrivateVar ='private'; \n"
    input << "  function myPrivateFunction(){  };\n "
    input << "  \n"
    input << "  API.myPublicVar = 'hello' \n"
    input << "  \n"
    input << "  API.factoryView"+className+" = function(opts){ \n"
    input << "    var topView = Ti.UI.createView({});\n"
    input << "    \n"
    input << "    return topView; \n"
    input << "  };\n"
    input << "  \n"    
    input << "  API.factoryWindow"+className+" = function(opts){ \n"
    input << "     var win = Ti.UI.createWindow({title:'"+className+"'}); \n"
    input << "     win.addChild( factoryView"+className+"( options ) ); \n"
    input << "     return win; \n"
    input << "  };\n"
    input << "  \n"
    input << "  return API;\n"
    input << "})(); //end " + className
    input << "  \n"
    input << "//Ti.UI.currentWindow.add( "+className+".factoryView"+className+"({}) ); \n"
    input << "//"+className+".factoryWindow"+className+"({}).addChild( "+className+".factoryView"+className+"({}) ).open({modal:true}); \n"
    input << "  \n"
    
  end
end


# Window factories
command 'factory factoryWindowEmpty' do |cmd|
  cmd.key_binding = "Control+2"
  cmd.key_binding.mac = "Command+2"
  
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :line
  cmd.invoke do |context|
    winName = STDIN.read
    input = STDIN.read
    input << "var " + winName + " = APP.UI.factoryWindowEmpty({ parentTab:APP.tabs[3].tabRef });  \n"    
  end
end


#command 'format HTML' do |cmd|
  #cmd.scope = '*.js'
#  cmd.key_binding = "Control+1"
#  cmd.key_binding.mac = "Command+1"
  #cmd.key_binding = "M1+M3+Q C" # Multiple key stroke key binding
  
#  cmd.output = :insert_as_snippet
#  cmd.input = :selection, :line
#  cmd.invoke do |context|
#    input = STDIN.read
#    input.gsub(/[\$`\\]/, '\\1').gsub(/([ \t]*)(.+)/, '\1<${1:li}>\2</${1:li}>')
#  end
#end


#command 'insert FOO' do |cmd|
  #cmd.scope = '*.js'
  
#  cmd.key_binding = "Control+H"
#  cmd.key_binding.mac = "Command+H"
  
#  cmd.output = :insert_as_snippet
#  cmd.input = :selection, :line
#  cmd.invoke do |context|
#    input = STDIN.read
#    input.gsub(/[\$`\\]/, '\\1').gsub(/([ \t]*)(.+)/, '\1<${1:li}>\2</${1:li}>')
#  end
#end



#command "Open Image" do |cmd|
#  cmd.scope = "*.js"
  
  #cmd.key_binding = "Control+H"
  #cmd.key_binding.mac = "Command+H"
  
#  cmd.input = [ :selection, :word ]
#  cmd.output = :show_as_html
  
#  cmd.invoke do |context|
#    url = "http://apidock.com/rails/search/quick?query=" + CGI.escape(context.input)
#    context.browser.open url, :new_window => true
#  end
#end


# ********************************************************
# Project templates: Titanium Mobile Project Templates
# ********************************************************


project_template "TitaniumTab Project Template github" do |t|
  t.type = :titanium_mobile
  t.location = "git@github.com:mschmulen/tiTemplateTab.git"
  t.description = "Remote template. Requires network access."
end

project_template "APPFAB Template local" do |t|
  t.type = :titanium_mobile
  t.location = "templates/AppFabTemplate.zip"
  t.description = "A basic tab template which includes app.js and MAIN.js file"
end



# ********************************************************
# APP TEMPLATES
# ********************************************************

# APP FAB App, Template for creating a APP FAB APP
# - Functional encapsoltaion, factory implementatoin for UI, model and services modular architecture
# - 4 Tab App (   )
# - 
project_template "APPFAB App - Appliction Fabricator Project Template local" do |t|
  t.type = :titanium_mobile
  t.location = "templates/appFabTemplate.zip"
  t.description = "Template fro creating an APP FAB APP"
end


# ********************************************************
# File templates: Titanium Mobile Javascript Templates
# ********************************************************



# FACTORY templates for creating windows
template "factory chessWindow" do |t|
  t.filetype = "*.js"
  
  t.invoke do |context|
    ENV['TM_DATE'] = Time.now.strftime("%Y-%m-%d")
    raw_contents = IO.read("#{File.dirname(ENV['TM_BUNDLE_SUPPORT'])}/templates/factoryWindowTemplates/chessWindow.js")
    raw_contents.gsub(/\$\{([Creating a new template^}]*)\}/) {|match| ENV[match[2..-2]] }
  end
end

template "factory imageViewWindow" do |t|
  t.filetype = "*.js"
  t.invoke do |context|
    ENV['TM_DATE'] = Time.now.strftime("%Y-%m-%d")
    raw_contents = IO.read("#{File.dirname(ENV['TM_BUNDLE_SUPPORT'])}/templates/factoryWindowTemplates/imageViewWindow.js")
    raw_contents.gsub(/\$\{([Creating a new template^}]*)\}/) {|match| ENV[match[2..-2]] }
  end
end

template "factory mapsWindow" do |t|
  t.filetype = "*.js"
  t.invoke do |context|
    ENV['TM_DATE'] = Time.now.strftime("%Y-%m-%d")
    raw_contents = IO.read("#{File.dirname(ENV['TM_BUNDLE_SUPPORT'])}/templates/factoryWindowTemplates/mapsWindow.js")
    raw_contents.gsub(/\$\{([Creating a new template^}]*)\}/) {|match| ENV[match[2..-2]] }
  end
end

template "factory pickerWindow" do |t|
  t.filetype = "*.js"
  t.invoke do |context|
    ENV['TM_DATE'] = Time.now.strftime("%Y-%m-%d")
    raw_contents = IO.read("#{File.dirname(ENV['TM_BUNDLE_SUPPORT'])}/templates/factoryWindowTemplates/pickerWindow.js")
    raw_contents.gsub(/\$\{([Creating a new template^}]*)\}/) {|match| ENV[match[2..-2]] }
  end
end

template "factory tableViewWindow" do |t|
  t.filetype = "*.js"
  t.invoke do |context|
    ENV['TM_DATE'] = Time.now.strftime("%Y-%m-%d")
    raw_contents = IO.read("#{File.dirname(ENV['TM_BUNDLE_SUPPORT'])}/templates/factoryWindowTemplates/tableViewWindow.js")
    raw_contents.gsub(/\$\{([Creating a new template^}]*)\}/) {|match| ENV[match[2..-2]] }
  end
end

template "factory tableView twitterWindow" do |t|
  t.filetype = "*.js"
  t.invoke do |context|
    ENV['TM_DATE'] = Time.now.strftime("%Y-%m-%d")
    raw_contents = IO.read("#{File.dirname(ENV['TM_BUNDLE_SUPPORT'])}/templates/factoryWindowTemplates/twitterWindow.js")
    raw_contents.gsub(/\$\{([Creating a new template^}]*)\}/) {|match| ENV[match[2..-2]] }
  end
end
