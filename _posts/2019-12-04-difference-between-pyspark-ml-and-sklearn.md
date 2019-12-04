---
image: "/assets/images/base/apache_spark.png"
category: Programming
---

Differences between the Pyspark pipeline object and the one in sklearn.<!--more-->
The pipeline object in sklearn makes it easy to sequentially apply a list of transforms and a final estimator [1], when creating models with sklearn these makes it easy to organize models. 
PySpark has a similar pipeline API but there are some differences

1.  `.fit()` and `.transform()` methods (but no `.predict()` method) other differences are
2. You can specify the subset of input features in a pipeline.
3. When predicting you use a `.transform()` method on a fitted model object, which adds extra column(s) based on the model.
4. The input features are `Vector` object, You usually use the `VectorAssembler` in the first step of the pipeline to assemble input features into this object.

Sample code snippet:

```python
from pyspark.ml import Pipeline
from pyspark.ml import PipelineModel
from pyspark.ml.feature import VectorAssembler
from pyspark.ml.regression import RandomForestRegressor 


assembler = VectorAssembler(
    inputCols=feature_cols,
    outputCol="features"
)

rf = RandomForestRegressor(
    featuresCol="features",
    labelCol=response_variable,
    predictionCol="prediction",
    **parameters
)

pipeline = Pipeline(stages=[assembler, rf])
model = pipeline.fit(train)
test_with_predictions = model.predict(test)  # This will add a `prediction` column AND a `features` column to test.

# Save the model for later use.
model.write().overwrite().save('somewhere_in_foundry_fs/my_great_model')

# Load the model later.
model = PipelineModel.load('somewhere_in_foundry_fs/my_great_model')
```

The added `features` column is added from the `VectorAssembler`.


## References

[1] https://scikit-learn.org/stable/modules/generated/sklearn.pipeline.Pipeline.html

[2] https://spark.apache.org/docs/latest/ml-pipeline.html 
