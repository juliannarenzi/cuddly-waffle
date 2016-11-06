# Arithmetic calculation
2 + 3

# Assigning variables
x <- 3
x = 3
y <- 4
x
y

# Plotting in R
x <- c(1,2,3)
y <- c(3,4,1)
plot(x,y)

# Class of variabiles 
class(x)
class(y)

# Strings (multiple words?)
str <- "This is my first script"
class(str)
length(str)

"This is my first script" -> str2

# Clear my history
rm(list = ls())
ls()

# Functions
?mean
?sd
?max

# Total function
# 4 components of a function:
# 1. Name of the function
# 2. Function statement
# 3. Some argument
# 4. Body
# 5. Return statement (#optional)

my_sum <- function(input_1, input_2) {
  tot = input_1 + input_2
  return(tot) # return in optional--just a good practice so you remember what you are getting out of the function
}

# Assigning values
input_1 = 3
input_2 = 4

# Calling a function
my_sum(input_1=2,input_2=4)
my_sum(input_1=4,input_2=5)

# Native function in R
sum(input_1+input_2)

# How about converting fah to Kelvin

fah_to_kelvin <- function(temp) {
    kelvin <- ((temp-32) * (5/9)) + 273.15
    return(kelvin)
}

fah_to_kelvin(temp=32)
fah_to_kelvin(32)

# How about converting Kelvin to Celsius

kel_to_cel <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

kel_to_cel(0)

# EXERCISE: write a function to convert fah_to_celsius

fah_to_cel <- function(temp) {
  celsius <- ((temp-32) * (5/9))
  return(celsius)
}

fah_to_cel(temp=0)

fah_to_celsius2 <- function(temp) {
  celsius <- kel_to_cel(fah_to_kelvin(temp))
  return(celsius)
}

fah_to_celsius2(temp=0)

# Exercise 2

best_practice <- c("write", "programs", "for", "people", "not", "computers")
asterix <- "***"

# Write a function called "fence" that takes two arguments and returns 
# a new vector something with a asterix a tthe beginning and at the end

fence <- function(input1,input2) {
  desired_sentence <- c(input2,input1,input2)
  return(desired_sentence)
}

fence(input1 = best_practice, input2 = asterix)

# Now doing something with a real dataset

dir.create("data") # create a directory/folder
?dir.create

download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data/gapminder.csv")


# Clear the functions - fah_to_kelvin and kel_to_cel
ls()

# Now call fah_to_cel_functions.R script to convert fah_to_celsius

source("fah_to_cel_functions.R") # gets functions from a different script (e.g. the fah_to_cel_functions.R script)
kel_to_cel(0)
fah_to_kelvin(0)

dat <- read.csv("data/gapminder.csv", header=TRUE)
head(dat)
summary(dat)
help("str")
str(dat)

# Write a function called analyze that takes country as an argument and displays mean, min, and max lifeExp of that country

#1. Subset the dataframe

country_name <- subset(dat, dat$country == "Uganda")
  
head(country_name)
summary(country_name)

#2. Calculate mean, minimum, and max of LifeExp

mean(country_name$lifeExp)
mean(country_name[,5])  
min(country_name$lifeExp)
max(country_name$lifeExp)

#3. The function

analyze <- function(country_name) {
  country_name <- subset(dat, dat$country == country)
  print(mean(country_name[,5])) #use print here because otherwise will only spit out the first command
  print(min(country_name[,5]))
  print(max(country_name[,5]))
}

analyze("Uganda")

analyze <- function(countr) {
  country_name <- subset(dat, dat$country == countr)
  print(mean(country_name[,5])) #use print here because otherwise will only spit out the first command
  print(min(country_name[,5]))
  print(max(country_name[,5]))
  out <- c("mean_le" = mean(country_name[,5]), "min_le" = min(country_name[,5]), "max_le" = max(country_name[,5]))
  plot(country_name$year,country_name$lifeExp, xlab="Year", ylab="Life Expectancy", main=countr)
  print(out)
}

analyze(countr="Uganda")
analyze("Albania")
analyze("Cambodia")
analyze("Senegal")

# Modify the analyze function to generate a plot with year vs. LifeExp

analyze("Albania")


for (w in best_practice) {
  print(w)
}

best_practice_fun2 <- function(some_argument) {
  for (w in best_practice)
    print(w)
}

best_practice_fun2(best_practice)

# Generate a file that contains years "1952" and "1997" and name as gapminder_52_97
# Another with "1997" and "2007"

gapminder_52_97 <- subset(dat, dat$year == c(1952,1997))
head(gapminder_52_97)

gapminder_67_07 <- subset(dat, dat$year == 1967 | dat$year == 2007)
head(gapminder_67_07)

# Write a dataset

write.csv(file = "data/gapminder_52_97.csv", gapminder_52_97, row.names = FALSE, quote = FALSE)
write.csv(file = "data/gapminder_67_07.csv", gapminder_67_07, row.names = FALSE, quote = FALSE)

# Listing the files with a pattern in a directory 
list.files(path = "data", pattern = ".csv", full.names = TRUE)

# Write a for loop to print each filename on a different line

filenames <- list.files(path = "data", pattern = ".csv", full.names = TRUE)
for (f in filenames) {
  print(f)
}

# Using the function you wrote this morning to print out the results from multiple data-sets

analyze_data <- function(file, new) {
  file_out <- read.csv(file, header = TRUE)
  country_name <- subset(file_out, file_out$country ==new)
  print(mean(country_name[,5])) #use print here because otherwise will only spit out the first command
  print(min(country_name[,5]))
  print(max(country_name[,5]))
  out <- c("mean_le" = mean(country_name[,5]), "min_le" = min(country_name[,5]), "max_le" = max(country_name[,5]))
  plot(country_name$year,country_name$lifeExp, xlab="Year", ylab="Life Expectancy", main=countr)
  print(out)
}

analyze_all <-function(pattern, new) {
  filenames <- list.files(path = "data", pattern = ".csv", full.names = TRUE)
  for (f in filenames) {
    analyze_data(f,new)
  }
}

analyze_all(".csv", "Uganda")
