# Duniverse transitive test deps bug

How to reproduce:

1. Clone this repo
2. Run the following:
```
duniverse pin mdx git+https://github.com/realworldocaml/mdx.git#master
duniverse init
```

Looking at the new dune-get, you'll see that it now contains test dependencies of mdx
such as alcotest:

```
-    (((dir astring.0.8.3+dune)
+    (((dir alcotest.1.1.0) (upstream https://github.com/mirage/alcotest.git)
+      (ref ((t 1.1.0) (commit 4974a9b652cbec92b9aaa71354be9a6c85d14f52)))
+      (provided_packages (((name alcotest) (version (1.1.0))))))
+     ((dir astring.0.8.3+dune)
       (upstream git://github.com/dune-universe/astring.git)
```

even though the opam file still states that it's a test dependency of mdx and not of this package:
```
$ cat duniverse/.pins/mdx.opam
opam-version: "2.0"
maintainer:   "Thomas Gazagnaire <thomas@gazagnaire.org>"
bug-reports:  "https://github.com/realworldocaml/mdx/issues"
...
depends: [
  "ocaml" {>= "4.02.3"}
  "dune" {>= "2.0"}
  "ocamlfind"
  "fmt"
  "cppo" {build}
  "astring"
  "logs"
  "cmdliner"
  "re" {>= "1.7.2"}
  "result"
  "ocaml-migrate-parsetree" {>= "1.0.6"}
  "ocaml-version" {>= "2.3.0"}
  "odoc"
  "lwt" {with-test}
  "alcotest" {with-test}
]
...
```
