spark-submit \
--class com.tuana9a.Main \
--master yarn \
--deploy-mode cluster \
--driver-memory 1G \
--executor-memory 1G \
--executor-cores 4 \
learn-spark-scala-maven-0.0.1.jar \
TestParquet 7