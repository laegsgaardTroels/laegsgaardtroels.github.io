---
image: "/assets/images/2021-05-02-operationel-domain-and-range/maersk-vessel.jpeg"
category: Thoughts
---

While working at Maersk there was a power-to-speed model used for planning, basically a polynomial inferred from a regression, taking in some extra inputs besides power and outputting speed. For this model there was defined valid input power levels. In this post I will talk about my thoughts on why it seems useful to define both the domain and range of an inferred function in an operational setting. <!--more-->

For a general function $f:X\rightarrowY$, $X$ is called the domain and was in this example the valid power levels for the given vessel and $Y$ is called the range/codomain and are the valid speed levels for the vessel in this example.

Useful things you can do when you define the operational domain and range of the function is:

- Test that the inferred function is within the operational range for values in the operational domain.
- Test that the inferred function captures prior known relationships between the input and output e.g. does the speed increase monotonically as a function of power for values in the operational domain. 
- Create standard reports to investigate yourself or ideally subject matter experts.
- Create partial dependence plots, depending on how well the domain is specified one can approximate the partial relationships between two variables.
- If the datatypes of the domain and range are specified then this it is easy to specify the spec of an API to users.
- If the datatypes of the domain is specified then dump parsing mistakes can be avoided by creating load functions to load the data.

The operational domain and range can be specified at different levels of precision e.g. one could specify valid power and speed levels for the entire fleet or for each vessel. If done for each vessel then one captures some variability across vessels. 

## Implementation

If implementered in Python then I would use dicts.

```Python
# domains.py

# The minimum and maximum of the inputs.
X_DOMAIN = {'power': [0, 1e6]}

# The minimum and maximum of the output.
Y_DOMAIN = {'speed': [0, 1e6]}

def domain(mmsi=MMSI, **kwargs):
    """The domain and codomain of the speed to power model.
    
    Kwargs:
        mmsi (str): A unique identifier of a vessel.

    Returns:
        np.array: A grid of valid domain an codomain values.
    """
    ...
```

If implementered in Python then I would use dicts to specify the datatypes.

```Python
# dtypes.py

# The datatype of the inputs.
X_DTYPE = {...}

# The datatype of the output.
Y_DTYPE = {...}
```

Some related thoughts:

## Basic functional relationships

To be even more specific one could specify a range on valid speed levels $[s_{min}(p), s_{max}(p)]$ for each power level $p$. This would naturally lead to a lower bound on how bad the model is:

$$
\lVert prediction(p) - actual(p) \rVert <= s_{max}(p) - s_{min}(p)
$$

The more accurate the lower the bound.

# Sample of the data

With a sample of the data one can do similar thing but above could be faster to compute and easier to standardize.

A sample of the data with 1000 rows are however easy to keep as a pytest fixture so I would probably do this anyway.
