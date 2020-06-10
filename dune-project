(lang dune 2.5)

(generate_opam_files true)

(package
  (name foo)
  (synopsis "A dummy package to showcase a duniverse bug")
  (depends
   fpath
   (mdx :with-test)))
