# Kibana

<p align="center">
<img src="https://static.wixstatic.com/media/bcaf64_9dbbfe8192a7418e991ef07586055394~mv2.png"/>
</p>

### Kibana : window into Elasticsearch

Kibana is a free and open frontend application that sits on top of the Elastic Stack, providing search and data visualization capabilities for data indexed in Elasticsearch. Commonly known as the charting tool for the Elastic Stack (previously referred to as the ELK Stack after Elasticsearch, Logstash, and Kibana), Kibana also acts as the user interface for monitoring, managing, and securing an Elastic Stack cluster — as well as the centralized hub for built-in solutions developed on the Elastic Stack.<br/>
Developed in 2013 from within the Elasticsearch community, Kibana has grown to become the window into the Elastic Stack itself, offering a portal for users and companies. 

Kibana allows users to realize the operations that can be done via Elasticsearch REST API, searches, aggregations but also to create charts and dashboards. It offers the ability to monitor the cluster.<br/>

<p align="center">
<img src="https://static-www.elastic.co/v3/assets/bltefdd0b53724fa2ce/blt4810b2ec2998fbd6/5ca68a5fce43ee1933311a16/reporting_no_zoom-optimized.gif"/>
</p>

* **Search, observe, and protect.** From discovering documents to analyzing logs to finding security vulnerabilities, Kibana is your portal for accessing these capabilities and more.
* **Analyze your data.** Search for hidden insights, visualize what you’ve found in charts, gauges, maps, graphs, and more, and combine them in a dashboard.
* **Manage, monitor, and secure the Elastic Stack.** Manage your data, monitor the health of your Elastic Stack cluster, and control which users have access to which features.

<p align="center">
<img src="https://www.elastic.co/guide/en/kibana/current/images/visualization-journey.png"/>
</p>

Data analysis is a core functionality of Kibana. Quickly search through large amounts of data, explore fields and values, and then use Kibana’s drag-and-drop interface to rapidly build charts, tables, metrics, and more.

1. **Add data.** The best way to add Elasticsearch data to Kibana is to use one of our guided processes, available from the home page.

2. **Explore.** With Discover, you can search your data for hidden insights and relationships. Ask your questions, and then filter the results to just the data you want. You can limit your results to the most recent documents added to Elasticsearch.

3. **Visualize.** Kibana provides many options to create visualizations of your data, from aggregation-based data to time series data to geo data. Dashboard is your starting point to create visualizations, and then pulling them together to show your data from multiple perspectives. Use Canvas, to give your data the “wow” factor for display on a big screen. Use Graph to explore patterns and relationships.

4. **Model data behavior.** Use Machine learning to model the behavior of your data—forecast unusual behavior and perform outlier detection, regression, and classification analysis.

5. **Share.** Ready to share your findings with a larger audience? Kibana offers many options—embed a dashboard, share a link, export to PDF, and more.

Most common use cases are :
* The analysis of the logs of the servers : most common errors, etc...
* The analysis of the click stream : the provenance of the traffic on a website, most common features used, etc...

## Part One : Install

### Install Java 8
```console sbtshell
sudo yum install java-1.8.0-openjdk-devel
```

### Install Elasticsearch 7
```console sbtshell
Import the public key of elasticsearch :

sudo rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

sudo nano /etc/yum.repos.d/elasticsearch.repo
[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md

sudo yum install -y elasticsearch

sudo nano /etc/elasticsearch/elasticsearch.yml
node.name: node-1
network.host: 0.0.0.0
discovery.seed_hosts: ["127.0.0.1"]
cluster.initial_master_nodes: ["node-1"]
xpack.security.enabled: false
```

### Run Elasticsearch :
```console sbtshell
sudo systemctl start elasticsearch.service
```

Check the version : 
```console sbtshell
curl -XGET 'localhost:9200'
```

### Install Kibana
```console sbtshell
sudo yum install -y kibana

sudo nano /etc/kibana/kibana.yml
server.host: "0.0.0.0"

sudo systemctl start kibana.service
```

## Part Two : Practice

