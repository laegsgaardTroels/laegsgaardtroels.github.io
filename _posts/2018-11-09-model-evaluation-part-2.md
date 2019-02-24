---
image:
---
What is cross validation, what is a theoretial justification and how to use it in practice?<!--more-->

To understand Cross Validation has to know the main objective in supervised machine learning problems. Read Model Evaluation Part 1 first.

Cross validation is the most common method to give an estimate of generalization performance of a machine learning model. This is extremely important in practice, as stated in one of the common reference books:

"... *The generalization performance of a learning method relates to its prediction capability on independent test data. Assessment of this performance is extremely important in practice, since it guides the choice of learning method or model, and gives us a measure of the quality of the ultimately chosen model.* ...
-[Jerome H. Friedman, Robert Tibshirani, and Trevor Hastie](https://web.stanford.edu/~hastie/Papers/ESLII.pdf) "


## The Training/Validation/Test split

Training dataset which is ~50% of the data, validation- and test-dataset is ~25% each.

![](/assets/images/2018-11-09-cross-validation/train_validation_test.png)

* <b>Model Selection</b>: estimating the performance of different models in order to choose the best one.
  * This is done by training the model on the training set and calculating the loss on the validation set.

* <b>Model Assesment</b>: having chosen a final model, estimating its prediction error (generalization error) on new data.
  * This is done when a final model has been chosen on the validation set. Then the model performance is assesed by calculating the loss on the test set. This performance measure is given to the end-user of the model.

![](/assets/images/2018-11-09-cross-validation/cross_validation.png)


# Theory
