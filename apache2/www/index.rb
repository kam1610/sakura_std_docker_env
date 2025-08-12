#!/usr/bin/env ruby
require('cgi');
cgi = CGI.new();

#

query_result = `mysql -h mysql8 -uuser00 -ppassword00 -e "USE mydb; SELECT * from mytable;" -B -N`;

print("Content-type: text/html\n\n");
print("<html><body>\n");
print("<p>Query string: #{cgi.params}</p>\n");

query_result.each_line{|l|
  l = l.strip().split("\t");
  print("<div>id: #{l[0]}, value: #{l[1]}</div>\n");
}

print("</body></html>");
