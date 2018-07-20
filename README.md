# XML-Parser

Basic XML Parser on pure ruby

# Usage
```
ruby main.rb -f path/to/file -x xpath -c command -o optional
```
Commands:

* create - this command will create new node on provided xpath, with optional content (Example: ```ruby main.rb -f file.xml -x /foo/bar -c create -o baz``` will create bar node as a child to foo node with content baz)

* edit - this command will edit node on provided xpath and change it text to provided optional argument (Example: ```ruby main.rb -f file.xml -x /bar -c edit -o baz``` will change text content of bar node to baz)

* delete - this command will delete node provided by xpath (Example: ```ruby main.rb -f file.xml -x /bar -c delete``` will delete bar node)

* show - this command will text content node(s) provided by xpath
