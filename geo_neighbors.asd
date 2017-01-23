(defsystem :geo_neighbors
  :description "Define neighbors"
  :author "Dan Loaiza <papachan@gmail.com>"
  :license "MIT"
  :depends-on (:cl-who
               :hunchentoot
               :parenscript
               :smackjack)
  :components ((:module "src"
                :serial t
                :components
                ((:file "geohash")
                 (:file "server")))))
