# quick list of XQuery commands

## Cheat Sheet

This list of commands can be used in the Query Console that is available at:  `http://[yourhostname]:8000`

`doc()` - return a list of documents in the database

`cts:search(/,'')` - browse the list of documents in the database 

`xdmp:directory("/", "infinity")` - return a list of all of the documents

`for $x in xdmp:directory("/stations/","1") return xdmp:document-delete(fn:document-uri($x))` - delete all of the documents at a uri
