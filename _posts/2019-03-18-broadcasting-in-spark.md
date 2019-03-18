---
image: "/assets/images/base/apache_spark.png"
category: Programming
---

Broadcasting a variable is useful for repeatedly used read-only variables in an application<!--more-->, like lookup tables or similar.

A broadcast variable is an object of type `spark.broadcast.Broadcast[T]`, it wraps a Serializable value of type `T`. This value can be accessed by calling the `value` property (PySpark). The variable will be sent to each node once and should be treated as read-only (updates will not be propagated to other nodes)[1, p. 104-106].

## Example

In below assume `df` is a `pyspark.sql.DataFrame` the broadcast variable can be used in a udf.

```python
from pyspark.sql import functions as F
from pyspark.sql import types as T
from pyspark.sql import Row
from sklearn.neighbors import NearestNeighbors
from pyspark import SparkContext

sc = SparkContext.getOrCreate()

training = [[0, 0, 2], [1, 0, 0], [0, 0, 1]]
validation = [[0, 2, 2], [1, 0, 5], [1, 0, 1]]

neigh = NearestNeighbors(2, 0.4)
neigh.fit(training)
bc_neigh = sc.broadcast(neigh)

def kneighbors(x):
  """Returns the two closest neighbours.
  """
  return list(
    bc_neigh
    .value
    .kneighbors(x, 2, return_distance=False)
    )

udf_kneighbors = F.udf(kneighbors, T.ArrayType(T.DoubleType))
df = (
  sc
  .parallelize([Row(x=x) for x in validation])
  .toDF()
  .withColumn(
        "knn",
        udf_kneighbors(x)
    )
)
```

##References:

[1] Holden Karau, Andy Konwinski, Patrick Wendell, Matei Zaharia, *Learning Spark: Lightning-Fast Big Data Analysis*. O'Reilly Media, 2015.
