#!/usr/bin/env bb

(require '[babashka.fs :as fs])
(slurp "~/nd/resources/devops/dev/manifest.json")
#_(def now (java.time.ZonedDateTime/now))
#_(def LA-timezone (java.time.ZoneId/of "America/Los_Angeles"))
#_(def LA-time (.withZoneSameInstant now LA-timezone))
#_(def pattern (java.time.format.DateTimeFormatter/ofPattern "HH:mm"))
#_(println (.format LA-time pattern))
