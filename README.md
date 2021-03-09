# US_Senate_Election_Markov_Chain
We use a mixture of Markov chains to to model the results of the U.S. Senate elections.

# The U.S. Senate Elections
The foundations of the U.S. Senate were laid by the the U.S. Constitution (Article I, Section 3). Originally, senators were chosen by state legislatures. However, in 1913, the 17th amendment provided that senators would be directly elected by the people. 

From the beginning, it was established that each state would be represented by two senators who are elected to serve six-year terms. Moreover, senators were divided into three classes, so that the elections held every two year fill one third of the seats. Nowadays, there are 100 seats evenly distributed in Class I, Class II, and Class III and elections are held in November of every even-numbered year. In case a senator resigns or cannot finish their term, a special elections can be held to elect a senator who will finish the incomplete term. Special elections are usually held together with general elections but some states, such as Alabama and Texas, allow for special elections to be held before a general election. Before the vacancy is filled by a newly elected elected senator, states legislatures can make temporarily appointments.

# The U.S. Senate Data Set
The U.S. Senate elections data set consists of categorical data organized into a table whose rows correspond to the U.S. states and the columns to the years when elections were held. The values of the table are strings consisting of "D" for a Democratic incumbent or "R" for a Republican incumbent. 

The data set starts in 1966 by the first U.S. Senate elections that were held after the ratification of the Civil Rights Act in 1964. The Civil Rights Act was an important milestone in the U.S. politics because it established, among others, the right to vote for African-Americans. Therefore, not only the U.S. electorate changed but also the two main political parties in the U.S. adjusted their policies and ideological direction, which led to the evolution of modern Democrats and Republicans. The last data come from 2021 Senate elections.

The data were collected from lists of senators by states on the official website of the U.S. Senate, for example data for Minnesota are available at https://www.senate.gov/states/MN/senators.htm. The collected data are stored in *US_Senate_election_data.xlsx* which can be accessed in directory Data.

# Clustering the U.S. States
We applied the Markov Chain mixture model described in \ref{ss:MCModel_for_senate} on the U.S. Senate election data set described in \ref{ss:data}. We tried different combinations of number of components $K$ of the mixture as well as different initial values for the EM algorithm. The initial values of parameters, i.e. the mixing proportion, transition matrices, and initial distribution, were randomized. We conducted 50 to 100 random initialization for each $K$ to ensure that our result is not only a local maximum.

![fig 1](/figures/States_cluster_ord_1_K3.png)
