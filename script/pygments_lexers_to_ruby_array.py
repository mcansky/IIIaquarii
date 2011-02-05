#!/usr/bin/env python
from pygments.lexers import get_all_lexers

for fullname, names, filenames, mimetypes in get_all_lexers():
    lst = "{:fullname => \"%s\", " % fullname
    if (names[0].find('+') > -1) or (names[0].find('-') > -1) or (names[0].find('.') > -1):
        lst += ":keywrd => :'%s', " % names[0]
    else:
        lst += ":keywrd => :%s, " % names[0]
    lst += ":names => ["
    ln = []
    for n in names:
        lns = "'%s'" % n
        ln.append(lns)
    lst += ",".join(ln)
    lst += "], :filenames => ["
    lf = []
    for n in filenames:
        if n.startswith("*."):
            lfs = "/^(.*).%s$/" % n.replace("*.", "")
        else:
            lfs = "/^%s$/" % n
        lf.append(lfs)
    lst += ",".join(lf)
    lst += "], :mimetypes => ["
    mt = []
    for n in mimetypes:
        mt.append("\'%s\'" % n)
    lst += ",".join(mt)
    lst += "]},"

    print lst
