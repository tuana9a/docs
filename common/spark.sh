spark-submit \
--class com.tuana9a.Main \
--master yarn \
--deploy-mode cluster \
--driver-memory 1G \
--executor-memory 1G \
--executor-cores 1 \
jobs/learn-spark-scala-maven-1.0.0.jar 