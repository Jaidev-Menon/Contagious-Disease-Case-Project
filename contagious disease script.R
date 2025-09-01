R version 4.2.3 (2023-03-15) -- "Shortstop Beagle"
Copyright (C) 2023 The R Foundation for Statistical Computing
Platform: x86_64-apple-darwin17.0 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Workspace loaded from ~/.RData]

> library(tidyverse)
── Attaching core tidyverse packages ───────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   3.5.1     ✔ tibble    3.2.1
✔ lubridate 1.9.4     ✔ tidyr     1.3.1
✔ purrr     1.0.2     
── Conflicts ─────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package to force all conflicts to become errors
> read_csv("Top 10 Infectious Agents average cases by year.csv")
Error: 'Top 10 Infectious Agents average cases by year.csv' does not exist in current working directory ('/Users/jai').
> read_csv(Top 10 Infectious Agents average cases by year.csv)
Error: unexpected numeric constant in "read_csv(Top 10"
> setwd("~/Documents/contagious disease case study")
> read_csv("Top 10 Infectious Agents average cases by year.csv", header = TRUE, sep=',')
Error in read_csv("Top 10 Infectious Agents average cases by year.csv",  : 
  unused arguments (header = TRUE, sep = ",")
> read_csv("Top 10 Infectious Agents average cases by year.csv"
+ f
Error: unexpected symbol in:
"read_csv("Top 10 Infectious Agents average cases by year.csv"
f"
> read_csv("Top 10 Infectious Agents average cases by year.csv")
Error: 'Top 10 Infectious Agents average cases by year.csv' does not exist in current working directory ('/Users/jai/Documents/contagious disease case study').
> read_csv(Top 10 Infectious Agents average cases by year.csv)
Error: unexpected numeric constant in "read_csv(Top 10"
> avg<-read_csv("Top 10 Infectious Agents average cases by year.csv")
Error: 'Top 10 Infectious Agents average cases by year.csv' does not exist in current working directory ('/Users/jai/Documents/contagious disease case study').
> avg<-read_csv("Top_10_avg_cases.csv")
Error: 'Top_10_avg_cases.csv' does not exist in current working directory ('/Users/jai/Documents/contagious disease case study').
> avg<-read_csv("Top_10_avg_cases.csv")
Multiple files in zip: reading 'Index/Document.iwa'
Error in vroom_(file, delim = delim %||% col_types$delim, col_names = col_names,  : 
  embedded nul in string: '\xca\033\0\xcf_\xf0e8\b\001\0224\b\001\022\003\001\0\005\030\xc4\v"\v'

> avg<-read_csv("infectious_agents_avg_cases.csv")
Rows: 24 Columns: 3                                                            
── Column specification ─────────────────────────────────────────────────────────
Delimiter: ","
chr (1): Infectious_Agent_Name
dbl (2): Year, avg_cases

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
> avg
# A tibble: 24 × 3
   Infectious_Agent_Name  Year avg_cases
   <chr>                 <dbl>     <dbl>
 1 Campylobacteriosis     2022      483.
 2 Campylobacteriosis     2023      682.
 3 Campylobacteriosis     2024      750.
 4 Chlamydia_Trachomatis  2022    11474.
 5 Chlamydia_Trachomatis  2023    13784.
 6 Chlamydia_Trachomatis  2024    13538.
 7 Chronic_Hepatitis_B    2024      172.
 8 Chronic_Hepatitis_C    2024      745.
 9 Coccidioidomycosis     2023      243.
10 Coccidioidomycosis     2024      275.
# ℹ 14 more rows
# ℹ Use `print(n = ...)` to see more rows
> spec(avg)
cols(
  Infectious_Agent_Name = col_character(),
  Year = col_double(),
  avg_cases = col_double()
)
> data(avg)
Warning message:
In data(avg) : data set ‘avg’ not found
> View(avg)
> t.test(data=avg, avg_cases ~ Year)
Error in t.test.formula(data = avg, avg_cases ~ Year) : 
  grouping factor must have exactly 2 levels
> t.test(data=avg, avg_cases ~ Year, group_by(Infectious_Agent_Name))
Error in UseMethod("group_by") : 
  no applicable method for 'group_by' applied to an object of class "character"
> t.test(data=avg, avg_cases ~ Year) %>%
+ group_by(Infectious_Agent_Name)
Error in t.test.formula(data = avg, avg_cases ~ Year) : 
  grouping factor must have exactly 2 levels
> t.test(data=avg, avg_cases ~ Year) %>%
+     + group_by(Infectious_Agent_Name,Year)
Error in t.test.formula(data = avg, avg_cases ~ Year) : 
  grouping factor must have exactly 2 levels
> joe<-avg %>%
+ select(Infectious_Agent_Name,Year,avg_cases) %>%
+ mutate(t-test(data=avg,avg_cases ~ Year))
Error in `mutate()`:
ℹ In argument: `t - test(data = avg, avg_cases ~ Year)`.
Caused by error in `test()`:
! could not find function "test"
Run `rlang::last_trace()` to see where the error occurred.
> joe<-avg %>%
+     + select(Infectious_Agent_Name,Year,avg_cases) %>%
+     + mutate(t-test(data=avg,avg_cases ~ Year)) %>%
+ group_by(Infectious_Agent_Name,Year)
Error in select(Infectious_Agent_Name, Year, avg_cases) : 
  object 'Infectious_Agent_Name' not found
> joe<-avg %>%
+     +     + select(Infectious_Agent_Name,Year,avg_cases)
Error in select(Infectious_Agent_Name, Year, avg_cases) : 
  object 'Infectious_Agent_Name' not found
> joe<-avg %>%
+     +     + select('Infectious_Agent_Name',Year,avg_cases) 
Error in UseMethod("select") : 
  no applicable method for 'select' applied to an object of class "character"
> joe<-avg %>%
+     +     + select(Infectious_Agent_Name,Year,avg_cases)
Error in select(Infectious_Agent_Name, Year, avg_cases) : 
  object 'Infectious_Agent_Name' not found
> attach(avg)
> joe<-avg %>%
+     +     +     + select(Infectious_Agent_Name,Year,avg_cases)
Error in UseMethod("select") : 
  no applicable method for 'select' applied to an object of class "character"
> joe<-avg %>% select(Infectious_Agent_Name,Year,avg_cases)
> joe
# A tibble: 24 × 3
   Infectious_Agent_Name  Year avg_cases
   <chr>                 <dbl>     <dbl>
 1 Campylobacteriosis     2022      483.
 2 Campylobacteriosis     2023      682.
 3 Campylobacteriosis     2024      750.
 4 Chlamydia_Trachomatis  2022    11474.
 5 Chlamydia_Trachomatis  2023    13784.
 6 Chlamydia_Trachomatis  2024    13538.
 7 Chronic_Hepatitis_B    2024      172.
 8 Chronic_Hepatitis_C    2024      745.
 9 Coccidioidomycosis     2023      243.
10 Coccidioidomycosis     2024      275.
# ℹ 14 more rows
# ℹ Use `print(n = ...)` to see more rows
> joe<-avg %>%
+     select(Infectious_Agent_Name,Year,avg_cases) %>%
+     mutate(t-test(data=avg,avg_cases ~ Year)) %>%
+     group_by(Infectious_Agent_Name,Year)
Error in `mutate()`:
ℹ In argument: `t - test(data = avg, avg_cases ~ Year)`.
Caused by error in `test()`:
! could not find function "test"
Run `rlang::last_trace()` to see where the error occurred.
> joe<-avg %>%
+     select(Infectious_Agent_Name,Year,avg_cases) %>%
+     mutate(t.test(data=avg,avg_cases ~ Year)) %>%
+     group_by(Infectious_Agent_Name,Year)
Error in `mutate()`:
ℹ In argument: `t.test(data = avg, avg_cases ~ Year)`.
Caused by error in `t.test.formula()`:
! grouping factor must have exactly 2 levels
Run `rlang::last_trace()` to see where the error occurred.
> joe<-avg %>%
+     select(Infectious_Agent_Name,Year,avg_cases) %>%
+     mutate(t.test(data=.,avg_cases ~ Year)) %>%
+     group_by(Infectious_Agent_Name,Year)
Error in `mutate()`:
ℹ In argument: `t.test(data = ., avg_cases ~ Year)`.
Caused by error in `t.test.formula()`:
! grouping factor must have exactly 2 levels
Run `rlang::last_trace()` to see where the error occurred.
> joe<-avg %>%
+     select(Infectious_Agent_Name,Year,avg_cases) %>%
+     mutate(Year+avg_cases)
> joe
# A tibble: 24 × 4
   Infectious_Agent_Name  Year avg_cases `Year + avg_cases`
   <chr>                 <dbl>     <dbl>              <dbl>
 1 Campylobacteriosis     2022      483.              2505.
 2 Campylobacteriosis     2023      682.              2705.
 3 Campylobacteriosis     2024      750.              2774.
 4 Chlamydia_Trachomatis  2022    11474.             13496.
 5 Chlamydia_Trachomatis  2023    13784.             15807.
 6 Chlamydia_Trachomatis  2024    13538.             15562.
 7 Chronic_Hepatitis_B    2024      172.              2196.
 8 Chronic_Hepatitis_C    2024      745.              2769.
 9 Coccidioidomycosis     2023      243.              2266.
10 Coccidioidomycosis     2024      275.              2299.
# ℹ 14 more rows
# ℹ Use `print(n = ...)` to see more rows
> sup
Error: object 'sup' not found
> sqrt(0.35)
[1] 0.591608
> sqrt(0.69)
[1] 0.8306624
sqrt(10)
sqrt(10)
187              2022    8/2022 Chlamydia Trachomatis        14406
188              2022    8/2022 Chlamydia Trachomatis        13080
189              2022    8/2022 Chlamydia Trachomatis        13603
190              2022    8/2022 Chlamydia Trachomatis        12206
191              2022    9/2022 Chlamydia Trachomatis        13299
192              2022    9/2022 Chlamydia Trachomatis        10036
193              2022    9/2022 Chlamydia Trachomatis        13711
194              2022    9/2022 Chlamydia Trachomatis        12532
195              2022   10/2022 Chlamydia Trachomatis        12222
196              2022   10/2022 Chlamydia Trachomatis        12923
197              2022   10/2022 Chlamydia Trachomatis        14275
198              2022   10/2022 Chlamydia Trachomatis        14216
199              2022   10/2022 Chlamydia Trachomatis        13590
200              2022   11/2022 Chlamydia Trachomatis        12508
201              2022   11/2022 Chlamydia Trachomatis        14241
202              2022   11/2022 Chlamydia Trachomatis         9235
203              2022   11/2022 Chlamydia Trachomatis        12409
204              2022   12/2022 Chlamydia Trachomatis        13655
205              2022   12/2022 Chlamydia Trachomatis        13487
206              2022   12/2022 Chlamydia Trachomatis        11550
207              2022   12/2022 Chlamydia Trachomatis         2614
208              2023    1/2023 Chlamydia Trachomatis        14383
209              2023    1/2023 Chlamydia Trachomatis        14130
210              2023    1/2023 Chlamydia Trachomatis        10328
211              2023    1/2023 Chlamydia Trachomatis        16341
212              2023    1/2023 Chlamydia Trachomatis        14147
213              2023    2/2023 Chlamydia Trachomatis        13060
214              2023    2/2023 Chlamydia Trachomatis        13739
215              2023    2/2023 Chlamydia Trachomatis        15348
216              2023    2/2023 Chlamydia Trachomatis        13224
217              2023    3/2023 Chlamydia Trachomatis        16231
218              2023    3/2023 Chlamydia Trachomatis        13988
219              2023    3/2023 Chlamydia Trachomatis        15172
220              2023    4/2023 Chlamydia Trachomatis        14828
221              2023    4/2023 Chlamydia Trachomatis        15196
222              2023    4/2023 Chlamydia Trachomatis        14814
223              2023    4/2023 Chlamydia Trachomatis        15315
224              2023    4/2023 Chlamydia Trachomatis        15101
225              2023    5/2023 Chlamydia Trachomatis        15280
226              2023    5/2023 Chlamydia Trachomatis        13769
227              2023    5/2023 Chlamydia Trachomatis        12437
228              2023    5/2023 Chlamydia Trachomatis        14013
229              2023    6/2023 Chlamydia Trachomatis        11243
230              2023    6/2023 Chlamydia Trachomatis        15562
231              2023    6/2023 Chlamydia Trachomatis        14922
232              2023    6/2023 Chlamydia Trachomatis        12728
233              2023    7/2023 Chlamydia Trachomatis        11038
234              2023    7/2023 Chlamydia Trachomatis        15675
235              2023    7/2023 Chlamydia Trachomatis        15652
236              2023    7/2023 Chlamydia Trachomatis        15156
237              2023    7/2023 Chlamydia Trachomatis        15332
238              2023    8/2023 Chlamydia Trachomatis        13867
239              2023    8/2023 Chlamydia Trachomatis        16055
240              2023    8/2023 Chlamydia Trachomatis        13530
241              2023    8/2023 Chlamydia Trachomatis        14425
242              2023    9/2023 Chlamydia Trachomatis         9879
243              2023    9/2023 Chlamydia Trachomatis        12868
244              2023    9/2023 Chlamydia Trachomatis        14579
245              2023    9/2023 Chlamydia Trachomatis        14617
246              2023   10/2023 Chlamydia Trachomatis        13875
247              2023   10/2023 Chlamydia Trachomatis        14573
248              2023   10/2023 Chlamydia Trachomatis        13146
249              2023   10/2023 Chlamydia Trachomatis        15295
250              2023   10/2023 Chlamydia Trachomatis        14805
[ reached 'max' / getOption("max.print") -- omitted 990 rows ]
> as.Date(agents2$MMWR.DATE, format = "%m/%y")
[1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[26] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[51] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[76] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[101] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[126] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[151] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[176] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[201] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[226] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[251] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[276] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[301] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[326] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[351] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[376] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[401] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[426] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[451] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[476] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[501] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[526] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[551] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[576] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[601] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[626] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[651] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[676] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[701] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[726] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[751] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[776] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[801] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[826] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[851] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[876] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[901] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[926] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[951] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[976] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[ reached 'max' / getOption("max.print") -- omitted 240 entries ]
> as.Date(agents2$MMWR.DATE, format = "%m/%Y")
[1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[26] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[51] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[76] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[101] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[126] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[151] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[176] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[201] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[226] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[251] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[276] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[301] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[326] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[351] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[376] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[401] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[426] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[451] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[476] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[501] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[526] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[551] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[576] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[601] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[626] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[651] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[676] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[701] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[726] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[751] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[776] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[801] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[826] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[851] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[876] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[901] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[926] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[951] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[976] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[ reached 'max' / getOption("max.print") -- omitted 240 entries ]
> as.Date(agents2$MMWR.DATE, format = "%d/%Y")
[1] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01"
[6] "2022-02-02" "2022-02-02" "2022-02-02" "2022-02-02" "2022-02-03"
[11] "2022-02-03" "2022-02-03" "2022-02-03" "2022-02-04" "2022-02-04"
[16] "2022-02-04" "2022-02-04" "2022-02-04" "2022-02-05" "2022-02-05"
[21] "2022-02-05" "2022-02-05" "2022-02-06" "2022-02-06" "2022-02-06"
[26] "2022-02-06" "2022-02-07" "2022-02-07" "2022-02-07" "2022-02-07"
[31] "2022-02-07" "2022-02-08" "2022-02-08" "2022-02-08" "2022-02-08"
[36] "2022-02-09" "2022-02-09" "2022-02-09" "2022-02-09" "2022-02-10"
[41] "2022-02-10" "2022-02-10" "2022-02-10" "2022-02-10" "2022-02-11"
[46] "2022-02-11" "2022-02-11" "2022-02-11" "2022-02-12" "2022-02-12"
[51] "2022-02-12" "2022-02-12" "2023-02-01" "2023-02-01" "2023-02-01"
[56] "2023-02-01" "2023-02-01" "2023-02-02" "2023-02-02" "2023-02-02"
[61] "2023-02-02" "2023-02-03" "2023-02-03" "2023-02-03" "2023-02-04"
[66] "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-05"
[71] "2023-02-05" "2023-02-05" "2023-02-05" "2023-02-06" "2023-02-06"
[76] "2023-02-06" "2023-02-06" "2023-02-07" "2023-02-07" "2023-02-07"
[81] "2023-02-07" "2023-02-07" "2023-02-08" "2023-02-08" "2023-02-08"
[86] "2023-02-08" "2023-02-09" "2023-02-09" "2023-02-09" "2023-02-09"
[91] "2023-02-10" "2023-02-10" "2023-02-10" "2023-02-10" "2023-02-10"
[96] "2023-02-11" "2023-02-11" "2023-02-11" "2023-02-11" "2023-02-12"
[101] "2023-02-12" "2023-02-12" "2023-02-12" "2024-02-01" "2024-02-01"
[106] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-02" "2024-02-02"
[111] "2024-02-02" "2024-02-02" "2024-02-03" "2024-02-03" "2024-02-03"
[116] "2024-02-03" "2024-02-04" "2024-02-04" "2024-02-04" "2024-02-04"
[121] "2024-02-04" "2024-02-05" "2024-02-05" "2024-02-05" "2024-02-05"
[126] "2024-02-06" "2024-02-06" "2024-02-06" "2024-02-06" "2024-02-07"
[131] "2024-02-07" "2024-02-07" "2024-02-07" "2024-02-07" "2024-02-08"
[136] "2024-02-08" "2024-02-08" "2024-02-08" "2024-02-09" "2024-02-09"
[141] "2024-02-09" "2024-02-09" "2024-02-10" "2024-02-10" "2024-02-10"
[146] "2024-02-10" "2024-02-10" "2024-02-11" "2024-02-11" "2024-02-11"
[151] "2024-02-11" "2024-02-12" "2024-02-12" "2024-02-12" "2024-02-12"
[156] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01"
[161] "2022-02-02" "2022-02-02" "2022-02-02" "2022-02-02" "2022-02-03"
[166] "2022-02-03" "2022-02-03" "2022-02-03" "2022-02-04" "2022-02-04"
[171] "2022-02-04" "2022-02-04" "2022-02-04" "2022-02-05" "2022-02-05"
[176] "2022-02-05" "2022-02-05" "2022-02-06" "2022-02-06" "2022-02-06"
[181] "2022-02-06" "2022-02-07" "2022-02-07" "2022-02-07" "2022-02-07"
[186] "2022-02-07" "2022-02-08" "2022-02-08" "2022-02-08" "2022-02-08"
[191] "2022-02-09" "2022-02-09" "2022-02-09" "2022-02-09" "2022-02-10"
[196] "2022-02-10" "2022-02-10" "2022-02-10" "2022-02-10" "2022-02-11"
[201] "2022-02-11" "2022-02-11" "2022-02-11" "2022-02-12" "2022-02-12"
[206] "2022-02-12" "2022-02-12" "2023-02-01" "2023-02-01" "2023-02-01"
[211] "2023-02-01" "2023-02-01" "2023-02-02" "2023-02-02" "2023-02-02"
[216] "2023-02-02" "2023-02-03" "2023-02-03" "2023-02-03" "2023-02-04"
[221] "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-05"
[226] "2023-02-05" "2023-02-05" "2023-02-05" "2023-02-06" "2023-02-06"
[231] "2023-02-06" "2023-02-06" "2023-02-07" "2023-02-07" "2023-02-07"
[236] "2023-02-07" "2023-02-07" "2023-02-08" "2023-02-08" "2023-02-08"
[241] "2023-02-08" "2023-02-09" "2023-02-09" "2023-02-09" "2023-02-09"
[246] "2023-02-10" "2023-02-10" "2023-02-10" "2023-02-10" "2023-02-10"
[251] "2023-02-11" "2023-02-11" "2023-02-11" "2023-02-11" "2023-02-12"
[256] "2023-02-12" "2023-02-12" "2023-02-12" "2024-02-01" "2024-02-01"
[261] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-02" "2024-02-02"
[266] "2024-02-02" "2024-02-02" "2024-02-03" "2024-02-03" "2024-02-03"
[271] "2024-02-03" "2024-02-04" "2024-02-04" "2024-02-04" "2024-02-04"
[276] "2024-02-04" "2024-02-05" "2024-02-05" "2024-02-05" "2024-02-05"
[281] "2024-02-06" "2024-02-06" "2024-02-06" "2024-02-06" "2024-02-07"
[286] "2024-02-07" "2024-02-07" "2024-02-07" "2024-02-07" "2024-02-08"
[291] "2024-02-08" "2024-02-08" "2024-02-08" "2024-02-09" "2024-02-09"
[296] "2024-02-09" "2024-02-09" "2024-02-10" "2024-02-10" "2024-02-10"
[301] "2024-02-10" "2024-02-10" "2024-02-11" "2024-02-11" "2024-02-11"
[306] "2024-02-11" "2024-02-12" "2024-02-12" "2024-02-12" "2024-02-12"
[311] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-01"
[316] "2024-02-02" "2024-02-02" "2024-02-02" "2024-02-02" "2024-02-03"
[321] "2024-02-03" "2024-02-03" "2024-02-03" "2024-02-04" "2024-02-04"
[326] "2024-02-04" "2024-02-04" "2024-02-04" "2024-02-05" "2024-02-05"
[331] "2024-02-05" "2024-02-05" "2024-02-06" "2024-02-06" "2024-02-06"
[336] "2024-02-06" "2024-02-07" "2024-02-07" "2024-02-07" "2024-02-07"
[341] "2024-02-07" "2024-02-08" "2024-02-08" "2024-02-08" "2024-02-08"
[346] "2024-02-09" "2024-02-09" "2024-02-09" "2024-02-09" "2024-02-10"
[351] "2024-02-10" "2024-02-10" "2024-02-10" "2024-02-10" "2024-02-11"
[356] "2024-02-11" "2024-02-11" "2024-02-11" "2024-02-12" "2024-02-12"
[361] "2024-02-12" "2024-02-12" "2024-02-01" "2024-02-01" "2024-02-01"
[366] "2024-02-01" "2024-02-01" "2024-02-02" "2024-02-02" "2024-02-02"
[371] "2024-02-02" "2024-02-03" "2024-02-03" "2024-02-03" "2024-02-03"
[376] "2024-02-04" "2024-02-04" "2024-02-04" "2024-02-04" "2024-02-04"
[381] "2024-02-05" "2024-02-05" "2024-02-05" "2024-02-05" "2024-02-06"
[386] "2024-02-06" "2024-02-06" "2024-02-06" "2024-02-07" "2024-02-07"
[391] "2024-02-07" "2024-02-07" "2024-02-07" "2024-02-08" "2024-02-08"
[396] "2024-02-08" "2024-02-08" "2024-02-09" "2024-02-09" "2024-02-09"
[401] "2024-02-09" "2024-02-10" "2024-02-10" "2024-02-10" "2024-02-10"
[406] "2024-02-10" "2024-02-11" "2024-02-11" "2024-02-11" "2024-02-11"
[411] "2024-02-12" "2024-02-12" "2024-02-12" "2024-02-12" "2023-02-01"
[416] "2023-02-01" "2023-02-01" "2023-02-01" "2023-02-01" "2023-02-02"
[421] "2023-02-02" "2023-02-02" "2023-02-02" "2023-02-03" "2023-02-03"
[426] "2023-02-03" "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-04"
[431] "2023-02-04" "2023-02-05" "2023-02-05" "2023-02-05" "2023-02-05"
[436] "2023-02-06" "2023-02-06" "2023-02-06" "2023-02-06" "2023-02-07"
[441] "2023-02-07" "2023-02-07" "2023-02-07" "2023-02-07" "2023-02-08"
[446] "2023-02-08" "2023-02-08" "2023-02-08" "2023-02-09" "2023-02-09"
[451] "2023-02-09" "2023-02-09" "2023-02-10" "2023-02-10" "2023-02-10"
[456] "2023-02-10" "2023-02-10" "2023-02-11" "2023-02-11" "2023-02-11"
[461] "2023-02-11" "2023-02-12" "2023-02-12" "2023-02-12" "2023-02-12"
[466] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-01"
[471] "2024-02-02" "2024-02-02" "2024-02-02" "2024-02-02" "2024-02-03"
[476] "2024-02-03" "2024-02-03" "2024-02-03" "2024-02-04" "2024-02-04"
[481] "2024-02-04" "2024-02-04" "2024-02-04" "2024-02-05" "2024-02-05"
[486] "2024-02-05" "2024-02-05" "2024-02-06" "2024-02-06" "2024-02-06"
[491] "2024-02-06" "2024-02-07" "2024-02-07" "2024-02-07" "2024-02-07"
[496] "2024-02-07" "2024-02-08" "2024-02-08" "2024-02-08" "2024-02-08"
[501] "2024-02-09" "2024-02-09" "2024-02-09" "2024-02-09" "2024-02-10"
[506] "2024-02-10" "2024-02-10" "2024-02-10" "2024-02-10" "2024-02-11"
[511] "2024-02-11" "2024-02-11" "2024-02-11" "2024-02-12" "2024-02-12"
[516] "2024-02-12" "2024-02-12" "2022-02-01" "2022-02-01" "2022-02-01"
[521] "2022-02-01" "2022-02-01" "2022-02-02" "2022-02-02" "2022-02-02"
[526] "2022-02-02" "2022-02-03" "2022-02-03" "2022-02-03" "2022-02-03"
[531] "2022-02-04" "2022-02-04" "2022-02-04" "2022-02-04" "2022-02-04"
[536] "2022-02-05" "2022-02-05" "2022-02-05" "2022-02-05" "2022-02-06"
[541] "2022-02-06" "2022-02-06" "2022-02-06" "2022-02-07" "2022-02-07"
[546] "2022-02-07" "2022-02-07" "2022-02-07" "2022-02-08" "2022-02-08"
[551] "2022-02-08" "2022-02-08" "2022-02-09" "2022-02-09" "2022-02-09"
[556] "2022-02-09" "2022-02-10" "2022-02-10" "2022-02-10" "2022-02-10"
[561] "2022-02-10" "2022-02-11" "2022-02-11" "2022-02-11" "2022-02-11"
[566] "2022-02-12" "2022-02-12" "2022-02-12" "2022-02-12" "2023-02-01"
[571] "2023-02-01" "2023-02-01" "2023-02-01" "2023-02-01" "2023-02-02"
[576] "2023-02-02" "2023-02-02" "2023-02-02" "2023-02-03" "2023-02-03"
[581] "2023-02-03" "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-04"
[586] "2023-02-04" "2023-02-05" "2023-02-05" "2023-02-05" "2023-02-05"
[591] "2023-02-06" "2023-02-06" "2023-02-06" "2023-02-06" "2023-02-07"
[596] "2023-02-07" "2023-02-07" "2023-02-07" "2023-02-07" "2023-02-08"
[601] "2023-02-08" "2023-02-08" "2023-02-08" "2023-02-09" "2023-02-09"
[606] "2023-02-09" "2023-02-09" "2023-02-10" "2023-02-10" "2023-02-10"
[611] "2023-02-10" "2023-02-10" "2023-02-11" "2023-02-11" "2023-02-11"
[616] "2023-02-11" "2023-02-12" "2023-02-12" "2023-02-12" "2023-02-12"
[621] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01"
[626] "2022-02-02" "2022-02-02" "2022-02-02" "2022-02-02" "2022-02-03"
[631] "2022-02-03" "2022-02-03" "2022-02-03" "2022-02-04" "2022-02-04"
[636] "2022-02-04" "2022-02-04" "2022-02-04" "2022-02-05" "2022-02-05"
[641] "2022-02-05" "2022-02-05" "2022-02-06" "2022-02-06" "2022-02-06"
[646] "2022-02-06" "2022-02-07" "2022-02-07" "2022-02-07" "2022-02-07"
[651] "2022-02-07" "2022-02-08" "2022-02-08" "2022-02-08" "2022-02-08"
[656] "2022-02-09" "2022-02-09" "2022-02-09" "2022-02-09" "2022-02-10"
[661] "2022-02-10" "2022-02-10" "2022-02-10" "2022-02-10" "2022-02-11"
[666] "2022-02-11" "2022-02-11" "2022-02-11" "2022-02-12" "2022-02-12"
[671] "2022-02-12" "2022-02-12" "2023-02-01" "2023-02-01" "2023-02-01"
[676] "2023-02-01" "2023-02-01" "2023-02-02" "2023-02-02" "2023-02-02"
[681] "2023-02-02" "2023-02-03" "2023-02-03" "2023-02-03" "2023-02-04"
[686] "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-05"
[691] "2023-02-05" "2023-02-05" "2023-02-05" "2023-02-06" "2023-02-06"
[696] "2023-02-06" "2023-02-06" "2023-02-07" "2023-02-07" "2023-02-07"
[701] "2023-02-07" "2023-02-07" "2023-02-08" "2023-02-08" "2023-02-08"
[706] "2023-02-08" "2023-02-09" "2023-02-09" "2023-02-09" "2023-02-09"
[711] "2023-02-10" "2023-02-10" "2023-02-10" "2023-02-10" "2023-02-10"
[716] "2023-02-11" "2023-02-11" "2023-02-11" "2023-02-11" "2023-02-12"
[721] "2023-02-12" "2023-02-12" "2023-02-12" "2024-02-01" "2024-02-01"
[726] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-02" "2024-02-02"
[731] "2024-02-02" "2024-02-02" "2024-02-03" "2024-02-03" "2024-02-03"
[736] "2024-02-03" "2024-02-04" "2024-02-04" "2024-02-04" "2024-02-04"
[741] "2024-02-04" "2024-02-05" "2024-02-05" "2024-02-05" "2024-02-05"
[746] "2024-02-06" "2024-02-06" "2024-02-06" "2024-02-06" "2024-02-07"
[751] "2024-02-07" "2024-02-07" "2024-02-07" "2024-02-07" "2024-02-08"
[756] "2024-02-08" "2024-02-08" "2024-02-08" "2024-02-09" "2024-02-09"
[761] "2024-02-09" "2024-02-09" "2024-02-10" "2024-02-10" "2024-02-10"
[766] "2024-02-10" "2024-02-10" "2024-02-11" "2024-02-11" "2024-02-11"
[771] "2024-02-11" "2024-02-12" "2024-02-12" "2024-02-12" "2024-02-12"
[776] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01"
[781] "2022-02-02" "2022-02-02" "2022-02-02" "2022-02-02" "2022-02-03"
[786] "2022-02-03" "2022-02-03" "2022-02-03" "2022-02-04" "2022-02-04"
[791] "2022-02-04" "2022-02-04" "2022-02-04" "2022-02-05" "2022-02-05"
[796] "2022-02-05" "2022-02-05" "2022-02-06" "2022-02-06" "2022-02-06"
[801] "2022-02-06" "2022-02-07" "2022-02-07" "2022-02-07" "2022-02-07"
[806] "2022-02-07" "2022-02-08" "2022-02-08" "2022-02-08" "2022-02-08"
[811] "2022-02-09" "2022-02-09" "2022-02-09" "2022-02-09" "2022-02-10"
[816] "2022-02-10" "2022-02-10" "2022-02-10" "2022-02-10" "2022-02-11"
[821] "2022-02-11" "2022-02-11" "2022-02-11" "2022-02-12" "2022-02-12"
[826] "2022-02-12" "2022-02-12" "2023-02-01" "2023-02-01" "2023-02-01"
[831] "2023-02-01" "2023-02-01" "2023-02-02" "2023-02-02" "2023-02-02"
[836] "2023-02-02" "2023-02-03" "2023-02-03" "2023-02-03" "2023-02-04"
[841] "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-05"
[846] "2023-02-05" "2023-02-05" "2023-02-05" "2023-02-06" "2023-02-06"
[851] "2023-02-06" "2023-02-06" "2023-02-07" "2023-02-07" "2023-02-07"
[856] "2023-02-07" "2023-02-07" "2023-02-08" "2023-02-08" "2023-02-08"
[861] "2023-02-08" "2023-02-09" "2023-02-09" "2023-02-09" "2023-02-09"
[866] "2023-02-10" "2023-02-10" "2023-02-10" "2023-02-10" "2023-02-10"
[871] "2023-02-11" "2023-02-11" "2023-02-11" "2023-02-11" "2023-02-12"
[876] "2023-02-12" "2023-02-12" "2023-02-12" "2024-02-01" "2024-02-01"
[881] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-02" "2024-02-02"
[886] "2024-02-02" "2024-02-02" "2024-02-03" "2024-02-03" "2024-02-03"
[891] "2024-02-03" "2024-02-04" "2024-02-04" "2024-02-04" "2024-02-04"
[896] "2024-02-04" "2024-02-05" "2024-02-05" "2024-02-05" "2024-02-05"
[901] "2024-02-06" "2024-02-06" "2024-02-06" "2024-02-06" "2024-02-07"
[906] "2024-02-07" "2024-02-07" "2024-02-07" "2024-02-07" "2024-02-08"
[911] "2024-02-08" "2024-02-08" "2024-02-08" "2024-02-09" "2024-02-09"
[916] "2024-02-09" "2024-02-09" "2024-02-10" "2024-02-10" "2024-02-10"
[921] "2024-02-10" "2024-02-10" "2024-02-11" "2024-02-11" "2024-02-11"
[926] "2024-02-11" "2024-02-12" "2024-02-12" "2024-02-12" "2024-02-12"
[931] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01"
[936] "2022-02-02" "2022-02-02" "2022-02-02" "2022-02-02" "2022-02-03"
[941] "2022-02-03" "2022-02-03" "2022-02-03" "2022-02-04" "2022-02-04"
[946] "2022-02-04" "2022-02-04" "2022-02-04" "2022-02-05" "2022-02-05"
[951] "2022-02-05" "2022-02-05" "2022-02-06" "2022-02-06" "2022-02-06"
[956] "2022-02-06" "2022-02-07" "2022-02-07" "2022-02-07" "2022-02-07"
[961] "2022-02-07" "2022-02-08" "2022-02-08" "2022-02-08" "2022-02-08"
[966] "2022-02-09" "2022-02-09" "2022-02-09" "2022-02-09" "2022-02-10"
[971] "2022-02-10" "2022-02-10" "2022-02-10" "2022-02-10" "2022-02-11"
[976] "2022-02-11" "2022-02-11" "2022-02-11" "2022-02-12" "2022-02-12"
[981] "2022-02-12" "2022-02-12" "2023-02-01" "2023-02-01" "2023-02-01"
[986] "2023-02-01" "2023-02-01" "2023-02-02" "2023-02-02" "2023-02-02"
[991] "2023-02-02" "2023-02-03" "2023-02-03" "2023-02-03" "2023-02-04"
[996] "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-04" "2023-02-05"
[ reached 'max' / getOption("max.print") -- omitted 240 entries ]
> stuff <- as.Date(agents2$MMWR.DATE, format = "%m/%d/%Y")
> stuff
[1] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[26] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[51] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[76] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[101] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[126] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[151] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[176] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[201] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[226] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[251] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[276] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[301] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[326] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[351] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[376] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[401] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[426] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[451] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[476] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[501] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[526] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[551] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[576] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[601] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[626] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[651] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[676] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[701] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[726] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[751] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[776] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[801] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[826] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[851] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[876] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[901] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[926] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[951] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[976] NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
[ reached 'max' / getOption("max.print") -- omitted 240 entries ]
> stuff2 <- as.Date(agents$`MMWR DATE`, format = "%m/%d/%Y")
> stuff2
[1] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[6] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[11] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[16] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[21] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[26] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[31] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[36] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[41] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[46] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[51] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[56] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[61] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[66] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[71] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[76] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[81] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[86] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[91] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[96] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[101] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[106] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[111] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[116] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[121] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[126] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[131] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[136] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[141] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[146] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[151] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[156] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[161] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[166] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[171] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[176] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[181] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[186] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[191] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[196] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[201] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[206] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[211] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[216] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[221] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[226] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[231] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[236] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[241] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[246] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[251] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[256] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[261] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[266] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[271] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[276] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[281] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[286] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[291] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[296] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[301] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[306] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[311] "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01"
[316] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-01" "2024-03-01"
[321] "2024-03-01" "2024-03-01" "2024-03-01" "2024-04-01" "2024-04-01"
[326] "2024-04-01" "2024-04-01" "2024-04-01" "2024-05-01" "2024-05-01"
[331] "2024-05-01" "2024-05-01" "2024-06-01" "2024-06-01" "2024-06-01"
[336] "2024-06-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01"
[341] "2024-07-01" "2024-08-01" "2024-08-01" "2024-08-01" "2024-08-01"
[346] "2024-09-01" "2024-09-01" "2024-09-01" "2024-09-01" "2024-10-01"
[351] "2024-10-01" "2024-10-01" "2024-10-01" "2024-10-01" "2024-11-01"
[356] "2024-11-01" "2024-11-01" "2024-11-01" "2024-12-01" "2024-12-01"
[361] "2024-12-01" "2024-12-01" "2024-01-01" "2024-01-01" "2024-01-01"
[366] "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01" "2024-02-01"
[371] "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01" "2024-03-01"
[376] "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[381] "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-06-01"
[386] "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01" "2024-07-01"
[391] "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01" "2024-08-01"
[396] "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01" "2024-09-01"
[401] "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01" "2024-10-01"
[406] "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01" "2024-11-01"
[411] "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01" "2023-01-01"
[416] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-02-01"
[421] "2023-02-01" "2023-02-01" "2023-02-01" "2023-03-01" "2023-03-01"
[426] "2023-03-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01"
[431] "2023-04-01" "2023-05-01" "2023-05-01" "2023-05-01" "2023-05-01"
[436] "2023-06-01" "2023-06-01" "2023-06-01" "2023-06-01" "2023-07-01"
[441] "2023-07-01" "2023-07-01" "2023-07-01" "2023-07-01" "2023-08-01"
[446] "2023-08-01" "2023-08-01" "2023-08-01" "2023-09-01" "2023-09-01"
[451] "2023-09-01" "2023-09-01" "2023-10-01" "2023-10-01" "2023-10-01"
[456] "2023-10-01" "2023-10-01" "2023-11-01" "2023-11-01" "2023-11-01"
[461] "2023-11-01" "2023-12-01" "2023-12-01" "2023-12-01" "2023-12-01"
[466] "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01"
[471] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-01" "2024-03-01"
[476] "2024-03-01" "2024-03-01" "2024-03-01" "2024-04-01" "2024-04-01"
[481] "2024-04-01" "2024-04-01" "2024-04-01" "2024-05-01" "2024-05-01"
[486] "2024-05-01" "2024-05-01" "2024-06-01" "2024-06-01" "2024-06-01"
[491] "2024-06-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01"
[496] "2024-07-01" "2024-08-01" "2024-08-01" "2024-08-01" "2024-08-01"
[501] "2024-09-01" "2024-09-01" "2024-09-01" "2024-09-01" "2024-10-01"
[506] "2024-10-01" "2024-10-01" "2024-10-01" "2024-10-01" "2024-11-01"
[511] "2024-11-01" "2024-11-01" "2024-11-01" "2024-12-01" "2024-12-01"
[516] "2024-12-01" "2024-12-01" "2022-01-01" "2022-01-01" "2022-01-01"
[521] "2022-01-01" "2022-01-01" "2022-02-01" "2022-02-01" "2022-02-01"
[526] "2022-02-01" "2022-03-01" "2022-03-01" "2022-03-01" "2022-03-01"
[531] "2022-04-01" "2022-04-01" "2022-04-01" "2022-04-01" "2022-04-01"
[536] "2022-05-01" "2022-05-01" "2022-05-01" "2022-05-01" "2022-06-01"
[541] "2022-06-01" "2022-06-01" "2022-06-01" "2022-07-01" "2022-07-01"
[546] "2022-07-01" "2022-07-01" "2022-07-01" "2022-08-01" "2022-08-01"
[551] "2022-08-01" "2022-08-01" "2022-09-01" "2022-09-01" "2022-09-01"
[556] "2022-09-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01"
[561] "2022-10-01" "2022-11-01" "2022-11-01" "2022-11-01" "2022-11-01"
[566] "2022-12-01" "2022-12-01" "2022-12-01" "2022-12-01" "2023-01-01"
[571] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-02-01"
[576] "2023-02-01" "2023-02-01" "2023-02-01" "2023-03-01" "2023-03-01"
[581] "2023-03-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01"
[586] "2023-04-01" "2023-05-01" "2023-05-01" "2023-05-01" "2023-05-01"
[591] "2023-06-01" "2023-06-01" "2023-06-01" "2023-06-01" "2023-07-01"
[596] "2023-07-01" "2023-07-01" "2023-07-01" "2023-07-01" "2023-08-01"
[601] "2023-08-01" "2023-08-01" "2023-08-01" "2023-09-01" "2023-09-01"
[606] "2023-09-01" "2023-09-01" "2023-10-01" "2023-10-01" "2023-10-01"
[611] "2023-10-01" "2023-10-01" "2023-11-01" "2023-11-01" "2023-11-01"
[616] "2023-11-01" "2023-12-01" "2023-12-01" "2023-12-01" "2023-12-01"
[621] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[626] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[631] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[636] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[641] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[646] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[651] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[656] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[661] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[666] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[671] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[676] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[681] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[686] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[691] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[696] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[701] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[706] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[711] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[716] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[721] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[726] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[731] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[736] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[741] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[746] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[751] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[756] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[761] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[766] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[771] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[776] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[781] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[786] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[791] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[796] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[801] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[806] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[811] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[816] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[821] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[826] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[831] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[836] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[841] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[846] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[851] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[856] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[861] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[866] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[871] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[876] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[881] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[886] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[891] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[896] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[901] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[906] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[911] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[916] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[921] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[926] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[931] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[936] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[941] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[946] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[951] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[956] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[961] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[966] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[971] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[976] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[981] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[986] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[991] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[996] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[ reached 'max' / getOption("max.print") -- omitted 240 entries ]
> stuff3 <- as.Date(stuff2, format = "%m/%Y")
> stuff3
[1] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[6] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[11] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[16] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[21] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[26] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[31] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[36] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[41] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[46] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[51] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[56] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[61] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[66] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[71] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[76] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[81] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[86] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[91] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[96] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[101] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[106] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[111] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[116] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[121] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[126] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[131] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[136] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[141] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[146] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[151] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[156] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[161] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[166] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[171] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[176] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[181] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[186] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[191] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[196] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[201] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[206] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[211] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[216] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[221] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[226] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[231] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[236] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[241] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[246] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[251] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[256] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[261] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[266] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[271] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[276] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[281] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[286] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[291] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[296] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[301] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[306] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[311] "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01"
[316] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-01" "2024-03-01"
[321] "2024-03-01" "2024-03-01" "2024-03-01" "2024-04-01" "2024-04-01"
[326] "2024-04-01" "2024-04-01" "2024-04-01" "2024-05-01" "2024-05-01"
[331] "2024-05-01" "2024-05-01" "2024-06-01" "2024-06-01" "2024-06-01"
[336] "2024-06-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01"
[341] "2024-07-01" "2024-08-01" "2024-08-01" "2024-08-01" "2024-08-01"
[346] "2024-09-01" "2024-09-01" "2024-09-01" "2024-09-01" "2024-10-01"
[351] "2024-10-01" "2024-10-01" "2024-10-01" "2024-10-01" "2024-11-01"
[356] "2024-11-01" "2024-11-01" "2024-11-01" "2024-12-01" "2024-12-01"
[361] "2024-12-01" "2024-12-01" "2024-01-01" "2024-01-01" "2024-01-01"
[366] "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01" "2024-02-01"
[371] "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01" "2024-03-01"
[376] "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[381] "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-06-01"
[386] "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01" "2024-07-01"
[391] "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01" "2024-08-01"
[396] "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01" "2024-09-01"
[401] "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01" "2024-10-01"
[406] "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01" "2024-11-01"
[411] "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01" "2023-01-01"
[416] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-02-01"
[421] "2023-02-01" "2023-02-01" "2023-02-01" "2023-03-01" "2023-03-01"
[426] "2023-03-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01"
[431] "2023-04-01" "2023-05-01" "2023-05-01" "2023-05-01" "2023-05-01"
[436] "2023-06-01" "2023-06-01" "2023-06-01" "2023-06-01" "2023-07-01"
[441] "2023-07-01" "2023-07-01" "2023-07-01" "2023-07-01" "2023-08-01"
[446] "2023-08-01" "2023-08-01" "2023-08-01" "2023-09-01" "2023-09-01"
[451] "2023-09-01" "2023-09-01" "2023-10-01" "2023-10-01" "2023-10-01"
[456] "2023-10-01" "2023-10-01" "2023-11-01" "2023-11-01" "2023-11-01"
[461] "2023-11-01" "2023-12-01" "2023-12-01" "2023-12-01" "2023-12-01"
[466] "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01"
[471] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-01" "2024-03-01"
[476] "2024-03-01" "2024-03-01" "2024-03-01" "2024-04-01" "2024-04-01"
[481] "2024-04-01" "2024-04-01" "2024-04-01" "2024-05-01" "2024-05-01"
[486] "2024-05-01" "2024-05-01" "2024-06-01" "2024-06-01" "2024-06-01"
[491] "2024-06-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01"
[496] "2024-07-01" "2024-08-01" "2024-08-01" "2024-08-01" "2024-08-01"
[501] "2024-09-01" "2024-09-01" "2024-09-01" "2024-09-01" "2024-10-01"
[506] "2024-10-01" "2024-10-01" "2024-10-01" "2024-10-01" "2024-11-01"
[511] "2024-11-01" "2024-11-01" "2024-11-01" "2024-12-01" "2024-12-01"
[516] "2024-12-01" "2024-12-01" "2022-01-01" "2022-01-01" "2022-01-01"
[521] "2022-01-01" "2022-01-01" "2022-02-01" "2022-02-01" "2022-02-01"
[526] "2022-02-01" "2022-03-01" "2022-03-01" "2022-03-01" "2022-03-01"
[531] "2022-04-01" "2022-04-01" "2022-04-01" "2022-04-01" "2022-04-01"
[536] "2022-05-01" "2022-05-01" "2022-05-01" "2022-05-01" "2022-06-01"
[541] "2022-06-01" "2022-06-01" "2022-06-01" "2022-07-01" "2022-07-01"
[546] "2022-07-01" "2022-07-01" "2022-07-01" "2022-08-01" "2022-08-01"
[551] "2022-08-01" "2022-08-01" "2022-09-01" "2022-09-01" "2022-09-01"
[556] "2022-09-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01"
[561] "2022-10-01" "2022-11-01" "2022-11-01" "2022-11-01" "2022-11-01"
[566] "2022-12-01" "2022-12-01" "2022-12-01" "2022-12-01" "2023-01-01"
[571] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-02-01"
[576] "2023-02-01" "2023-02-01" "2023-02-01" "2023-03-01" "2023-03-01"
[581] "2023-03-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01"
[586] "2023-04-01" "2023-05-01" "2023-05-01" "2023-05-01" "2023-05-01"
[591] "2023-06-01" "2023-06-01" "2023-06-01" "2023-06-01" "2023-07-01"
[596] "2023-07-01" "2023-07-01" "2023-07-01" "2023-07-01" "2023-08-01"
[601] "2023-08-01" "2023-08-01" "2023-08-01" "2023-09-01" "2023-09-01"
[606] "2023-09-01" "2023-09-01" "2023-10-01" "2023-10-01" "2023-10-01"
[611] "2023-10-01" "2023-10-01" "2023-11-01" "2023-11-01" "2023-11-01"
[616] "2023-11-01" "2023-12-01" "2023-12-01" "2023-12-01" "2023-12-01"
[621] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[626] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[631] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[636] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[641] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[646] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[651] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[656] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[661] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[666] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[671] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[676] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[681] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[686] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[691] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[696] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[701] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[706] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[711] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[716] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[721] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[726] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[731] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[736] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[741] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[746] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[751] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[756] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[761] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[766] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[771] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[776] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[781] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[786] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[791] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[796] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[801] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[806] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[811] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[816] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[821] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[826] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[831] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[836] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[841] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[846] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[851] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[856] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[861] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[866] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[871] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[876] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[881] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[886] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[891] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[896] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[901] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[906] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[911] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[916] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[921] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[926] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[931] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[936] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[941] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[946] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[951] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[956] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[961] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[966] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[971] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[976] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[981] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[986] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[991] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[996] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[ reached 'max' / getOption("max.print") -- omitted 240 entries ]
> stuff3 <- as.Date(stuff2, format = "%m/%y")
> stuff3
[1] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[6] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[11] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[16] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[21] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[26] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[31] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[36] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[41] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[46] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[51] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[56] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[61] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[66] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[71] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[76] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[81] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[86] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[91] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[96] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[101] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[106] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[111] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[116] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[121] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[126] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[131] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[136] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[141] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[146] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[151] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[156] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[161] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[166] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[171] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[176] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[181] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[186] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[191] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[196] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[201] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[206] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[211] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[216] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[221] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[226] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[231] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[236] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[241] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[246] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[251] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[256] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[261] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[266] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[271] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[276] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[281] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[286] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[291] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[296] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[301] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[306] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[311] "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01"
[316] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-01" "2024-03-01"
[321] "2024-03-01" "2024-03-01" "2024-03-01" "2024-04-01" "2024-04-01"
[326] "2024-04-01" "2024-04-01" "2024-04-01" "2024-05-01" "2024-05-01"
[331] "2024-05-01" "2024-05-01" "2024-06-01" "2024-06-01" "2024-06-01"
[336] "2024-06-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01"
[341] "2024-07-01" "2024-08-01" "2024-08-01" "2024-08-01" "2024-08-01"
[346] "2024-09-01" "2024-09-01" "2024-09-01" "2024-09-01" "2024-10-01"
[351] "2024-10-01" "2024-10-01" "2024-10-01" "2024-10-01" "2024-11-01"
[356] "2024-11-01" "2024-11-01" "2024-11-01" "2024-12-01" "2024-12-01"
[361] "2024-12-01" "2024-12-01" "2024-01-01" "2024-01-01" "2024-01-01"
[366] "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01" "2024-02-01"
[371] "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01" "2024-03-01"
[376] "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[381] "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-06-01"
[386] "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01" "2024-07-01"
[391] "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01" "2024-08-01"
[396] "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01" "2024-09-01"
[401] "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01" "2024-10-01"
[406] "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01" "2024-11-01"
[411] "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01" "2023-01-01"
[416] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-02-01"
[421] "2023-02-01" "2023-02-01" "2023-02-01" "2023-03-01" "2023-03-01"
[426] "2023-03-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01"
[431] "2023-04-01" "2023-05-01" "2023-05-01" "2023-05-01" "2023-05-01"
[436] "2023-06-01" "2023-06-01" "2023-06-01" "2023-06-01" "2023-07-01"
[441] "2023-07-01" "2023-07-01" "2023-07-01" "2023-07-01" "2023-08-01"
[446] "2023-08-01" "2023-08-01" "2023-08-01" "2023-09-01" "2023-09-01"
[451] "2023-09-01" "2023-09-01" "2023-10-01" "2023-10-01" "2023-10-01"
[456] "2023-10-01" "2023-10-01" "2023-11-01" "2023-11-01" "2023-11-01"
[461] "2023-11-01" "2023-12-01" "2023-12-01" "2023-12-01" "2023-12-01"
[466] "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01" "2024-01-01"
[471] "2024-02-01" "2024-02-01" "2024-02-01" "2024-02-01" "2024-03-01"
[476] "2024-03-01" "2024-03-01" "2024-03-01" "2024-04-01" "2024-04-01"
[481] "2024-04-01" "2024-04-01" "2024-04-01" "2024-05-01" "2024-05-01"
[486] "2024-05-01" "2024-05-01" "2024-06-01" "2024-06-01" "2024-06-01"
[491] "2024-06-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01"
[496] "2024-07-01" "2024-08-01" "2024-08-01" "2024-08-01" "2024-08-01"
[501] "2024-09-01" "2024-09-01" "2024-09-01" "2024-09-01" "2024-10-01"
[506] "2024-10-01" "2024-10-01" "2024-10-01" "2024-10-01" "2024-11-01"
[511] "2024-11-01" "2024-11-01" "2024-11-01" "2024-12-01" "2024-12-01"
[516] "2024-12-01" "2024-12-01" "2022-01-01" "2022-01-01" "2022-01-01"
[521] "2022-01-01" "2022-01-01" "2022-02-01" "2022-02-01" "2022-02-01"
[526] "2022-02-01" "2022-03-01" "2022-03-01" "2022-03-01" "2022-03-01"
[531] "2022-04-01" "2022-04-01" "2022-04-01" "2022-04-01" "2022-04-01"
[536] "2022-05-01" "2022-05-01" "2022-05-01" "2022-05-01" "2022-06-01"
[541] "2022-06-01" "2022-06-01" "2022-06-01" "2022-07-01" "2022-07-01"
[546] "2022-07-01" "2022-07-01" "2022-07-01" "2022-08-01" "2022-08-01"
[551] "2022-08-01" "2022-08-01" "2022-09-01" "2022-09-01" "2022-09-01"
[556] "2022-09-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01"
[561] "2022-10-01" "2022-11-01" "2022-11-01" "2022-11-01" "2022-11-01"
[566] "2022-12-01" "2022-12-01" "2022-12-01" "2022-12-01" "2023-01-01"
[571] "2023-01-01" "2023-01-01" "2023-01-01" "2023-01-01" "2023-02-01"
[576] "2023-02-01" "2023-02-01" "2023-02-01" "2023-03-01" "2023-03-01"
[581] "2023-03-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01"
[586] "2023-04-01" "2023-05-01" "2023-05-01" "2023-05-01" "2023-05-01"
[591] "2023-06-01" "2023-06-01" "2023-06-01" "2023-06-01" "2023-07-01"
[596] "2023-07-01" "2023-07-01" "2023-07-01" "2023-07-01" "2023-08-01"
[601] "2023-08-01" "2023-08-01" "2023-08-01" "2023-09-01" "2023-09-01"
[606] "2023-09-01" "2023-09-01" "2023-10-01" "2023-10-01" "2023-10-01"
[611] "2023-10-01" "2023-10-01" "2023-11-01" "2023-11-01" "2023-11-01"
[616] "2023-11-01" "2023-12-01" "2023-12-01" "2023-12-01" "2023-12-01"
[621] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[626] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[631] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[636] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[641] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[646] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[651] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[656] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[661] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[666] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[671] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[676] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[681] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[686] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[691] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[696] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[701] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[706] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[711] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[716] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[721] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[726] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[731] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[736] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[741] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[746] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[751] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[756] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[761] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[766] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[771] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[776] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[781] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[786] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[791] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[796] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[801] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[806] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[811] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[816] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[821] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[826] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[831] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[836] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[841] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[846] "2023-05-01" "2023-05-01" "2023-05-01" "2023-06-01" "2023-06-01"
[851] "2023-06-01" "2023-06-01" "2023-07-01" "2023-07-01" "2023-07-01"
[856] "2023-07-01" "2023-07-01" "2023-08-01" "2023-08-01" "2023-08-01"
[861] "2023-08-01" "2023-09-01" "2023-09-01" "2023-09-01" "2023-09-01"
[866] "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01" "2023-10-01"
[871] "2023-11-01" "2023-11-01" "2023-11-01" "2023-11-01" "2023-12-01"
[876] "2023-12-01" "2023-12-01" "2023-12-01" "2024-01-01" "2024-01-01"
[881] "2024-01-01" "2024-01-01" "2024-01-01" "2024-02-01" "2024-02-01"
[886] "2024-02-01" "2024-02-01" "2024-03-01" "2024-03-01" "2024-03-01"
[891] "2024-03-01" "2024-04-01" "2024-04-01" "2024-04-01" "2024-04-01"
[896] "2024-04-01" "2024-05-01" "2024-05-01" "2024-05-01" "2024-05-01"
[901] "2024-06-01" "2024-06-01" "2024-06-01" "2024-06-01" "2024-07-01"
[906] "2024-07-01" "2024-07-01" "2024-07-01" "2024-07-01" "2024-08-01"
[911] "2024-08-01" "2024-08-01" "2024-08-01" "2024-09-01" "2024-09-01"
[916] "2024-09-01" "2024-09-01" "2024-10-01" "2024-10-01" "2024-10-01"
[921] "2024-10-01" "2024-10-01" "2024-11-01" "2024-11-01" "2024-11-01"
[926] "2024-11-01" "2024-12-01" "2024-12-01" "2024-12-01" "2024-12-01"
[931] "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01" "2022-01-01"
[936] "2022-02-01" "2022-02-01" "2022-02-01" "2022-02-01" "2022-03-01"
[941] "2022-03-01" "2022-03-01" "2022-03-01" "2022-04-01" "2022-04-01"
[946] "2022-04-01" "2022-04-01" "2022-04-01" "2022-05-01" "2022-05-01"
[951] "2022-05-01" "2022-05-01" "2022-06-01" "2022-06-01" "2022-06-01"
[956] "2022-06-01" "2022-07-01" "2022-07-01" "2022-07-01" "2022-07-01"
[961] "2022-07-01" "2022-08-01" "2022-08-01" "2022-08-01" "2022-08-01"
[966] "2022-09-01" "2022-09-01" "2022-09-01" "2022-09-01" "2022-10-01"
[971] "2022-10-01" "2022-10-01" "2022-10-01" "2022-10-01" "2022-11-01"
[976] "2022-11-01" "2022-11-01" "2022-11-01" "2022-12-01" "2022-12-01"
[981] "2022-12-01" "2022-12-01" "2023-01-01" "2023-01-01" "2023-01-01"
[986] "2023-01-01" "2023-01-01" "2023-02-01" "2023-02-01" "2023-02-01"
[991] "2023-02-01" "2023-03-01" "2023-03-01" "2023-03-01" "2023-04-01"
[996] "2023-04-01" "2023-04-01" "2023-04-01" "2023-04-01" "2023-05-01"
[ reached 'max' / getOption("max.print") -- omitted 240 entries ]
agents4 %>%
  + filter(Infectious_Agent_Name == "Campylobacteriosis")
# A tibble: 155 × 5
Infectious_Agent_Name Current_week `Current MMWR Year` `MMWR DATE` Date     
<chr>                        <dbl>               <dbl> <chr>       <yearmon>
  1 Campylobacteriosis             199                2022 1/1/2022    Jan 2022 
2 Campylobacteriosis             154                2022 1/1/2022    Jan 2022 
3 Campylobacteriosis             116                2022 1/1/2022    Jan 2022 
4 Campylobacteriosis             121                2022 1/1/2022    Jan 2022 
5 Campylobacteriosis              85                2022 1/1/2022    Jan 2022 
6 Campylobacteriosis             152                2022 2/1/2022    Feb 2022 
7 Campylobacteriosis             348                2022 2/1/2022    Feb 2022 
8 Campylobacteriosis             191                2022 2/1/2022    Feb 2022 
9 Campylobacteriosis             211                2022 2/1/2022    Feb 2022 
10 Campylobacteriosis             347                2022 3/1/2022    Mar 2022 
# ℹ 145 more rows
# ℹ Use `print(n = ...)` to see more rows
> camp <- agents4 %>%
  + filter(Infectious_Agent_Name == "Campylobacteriosis")
> camp
# A tibble: 155 × 5
Infectious_Agent_Name Current_week `Current MMWR Year` `MMWR DATE` Date     
<chr>                        <dbl>               <dbl> <chr>       <yearmon>
  1 Campylobacteriosis             199                2022 1/1/2022    Jan 2022 
2 Campylobacteriosis             154                2022 1/1/2022    Jan 2022 
3 Campylobacteriosis             116                2022 1/1/2022    Jan 2022 
4 Campylobacteriosis             121                2022 1/1/2022    Jan 2022 
5 Campylobacteriosis              85                2022 1/1/2022    Jan 2022 
6 Campylobacteriosis             152                2022 2/1/2022    Feb 2022 
7 Campylobacteriosis             348                2022 2/1/2022    Feb 2022 
8 Campylobacteriosis             191                2022 2/1/2022    Feb 2022 
9 Campylobacteriosis             211                2022 2/1/2022    Feb 2022 
10 Campylobacteriosis             347                2022 3/1/2022    Mar 2022 
# ℹ 145 more rows
# ℹ Use `print(n = ...)` to see more rows
> round(cor(camp$Date, camp$Current_week, method = c("pearson"),4 )
        + d
        Error: unexpected symbol in:
          "round(cor(camp$Date, camp$Current_week, method = c("pearson"),4 )
d"
        > round(cor(camp$Date, camp$Current_week, method = c("pearson")),4)
        Error in cor(camp$Date, camp$Current_week, method = c("pearson")) : 
          'x' must be numeric
        > agents4 %>%
          + filter(Infectious_Agent_Name == "Chlamydia Trachomatis") %>%
          + ggplot(aes(x = Date, y = Current_week)) + geom_point()
        Warning message:
          The `trans` argument of `continuous_scale()` is deprecated as of ggplot2 3.5.0.
        ℹ Please use the `transform` argument instead.
        This warning is displayed once every 8 hours.
        Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
        generated. 
        > agents4 %>%
          + filter(Infectious_Agent_Name == "Chlamydia Trachomatis") %>%
          + ggplot(aes(x = Date, y = Current_week)) + geom_point() + 
          + labs(x = "Time", y = "# of cases", title = "Chlamydia Weekly Infectious Cases from 2022 to 2024")
        > agents4 %>%
          +     + filter(Infectious_Agent_Name == "Chlamydia Trachomatis") %>%
          +     + ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth()
        Error in filter(Infectious_Agent_Name == "Chlamydia Trachomatis") : 
          object 'Infectious_Agent_Name' not found
        > agents4 %>%
          + filter(Infectious_Agent_Name == "Chlamydia Trachomatis") %>%
          + ggplot(aes(x = Date, y = Current_week)) + geom_point() + 
          + labs(x = "Time", y = "# of cases", title = "Chlamydia Weekly Infectious Cases from 2022 to 2024")
        > agents4 %>%
          +     + filter(Infectious_Agent_Name == "Chlamydia Trachomatis") %>%
          +     + ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth()
        Error in filter(Infectious_Agent_Name == "Chlamydia Trachomatis") : 
          object 'Infectious_Agent_Name' not found
        > agents4 %>%
          +     filter(Infectious_Agent_Name == "Chlamydia Trachomatis") %>%
          +     ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth() +
          + labs(x = "Time", y = "# of cases", title = "Chlamydia Weekly Infectious Cases from 2022 to 2024")
        `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
        > agents4 %>%
          +     filter(Infectious_Agent_Name == "Chronic Hepatitis B") %>%
          +     ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth() +
          +     labs(x = "Time", y = "# of cases", title = "Chronic Hepatitis B Weekly Infectious Cases in 2024")
        `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
        > agents4 %>%
          +     filter(Infectious_Agent_Name == "Chronic Hepatitis C") %>%
          +     ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth() +
          +     labs(x = "Time", y = "# of cases", title = "Chronic Hepatitis C Weekly Infectious Cases in 2024")
        `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
        > agents4 %>%
          +     filter(Infectious_Agent_Name == "Coccidioidomycosis") %>%
          +     ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth() +
          +     labs(x = "Time", y = "# of cases", title = "Coccidioidomycosis Weekly Infectious Cases from 2023 to 2024")
        `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
        > agents4 %>%
          +     filter(Infectious_Agent_Name == "Coccidioidomycosis") %>%
          +     ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth() +
          +     labs(x = "Time", y = "# of cases", title = "Coccidioidomycosis Weekly Infectious Cases from 2023-2024")
        `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
        > agents4 %>%
          +     filter(Infectious_Agent_Name == "Ehrlichiosis and Anaplasmosis") %>%
          +     ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth() +
          +     labs(x = "Time", y = "# of cases", title = "Ehrlichiosis Weekly Infectious Cases from 2022-2024")
        `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
        > agents4 %>%
          +     filter(Infectious_Agent_Name == "Gonorrhea") %>%
          +     ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth() +
          +     labs(x = "Time", y = "# of cases", title = "Gonorrhea Weekly Infectious Cases from 2022-2024")
        `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
        > agents4 %>%
          +     filter(Infectious_Agent_Name == "Invasive pneumoccocal disease") %>%
          +     ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth() +
          +     labs(x = "Time", y = "# of cases", title = "Pneumococcal Weekly Infectious Cases from 2022-2024")
        > agents4 %>%
          +     filter(Infectious_Agent_Name == "Invasive pneumococcal disease") %>%
          +     ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth() +
          +     labs(x = "Time", y = "# of cases", title = "Pneumococcal Weekly Infectious Cases from 2022-2024")
        `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
        > agents4 %>%
          +     filter(Infectious_Agent_Name == "Pertussis") %>%
          +     ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth() +
          +     labs(x = "Time", y = "# of cases", title = "Pertussis Weekly Infectious Cases from 2022-2024")
        `geom_smooth()` using method = 'loess' and formula = 'y ~ x'
        > agents4 %>%
          +     filter(Infectious_Agent_Name == "Salmonellosis") %>%
          +     ggplot(aes(x = Date, y = Current_week)) + geom_point() + geom_smooth() +
          +     labs(x = "Time", y = "# of cases", title = "Salmonellosis Weekly Infectious Cases from 2022-2024")
        `geom_smooth()` using method = 'loess' and formula = 'y ~ x'