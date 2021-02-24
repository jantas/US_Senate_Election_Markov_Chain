# US_Senate_Election_Markov_Chain
Modeling US Senate Election by Markov Chains

# Data
The US Senate has 100 seats. Each seat belongs to Class I, Class II, or Class III. Every state is represented by two senators holding seats of different classes, who are elected for six-year terms. Regular senate elections are held every two yeas. The classes rotate every time so that each year one third of the seats is open. There can be special elections held in case a senator resign or cannot finish their term. 

I collected the data from Wikipedia, starting in 1966, when the first senate elections were held after passing the Civil Rights Act in 1964. Civil Rights Act was an important milestone in the U.S. politics because it established, among others, the right to vote for African-Americans. Therefore, not only the US electorate changed but also the two main political parties in the U.S. adpoted new ideas which led to evolve modern Democrats and Republicans. 
https://en.wikipedia.org/wiki/List_of_United_States_senators_from_Minnesota

The data consists of a table in which rows corresponds to the US states and columns to election years. The values are D for a Democratit incumbent or R for a Republican. If special elections were held in order to elect a senator to finish an unfinished term, the memberships of the senators in such term are separated by "/", for example "D/R" means that a Democratic incubent did not finished their term and Republican candidate was elected to finish it. On the list "Data from Wiki" there are also names of elected candidates. All case were special elections were held are commented.

# Markov Chain Model

# Predicion
