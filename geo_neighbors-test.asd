(asdf:defsystem #:geo_neighbors-test
  :author "@papachan <papachan@gmail.com>"
  :license "MIT"
  :description ""
  :depends-on (:geo_neighbors
               :drakma
               :cl-json
               :fiveam)
  :components ((:module "t"
                :serial t
                :components
                ((:file "package-test")
                 (:file "geohash-test")
                 (:file "web-test")))))
