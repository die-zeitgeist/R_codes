#Bazı karşılaştırmalar yapılamadığında yani eksik veri olduğunda thurstone yerine bradley-terry yapılabilir. 

library(BradleyTerry2)

dat_bt <- transform(raw,
                    method1 = winner,
                    method2 = loser,
                    win1 = 1,
                    win2 = 0
)

lev <- sort(unique(c(dat_bt$method1, dat_bt$method2)))
dat_bt$method1 <- factor(dat_bt$method1, levels = lev)
dat_bt$method2 <- factor(dat_bt$method2, levels = lev)

bt <- BTm(
  outcome = cbind(win1, win2),
  player1 = method1,
  player2 = method2,
  formula = ~ method,
  id = "method",
  data = dat_bt,
  family = binomial("logit")
)

summary(bt)
coef(bt)   # tahmini yetenekler (referanslı)




# gözlenen ikililer
obs_pairs <- sort(apply(raw, 1, function(r) paste(sort(r), collapse="-")))
table(obs_pairs)

# tüm olası ikililer (tam veri olsaydı 8 choose 2 = 28 ikili olurdu)
all_pairs <- combn(items, 2, FUN=function(x) paste(x, collapse="-"))

setdiff(all_pairs, names(table(obs_pairs)))  # hiç karşılaşılmamış ikililer
