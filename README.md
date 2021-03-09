# US_Senate_Election_Markov_Chain
Modeling US Senate Election by Markov Chains

# Introduction
The US Senate has 100 seats. Each seat belongs to Class I, Class II, or Class III. Every state is represented by two senators holding seats of different classes, who are elected for six-year terms. Regular senate elections are held every two yeas. The classes rotate every time so that each year one third of the seats is open. There can be special elections held in case a senator resign or cannot finish their term. 

# Data
I collected the data from Wikipedia, starting in 1966, when the first senate elections were held after passing the Civil Rights Act in 1964. Civil Rights Act was an important milestone in the U.S. politics because it established, among others, the right to vote for African-Americans. Therefore, not only the US electorate changed but also the two main political parties in the U.S. adpoted new ideas which led to evolve modern Democrats and Republicans. 
https://en.wikipedia.org/wiki/List_of_United_States_senators_from_Minnesota

The data consists of a table in which rows corresponds to the US states and columns to election years. The values are D for a Democratit incumbent or R for a Republican. If special elections were held in order to elect a senator to finish an unfinished term, the memberships of the senators in such term are separated by "/", for example "D/R" means that a Democratic incubent did not finished their term and Republican candidate was elected to finish it. On the list "Data from Wiki" there are also names of elected candidates. All case were special elections were held are commented.

# Markov Chain Model

# Prediction

$`\sqrt{2}`$

# The U.S. Senate Elections
The foundations of the U.S. Senate were laid by the the U.S. Constitution \citep[Article \RNum{1}, Section 3]{USConst}. Originally, senators were chosen by state legislatures. However, in 1913, the 17th amendment provided that senators would be directly elected by the people. 

From the beginning, it was established that each state would be represented by two senators who are elected to serve six-year terms. Moreover, senators were divided into three classes, so that the elections held every two year fill one third of the seats. Nowadays, there are 100 seats evenly distributed in Class I, Class II, and Class III and elections are held in November of every even-numbered year. In case a senator resigns or cannot finish their term, a special elections can be held to elect a senator who will finish the incomplete term. Special elections are usually held together with general elections but some states, such as Alabama and Texas, allow for special elections to be held before a general election. Before the vacancy is filled by a newly elected elected senator, states legislatures can make temporarily appointments. More about special elections in the U.S. can be found in \cite{specialElection}.

# The U.S. Senate Data Set

The U.S. Senate elections data set consists of categorical data organized into a table whose rows correspond to the U.S. states and the columns to the years when elections were held. The values of the table are strings consisting of "D" for a Democratic incumbent or "R" for a Republican incumbent. 

The data set starts in 1966 by the first U.S. Senate elections that were held after the ratification of the Civil Rights Act in 1964. The Civil Rights Act was an important milestone in the U.S. politics because it established, among others, the right to vote for African-Americans. Therefore, not only the U.S. electorate changed but also the two main political parties in the U.S. adjusted their policies and ideological direction, which led to the evolution of modern Democrats and Republicans. The last data come from 2021 Senate elections.

%In seven cases in the reference period, an independent candidate was elected, namely Angus King was elected twice for the state of Maine, Bernard Sanders three time for Vermont, and Harry F. Byrd Jr. twice for Virginia. 
In several cases during the reference period, an independent, independent Democrat, or a Conservative candidate was elected. In such cases, they were classified as "D" or "R" based on the party they caucused with. If a special election was held in order to elect a senator to finish an unfinished term, the part memberships of the senators in such terms are separated by "/", for example "D/R" means that a Democratic incumbent did not finished their term and a Republican candidate was elected to fill the vacancy. If no election was held for a given state in a given year, the values is "NA". 

The data were collected from lists of senators by states on the official website of the U.S. Senate, for example data for Minnesota are available at \cite{MNSenators}. The collected data are stored in  \texttt{US\_Senate\_election\_data.xlsx} which can be accessed on Github~\cite{prilohyGithub}. We can see an excerpt from the data set in Table \ref{t:senate_data_example}.%TODO : pridat url do citaci
