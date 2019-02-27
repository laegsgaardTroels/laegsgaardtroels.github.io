---
image: "/assets/images/2019-02-25-feature-encoding/encoding.jpg"
---

Feature encoding is the process of encoding data to be used for a model.<!--more--> There are various ways of encoding features but what are the trade-offs one should have in mind when encoding.

## Curse of Dimensionality

If one considers a p-dimensional hypercube

$$
X=[U_1,U_2,\dots,U_p], \quad U_i\sim U(0,1)
$$
