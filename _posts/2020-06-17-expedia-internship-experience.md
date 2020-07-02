---
layout: post
title:  "The Virtual Internship: My Experience"
date:   2020-06-17 16:00:00 +0530
comments: true
hide: true
categories: Internship
image:  images/previews/expedia-preview.png
toc: true
stack:  
  - aspect: "1"
    image_path: "images/expedia/stack/mongodb.svg"
  - aspect: "1"
    image_path: "images/expedia/stack/spark.svg"
  - aspect: "1"
    image_path: "images/expedia/stack/sbt.svg"
    end_row: "true"
  - aspect: "1"
    image_path: "images/expedia/stack/vault.svg"
  - aspect: "1"
    image_path: "images/expedia/stack/terraform.svg"
  - aspect: "1"
    image_path: "images/expedia/stack/consul.svg"
  - aspect: "1"
    image_path: "images/expedia/stack/packer.svg"
    end_row: "true"
  - aspect: "1"
    image_path: "images/expedia/stack/ec2.jpg"
  - aspect: "1"
    image_path: "images/expedia/stack/parquet.png"
  - aspect: "1"
    image_path: "images/expedia/stack/scala.png"
  - aspect: "1"
    image_path: "images/expedia/stack/s3.png"
setup:
  - aspect: "1"
    image_path: "images/expedia/experience/setup-1.jpg"
  - aspect: "0.74"
    image_path: "images/expedia/experience/setup-2.jpg"
---
These summers, I interned at a one of the largest travel companies of the world, Expedia. Who knew during a pandemic when travel is at an all time low, Expedia had a great intern program planned for us!

Luckily, my [previous intern]({{ site.baseurl }}/gsoc/2019/08/12/GSoC-with-VideoLAN.html) was remote too, so I was kind of used to work from home. In this internship, I majorly worked on cloud and data engineering.

![]({{ site.baseurl }}/images/previews/expedia-preview.png "Our kickoff call on the first day")

## The induction week

Expedia organized an induction week for us, and it involved workshops on various topics: how to become a better leader, designer, and we even got to know how Expedia operates.
We kept on having workshops throughout our intern, and there was a lot to learn, so much that I wrote a separate blog [about it]({{ site.baseurl }}/internship/2020/06/14/expedia-internship-learning.html) :grin:.

## My setup

{% include flexgallery id="setup" caption="Not the fanciest setup out there, but enough to get the work done :)"%}

## My Team - Vrbo: Stayx dot net modernization pod

I was a part of the stay experience team, which looks after the post-booking experience for a traveler. The team was divided into pods, and I worked on the .Net Stack Modernisation pod. I  worked on making a microservice and how to deploy it to the cloud.

## The project

### Motivation

We have a database which stores the notifications for guests of guests in a homestay. Now we wanted a way in which we can store the data in S3 and keep it updated.

- Why are you storing the data in two different places?
  - This data is not only used to send a notification but also by an analyst or data scientist. The MongoDB database also backs the GoG API, and if everyone does their operations on MongoDB, it might severely affect the API.

We finally came up with the idea to use a  Spark Job. This job would take the data from MongoDB and store it in an S3 bucket.

- Why a spark job?
  - Spark and Scala are the industry standard for data management. The jobs will be able to manage huge amounts of data without any hiccups.

