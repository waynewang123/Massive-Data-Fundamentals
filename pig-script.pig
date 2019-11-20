
Bigrams = LOAD '/user/hadoop/bigrams/' AS (bigram, year, occurrence, books);
Grouped_bigram = GROUP Bigrams BY bigram;
Summed = FOREACH Grouped_bigram generate group,
	 SUM(Bigrams.occurrence) AS occurrence,
	 SUM(Bigrams.books) AS books,
	 SUM(Bigrams.occurrence)/SUM(Bigrams.books) AS average,
	 MIN(Bigrams.year) AS first,
	 MAX(Bigrams.year) AS last,
	 COUNT(Bigrams.year) AS times;
Filtered_year = FILTER Summed BY first==1950 and last==2009;
Filtered_times = FILTER Filtered_year BY times == 60;
Sorted = ORDER Filtered_times BY average DESC;
Top10 = LIMIT Sorted 10;
STORE Top10 into 'pig-results';