Kibana is launched on port 5601 :heavy_check_mark: <br/>
> http://EC2_INSTANCE_PUBLIC_IP/5601

### Explore data

We will work on an eCommerce dataset that includes revenue metrics, sentiment analysis, product descriptions and ratings for Elastic clothing apparel.

<p align="center">
<img src="https://www.elastic.co/guide/en/kibana/7.15/images/addData_sampleDataCards_7.15.0.png"/>
</p>

Discover displays the data in an interactive histogram that shows the distribution of data, or documents, over time, and a table that lists the fields for each document that matches the index pattern. To view a subset of the documents, you can apply filters to the data, and customize the table to display only the fields you want to explore.

* Open the main menu, then click Discover.
* Change the time filter to Last 7 days.

<p align="center">
<img src="https://www.elastic.co/guide/en/kibana/7.15/images/tutorial-discover-2.png"/>
</p>

To view the sales orders for women’s clothing that are $60 or more, use the KQL search field :
* Change the time filter to Last 30 days.
* write the following criterias in the KQL (Kibana Query Language) search bar :
```sql
  products.taxless_price >= 60 and category : Women's Clothing
```

The structure of the documents in the index **kibana_sample_data_ecommerce**
```
  "category"
  "currency"
  "customer_birth_date"
  "customer_first_name"
  "customer_full_name"
  "customer_gender"
  "customer_id"
  "customer_last_name"
  "customer_phone"
  "day_of_week"
  "day_of_week_i"
  "email"
  "event"
  "geoip"
  "manufacturer"
  "order_date"
  "order_id"
  "products"
    > "_id"
    > "base_price"
    > "base_unit_price"
    > "category"
    > "created_on"
    > "discount_amount"
    > "discount_percentage"
    > "manufacturer"
    > "min_price"
    > "price"
    > "product_id"
    > "product_name"
    > "quantity"
    > "sku"
    > "tax_amount"
    > "taxful_price"
    > "taxless_price"
    > "unit_discount_amount"
  "sku"
  "taxful_total_price"
  "taxless_total_price"
  "total_quantity"
  "total_unique_products"
  "type"
  "user"
```

1. Go to dashboard pane.
<p align="center">
<img src="img/screenshot_from_2021-11-26_14-32-06.png"/>
</p>

2. Create a dashboard by clicking on the button **+ Create dashboard**.
<p align="center">
<img src="img/screenshot_from_2021-11-26_14-32-13.png"/>
</p>

3. Add a chart to show the evolution of the oreders in the time with bar chart.<br/>

Create a new chart by clicking on the button **Create visualization** and select the type of the chart **Bar horizontal** :
<p align="center">
<img src="img/screenshot_from_2021-11-26_14-32-31.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-34-35.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-36-31.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-36-43.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-36-57.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-37-02.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-38-21.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-41-11.png"/>
</p>

4. Split the bars to see the evolution by gender :

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-41-18.png"/>
</p>

5. Show the number of orders in a metric chart :

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-42-27.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-42-34.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-42-42.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_14-58-13.png"/>
</p>

6. Now we want to visualize the distribution of the orders by countries in a map :

<p align="center">
<img src="img/screenshot_from_2021-11-26_15-02-58.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_15-03-04.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_15-05-33.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_15-05-36.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_15-24-39.png"/>
</p>

7. Add a chart with the total amount of all the orders :

<p align="center">
<img src="img/screenshot_from_2021-11-26_15-32-39.png"/>
</p>

8. Show the distribution of the products by manufacturers in a Pie chart :

<p align="center">
<img src="img/screenshot_from_2021-11-26_15-36-41.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_15-36-56.png"/>
</p>

9. Add a line chart to show the evolution of the orders' total amount by manufacturer :

<p align="center">
<img src="img/screenshot_from_2021-11-26_16-09-42.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_16-15-45.png"/>
</p>

<p align="center">
<img src="img/screenshot_from_2021-11-26_16-15-50.png"/>
</p>

10. Your dashboard should look like this :

<p align="center">
<img src="img/screenshot_from_2021-11-26_16-19-43.png"/>
</p>

👍
