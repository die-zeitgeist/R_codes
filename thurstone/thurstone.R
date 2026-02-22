library(psych)
# Thurstone Case V ölçekleme (psych::thurstone)
tv <- thurstone(P, ranks = FALSE, digits = 6)
tv



#Thurstonian scale (case 5) scale values 
#Call: thurstone(x = P, ranks = FALSE, digits = 6)
#   Nicel    Nitel    Karma 
#0.383216 0.000000 0.255451 
# Goodness of fit of model   1
#burada 0'a yakın değerin en güçlü diğerlerinin giderek daha düşük olduğunu unutmamak gerekir. 