### Aim: Create a spark job to sync data from MongoDB to S3
<!-- [The ticket SE-2854](https://jira.homeawaycorp.com/browse/SE-2854) -->

### A quick revision

This blog is going to get more technical now, just keeping this for a quick reference if you have a doubt.

**What's MongoDB?**  It's a NoSQL database.  
**What's scala?**  It's a programming language widely used for data management. I did all my coding in the Scala language.  
**What's Apache spark?**  It's a fast and general-purpose cluster computing system for large scale data processing. Some important things to know about spark are:

- Dataframe: This is data in the form of a table, just like a relational database table.
- Dataset: Extension of Dataframes, they provide the functionality of being type-safe and an object-oriented programming interface.
- SparkSession vs SparkContext: Spark session is a unified entry point of a spark application from Spark 2.0. It provides a way to interact with various spark’s functionality with a lesser number of constructs. Instead of having a spark context, hive context, SQL context, now all of it is encapsulated in a Spark session
- Prior Spark 2.0, Spark Context was the entry point of any spark application and used to access all spark features and needed a sparkConf which had all the cluster configs and parameters to create a Spark Context object  

**What's a spark job?**  In a spark application, when you invoke an action on RDD, a job is created. It's the main function that has to be done and submitted to spark.  
**What's a vault?**  Hashicorp Vault is a tool for secrets management, encryption as a service, and privileged access management.  
**What's an S3 bucket?**  Just a simple distributed file storage system, think of it like the hard disk on your computer
{% include flexgallery id="stack" caption="The technology stack"%}

### Approach

<div class="mxgraph" style="max-width:100%;border:1px solid transparent;margin: auto;" data-mxgraph="{&quot;highlight&quot;:&quot;#0000ff&quot;,&quot;nav&quot;:true,&quot;resize&quot;:true,&quot;toolbar&quot;:&quot;zoom layers lightbox&quot;,&quot;edit&quot;:&quot;_blank&quot;,&quot;xml&quot;:&quot;&lt;mxfile host=\&quot;app.diagrams.net\&quot; modified=\&quot;2020-06-28T07:51:30.216Z\&quot; agent=\&quot;5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36\&quot; etag=\&quot;-2Ve7WmWmoMpoH2KV3nx\&quot; version=\&quot;13.3.5\&quot; type=\&quot;google\&quot;&gt;&lt;diagram id=\&quot;w-l4qnf0UAVcy5WlwC9E\&quot; name=\&quot;Page-1\&quot;&gt;zZdRb9owEMc/DY+bkphA9lgoME2tJg1pffaSI0lxfJHjENinn00cgptAW4l0fQr++yzbv/vfyYzIPNuvBM2TR4yAjTwn2o/I/cjzXIcE6qOVQ634gVMLsUgjE9QK6/QvNCuNWqYRFFagRGQyzW0xRM4hlJZGhcDKDtsgs3fNaQwdYR1S1lWf0kgmtRr4Tqt/hzROmp1dx8xktAk2QpHQCKsziSxGZC4QZf0r28+BaXgNl3rd8sLs6WACuHzLgtV2FXr5r9lTtQ5/0p27Xx7CLyY7O8pKc2FzWHloCECkgJghCplgjJyyRavOBJY8Ar2No0ZtzANirkRXic8g5cFkl5YSlZTIjJnZDXJpJt1Ajesz6I0v3tVIBZYihCsXbDxDRQzyStz4lBFlZcAMpDiodQIYlenOPgc1nopPcS129cOQf0cW3E4WHpHHeD/rJKNFrblVSSphndMjgUoVoI2VitBQDS5C3oGQsL+OuYvFLDh52xS3R6Zf/Vqp2mI5lURyVijEH4plF+ZnsDTw6E63IzXmyKFWlqm+23GLG1ree6PlJ//T8t7rWXqX12NGi8KwLLYgw8QM7CK4genJ2Da9+83pWn7aY3mXOAPBJB2YCpTYKukH/rnC1Xmd60ZZdI4MRWvcQgrcwgtxgO5CJr4NOugB7fWAngzFedzhvFIVpuBCKEAW+n0hMFOf37Rk8pbN+xY4fRunR3pwjvta9VA4/Q7OB9honndcpurzjCnX+/JIv6dAtbNPh3RsI532IfU+EOmk2wlUc3BmZbiFmxpygHr3yUe+JtSwfXsf587+wZDFPw==&lt;/diagram&gt;&lt;/mxfile&gt;&quot;}"></div>
<script type="text/javascript" src="https://app.diagrams.net/js/viewer.min.js"></script>

The spark job

- authenticates the vault and gets the secrets
- reads the updated data from MongoDB
- reads the data stored as parquet in S3 bucket
- does a left anti join on s3 and mongo data, you now have the data that did not change
- merge the data that didn't change with the new data with the new data
- write the data as parquet in S3 bucket

The authentication was a little better than just sending a saved token:

- Grab the EC2 metadata and nonce
- Send the metadata and nonce to Vault
- Vault checks if the EC2 instance is allowed and the nonce is correct
- Obtain secrets like AWS access and secret key, and MongoDB password
- Send a nonce to the Vault server and get the token
- Get the secrets via the token

Himanshu(My manager) explained me the approach with a nice example:

```text
Mongo
id author book updateTime
1 A1     B1     T1
2   A2     B2     T2
3   A3     B3     T3
4   A4     B4     T4
S3
1   A1     B1     T1
2   A2     B2     T2
3   A3     B3     T2.1
Step 1:
get all docs from mongoDb between updateTime1 and updateTime2 where T2 < updateTime1 < updateTime2
fetched records:
3   A3     B3     T3
4   A4     B4     T4
Step 2:
read all records from S3.
fetched records:
1   A1     B1     T1
2   A2     B2     T2
3   A3     B3     T2.1
Step 3:
Left anti join on id between S3 and mongo data so that we have the data that did not change
1   A1     B1     T1
2   A2     B2     T2
Step 4:
Merge results of Step 3 with data fetched in Step 1:
new data set:
1   A1     B1     T1
2   A2     B2     T2
3   A3     B3     T3
4   A4     B4     T4
This can be put back to S3. You can see how this data is in sync with Mongo data
```

### Challenges (and how I tackled them)

![]({{ site.baseurl }}/images/expedia/experience/intellij-meme.jpg){:.meme}

- **VPN Issues:** The VPN I was using did not support Linux or [WSL](https://github.com/microsoft/WSL/issues/5068), so I had to work on windows. Windows is not at all developer-friendly. It was challenging to find a workaround for one-line commands in Linux.
  - However, I found a hack for this. I created an EC2 instance on the Expedia network and shifted all my work to that. Not only I could access all the links, but the scripts ran much faster than on my computer.
- **RAM Issues:** I initially was using IntelliJ since it was easier to setup a scala project with it. Intellij was terribly slow and took a lot of RAM.
  - I later switched to VSCode plus Metals. Although it was a little more time consuming to setup, once understood, all RAM issues were solved, additionally using bloop instead of sbt decreased compile time.
  - Having a local MongoDB server for testing was also quite RAM hungry, MongoDB Atlas helped me a lot here. I deployed a free cluster in the cloud, and my work was done :)
- **Spark and MongoDB**
  - Spark has some underlying concepts which were a little nontrivial to understand, at least for a first-timer like me. Above that the documentation of MongoDB-Spark connector was following old spark conventions at one place and new ones somewhere else. The documentation confused me a bit.
- **Understanding Vault EC2 authentication**
  - Authentication took most of the time, being a college student, I really didn't worry about securing my applications in projects. Since we really didn't put something into production.
  - I learned about Hashicorp Vault(Store secrets), Terraform(Build instances from code) and Consul(Backend for Vault)
  - Rather than having a token to authenticate vault and get the secrets, a better method would be to use the ec2 metadata in which the spark job will be running to authenticate vault.
  - Making EC2 instances with Terraform and Consul
- **Setting up EC2 instances**
  - I had some trouble finding the correct configurations so that I am able to SSH into an instance and make sure the instance can access all VPN links.

### Demo

Video: Coming soon.

### Next Steps

- Clean code, make pull requests.
- Try to get the code into production.

## References

### Generic

- [WSL2 , problem with network connection when VPN used (PulseSecure) · Issue #5068 · microsoft/WSL](https://github.com/microsoft/WSL/issues/5068)
- [Stop and remove all docker containers and images \| The humble developer](https://blog.baudson.de/blog/stop-and-remove-all-docker-containers-and-images)
- [Creating a MongoDB replica set using Docker 🍃](https://www.sohamkamani.com/blog/2016/06/30/docker-mongo-replica-set/)
- [Slack/Jira integration: How do I post comments to issues, from Slack?](https://community.atlassian.com/t5/Jira-Core-questions/Slack-Jira-integration-How-do-I-post-comments-to-issues-from/qaq-p/951175)

### Task1 : Mongo change streams to S3 via Kafka

- [What is Apache Kafka®? (A Confluent Lightboard by Tim Berglund)](https://www.youtube.com/watch?v=06iRM1Ghr1k)
- [What is Database Sharding?](https://www.youtube.com/watch?v=5faMjKuB9bc)
- [edenhill/kafkacat: Generic command line non-JVM Apache Kafka producer and consumer](https://github.com/edenhill/kafkacat)
- [Mongo Kafka connector docs](https://docs.mongodb.com/kafka-connector/master/kafka-source/)
- [Getting Started with the MongoDB Connector for Apache Kafka and MongoDB](https://www.confluent.io/blog/getting-started-mongodb-connector-for-apache-kafka-and-mongodb/)
- **Kafka Demo**: [Confluent Platform Demo (cp-demo) — Confluent Platform](https://docs.confluent.io/current/tutorials/cp-demo/docs/index.html?utm_source=github&amp;utm_medium=demo&amp;utm_campaign=ch.cp-demo_type.community_content.cp-demo)
- **What are change streams?**
  - Change streams, a feature introduced in MongoDB 3.6, generate event documents that contain changes to data stored in MongoDB in real-time and provide guarantees of durability, security, and idempotency. You can configure change streams to observe changes at the **collection** , **database** , or **deployment** level. See [An Introduction to Change Streams](https://www.mongodb.com/blog/post/an-introduction-to-change-streams) for more information.
- [Using Change Streams to Keep Up with Your Data](https://www.youtube.com/watch?v=eBGC6z1fPs0)
- **MongoDB kafka guide**
  - [Getting Started with the MongoDB Connector for Apache Kafka and MongoDB](https://www.confluent.io/blog/getting-started-mongodb-connector-for-apache-kafka-and-mongodb/)
  - [Getting started with the MongoDB Connector for Apache Kafka and MongoDB Atlas](https://www.mongodb.com/blog/post/getting-started-with-the-mongodb-connector-for-apache-kafka-and-mongodb-atlas)
  - [https://stackoverflow.com/questions/57544201/implement-dockerized-kafka-sink-connector-to-mongo/57629665#57629665](https://stackoverflow.com/questions/57544201/implement-dockerized-kafka-sink-connector-to-mongo/57629665#57629665)
  - [mongodb/mongo-kafka: MongoDB Kafka Connector](https://github.com/mongodb/mongo-kafka)

### Task2: Create a scala job

- [What is a spark session?](https://medium.com/@achilleus/spark-session-10d0d66d1d24#:~:text=Spark%20session%20is%20a%20unified,encapsulated%20in%20a%20Spark%20session.)
- [What is Scala?](https://www.youtube.com/watch?v=CTRBv45F5I0)
- [Apache Spark™ - Unified Analytics Engine for Big Data](https://spark.apache.org/)
- [Running scala code](http://joelabrahamsson.com/learning-scala-part-three-executing-scala-code/#:~:text=The%20easiest%20way%20to%20execute,folder%20where%20Scala%20is%20installed.)
- [Scala Tutorial 2 - Introduction to SBT (Scala Build Tool)](https://www.youtube.com/watch?v=GD4qyXACuTc)
- [Setup Spark Development Environment – IntelliJ and Scala \| Kaizen](https://kaizen.itversity.com/setup-development-environment-intellij-and-scala-big-data-hadoop-and-spark/)
- [Reference code:](https://github.homeawaycorp.com/AnalyticsEngineering/ae-fast-data-analytics/blob/master/jobs/booking_fact/src/main/scala/com/homeaway/analyticsengineering/task/BookingLifetimeFactLoad.scala#L102-L106)
- [nscala-time/nscala-time: A new Scala wrapper for Joda Time based on scala-time](https://github.com/nscala-time/nscala-time)
- [how can I save an isodate field using MongoSpark.save from mongodb spark connector v2.1?](https://stackoverflow.com/questions/48889946/how-can-i-save-an-isodate-field-using-mongospark-save-from-mongodb-spark-connect)
- [https://spark.apache.org/docs/latest/sql-programming-guide.html#data-types](https://spark.apache.org/docs/latest/sql-programming-guide.html#data-types)
- [How to Master Anti Joins and Apply Them to Business Problems](https://mode.com/blog/anti-join-examples/)
- [MongoDB and Apache Spark - Getting started tutorial](https://www.raphael-brugier.com/blog/mongodb-apache-spark-getting-started-tutorial/)
- [https://docs.databricks.com/data/data-sources/read-parquet.html#reading-parquet-files-notebook](https://docs.databricks.com/data/data-sources/read-parquet.html#reading-parquet-files-notebook)
- [Spark Read and Write Apache Parquet file — Spark by {Examples}](https://sparkbyexamples.com/spark/spark-read-write-dataframe-parquet-example/)
- [Left Anti join in Spark?](https://stackoverflow.com/questions/43186888/left-anti-join-in-spark)
- [Spark DataFrame Union and UnionAll — Spark by {Examples}](https://sparkbyexamples.com/spark/spark-dataframe-union-and-union-all/)
- [SQL A left join B, just A?](https://stackoverflow.com/questions/53949197/isnt-sql-a-left-join-b-just-a/53949327)
- [Install hadoop in 5 steps](http://www.praveenkumarg.com/install-hadoop-with-spark-on-windows-in-just-5-steps/)
- [Spark s3](https://docs.cloudera.com/documentation/enterprise/latest/topics/spark_s3.html)
- [PaaS](https://www.channelfutures.com/strategy/a-multi-paas-strategy-have-your-paas-and-eat-it-too)
- [Setup scala project with Metals and Bloop (Much better than intellij!)](https://scalameta.org/metals/docs/editors/vscode.html#gitignore-projectmetalssbt-metals-and-bloop)
- [blog for scala and bloop](https://medium.com/@afsal.taj06/scala-with-bloop-and-metals-7bfc411502a6)
- [Scala and Sbt using the command line](https://docs.scala-lang.org/getting-started/sbt-track/getting-started-with-scala-and-sbt-on-the-command-line.html)
- [Overwrite a parquet file you just read](https://stackoverflow.com/questions/58013126/how-to-overwrite-a-parquet-file-from-where-dataframe-is-being-read-in-spark)
- [https://github.expedia.biz/scala-platform/ha-scala-commons/tree/master/container/config/config-server-aws-vault/src/main/scala/com/homeaway/hascala/container/config/aws](https://github.expedia.biz/scala-platform/ha-scala-commons/tree/master/container/config/config-server-aws-vault/src/main/scala/com/homeaway/hascala/container/config/aws)
- [https://stackoverflow.com/questions/41253309/connect-to-spark-running-on-vm](https://stackoverflow.com/questions/41253309/connect-to-spark-running-on-vm)
- [What is Qubole?](https://www.youtube.com/watch?v=SBxNXKhwEX8)
- [What is data lake?](https://www.youtube.com/watch?v=v3yv88h68GY)
- [Vault secrets-Wiki](https://wiki.homeawaycorp.com/display/PTA/Vault+Secrets+Integration+for+Qubole+Spark+Jobs)
- [https://www.vaultproject.io/api-docs/auth/aws](https://www.vaultproject.io/api-docs/auth/aws)
- [Ec2 auth vault](https://blog.gruntwork.io/a-guide-to-automating-hashicorp-vault-2-authenticating-with-instance-metadata-c3f9eaeaba53)
- [Vault docs AWS](https://www.vaultproject.io/docs/auth/aws)
- [Link local addresses](https://en.wikipedia.org/wiki/Link-local_address)
- [MicroNugget: What are AWS EC2 Key Pairs?](https://www.youtube.com/watch?v=lMdin-L08p4)
- [Vault on AWS: Creating an EC2 Key Pair](https://www.youtube.com/watch?v=F1KC0khe4SU&amp;t=31s)
- [terraform variable configuration](https://www.terraform.io/docs/configuration/variables.html)
- [terraform setup](https://www.youtube.com/watch?v=RA1mNClGYJ4&t=887s)
