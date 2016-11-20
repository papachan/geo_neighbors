(defsystem :geo_neighbors
  :description "Define neighbors"
  :author "Dan Loaiza <papachan@gmail.com>"
  :license "MIT"
  :depends-on (:drakma)
  :components ((:module "src"
                :serial t
                :components
                ((:file "geohash")))))
