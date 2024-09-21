#standardSQL

#The data tables have a lot of columns, but there are few of interest to us that we will use to create our ML model. Here the visitor's device's operating system is used, whether said device is a mobile device, 
the visitor's country or region and the number of page views will be used as the criteria for whether a transaction has been made. 
In this case, label is what you're trying to fit to (or predict).This data will be the training data for the ML model you create. The training data is being limited to those
collected from 1 August 2016 to 31 June 2017. This is done to save the last month of data for "prediction". It is further limited to 10,000 data points to save some time.

SELECT
  IF(totals.transactions IS NULL, 0, 1) AS label,
  IFNULL(device.operatingSystem, "") AS os,
  device.isMobile AS is_mobile,
  IFNULL(geoNetwork.country, "") AS country,
  IFNULL(totals.pageviews, 0) AS pageviews
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20170631'
LIMIT 10000;
