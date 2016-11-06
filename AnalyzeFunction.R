analyze <- function(countr) {
  country_name <- subset(dat, dat$country == countr)
  print(mean(country_name[,5])) #use print here because otherwise will only spit out the first command
  print(min(country_name[,5]))
  print(max(country_name[,5]))
  out <- c("mean_le" = mean(country_name[,5]), "min_le" = min(country_name[,5]), "max_le" = max(country_name[,5]))
  plot(country_name$year,country_name$lifeExp, xlab="Year", ylab="Life Expectancy", main=countr)
  print(out)
}
