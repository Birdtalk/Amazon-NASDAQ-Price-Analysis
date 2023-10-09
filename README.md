# Amazon-NASDAQ-Price-Analysis
This is an analysis of Amazon NASDAQ price data compared to total market price data from 2/18/2022 to 2/17/2023

</br>
Please view the full report and the R code that shows my formulas and methods.

<h1>Goals</h1>
<article>
  <p>
    We hope to show, by creating a multiple linear regression model, whether the Open Price of
Amazon and the Open Price of the NASDAQ Composite have some capacity to explain the daily
High Price of Amazon stock.
  </p>
</article>

<h1>Assumptions about the Data</h1>
<article>
  <p>
We assume the data provided is accurate by date-line; this is because the variables from the
two data sets are related by date. Therefore, the sample size of this population are measured in
days, and we hope to understand by a simple linear regression model and a multiple linear
regression model if an assumption can be made about dates which are not part of this data
set.
</p>
</article>
<h1>Hypothesis</h1>
<article>
  <p>
    The Null Hypothesis can be stated as follows: there is no correlation between the Open Price
of Amazon, the Open Price of the NASDAQ Composite and the daily High Price of Amazon.
Additionally we are unable to reasonably say that the Open Price of Amazon and the Open
Price of NASDAQ Composite are valuable for explaining the daily High Price of Amazon.
  </p>
</article>
<h1>Conclusion</h1>
<article>
  <p>
   <h2> Linear Regression</h2>
We may now complete the Linear regression model equation we began before. Remember
in this equation Y is the dependent variable (the Amazon High Price), X is the independent
variable (The Amazon Open Price) m is the estimated slope, and b is the estimated intercept.
This is completed by the formula:
𝐻𝑖𝑔ℎ.𝑎𝑚𝑧𝑛 = 1.004183 ⋅ 𝑂𝑝𝑒𝑛.𝑎𝑚𝑧𝑛 + 1.557136
The p-values from the summary indicate the statistical significance of each predictor variable.
In this case, the p-value of the Open variable is less than 0.05, which suggests that it is a
statistically significant predictor of the response variable.
The R-squared value is 0.9945, indicating that 99.45% of the variability in the daily High Price
can be explained by Open Price. The adjusted R-squared value is 0.9944, takes into account
the number of predictor variables used in the model. The residual standard error is 1.692,
which tells us the standard deviation of our data points. Most interesting the F-statistic is
4.479e4
, which tests the overall significance of the model. The p-value for the F-statistic is less
than 0.05, indicating that the model is statistically significant. We now have a benchmark to
say comparatively how significant is Multiple Linear Regression model.
<h2>Multiple Linear Regression</h2>
Like before we can also finish the Multiple Linear Regression equation:
𝐻𝑖𝑔ℎ.𝑎𝑚𝑧𝑛 = 5.598 + 1.029 ⋅ 𝑂𝑝𝑒𝑛.𝑎𝑚𝑧𝑛 − 0.001 ⋅ 𝑂𝑝𝑒𝑛.𝑖𝑥𝑖𝑐 + 𝜀
The Adjusted R-squared value of 0.9946 indicates that 99.46% of the variability in the daily
High Price can be explained by Amazon Open Price and NASDAQ Composite Open Price
within this model.There is small improvement compared to the accuracy of the simple linear
model, but there are a few things to consider. The NASDAQ Composite Open Price contains
the Amazon Open Price. This means that some small part of this predictor variable contains
the other. Additionally the other stock symbols which make up the NASDAQ Composite may
cause it to increase or decrease to a degree not reflected purely by the performance of Amazon
itself. Which means that in part, the composite price may go up or down due to factors not
related to Amazon
  </p>
</article>

