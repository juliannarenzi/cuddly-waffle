# function to convert fah to Kelvin

fah_to_kelvin <- function(temp) {
  kelvin <- ((temp-32) * (5/9)) + 273.15
  return(kelvin)
}

fah_to_kelvin(temp=32)
fah_to_kelvin(32)

# function to convert Kelvin to Celsius

kel_to_cel <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

kel_to_cel(0)

# function to convert fah to cel

fah_to_celsius2 <- function(temp) {
  celsius <- kel_to_cel(fah_to_kelvin(temp))
  return(celsius)
}
