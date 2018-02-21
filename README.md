# rr.rb
rubyのシンプルなrepl

使い方
```
$ rr
> 1+1
2
> p "あいう"
"あいう"
"あいう"
> ^D
$
```

```
$ rr yaml
require yaml
=> true
require csv
=> true
> YAML.dump([1, 2, 3])
"---\n" + "- 1\n" + "- 2\n" + "- 3\n"
> puts YAML.dump([1, 2, 3])
---
- 1
- 2
- 3
nil
> ^D
$
```
