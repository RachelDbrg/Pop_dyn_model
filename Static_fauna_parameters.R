# ------ Initial conditions and parameters for animals -----


# Prey biomass
w_Ma = 400
w_Mj = 0.08 * w_Ma
w_Na = 100
w_Nj = 0.08 * w_Na
w_Ca = 70
w_Cj = 0.08 * w_Ca
w_Qa = 15
w_Qj = 0.08 * w_Qa

# Caribou
n_croiss = 0.25  # Growth


# FEEDING
a_N = 0.05      # Prospection/Feeding area

h_VN  = 8.81e-4 # Handling time #year/kg



# https://cdnsciencepub.com/doi/10.1139/z92-243 
# 160 jours soit ~ 5.2 mois, on peut considérer 6 mois
# tau_n = 2 # Inverse of the time an individual is juvenile
# tau_n = 1/6
tau_n = 1/16

# mu_N = 5.7467e+06 # NRJ required for maintenance
mu_N = 70*w_Na^0.75*365*1.7*4.184


e_VN = 11.8e3 # NRJ intake

# Conversation rate of NRJ --> juveniles
#chi_N = n_croiss * ((a_N * e_VN * kVnorm)
#                    /(1+a_N * h_VN * kVnorm) - mu_N)^-1


# ---- MOOSE ---- 
coef = 1

# 
# ma_init = 0.166
# ma_init <- ma_init
#ma_init = 0

#mj_init = ma_init*0.1


m_croiss = 0.25

# Pour estimer le hUM
# hum = an/kg
# kJ/an * (kj/kg)^-1
# mu_m * (e_UM)^-1
# kg/an 
#h_UM = (763.5625)^-1
# h_UM = (678.7222)^-1
h_UM = 0.000034 #an/kg


a_M = 0.05
# a_M = 50


# h_UM  = 1.0959e-03*0.33
# h_UM  = 1.0959e-03 
# h_UM  = 8.81e-04
# k_m = (2-0.84)*PP + 0.84

# k_m = ((2-0.84)*PP + 0.84) * coef

# tau_m = 2 #(12/6)
tau_m = 1/16


# Moose sexual maturity: unlikely before 16 months
# https://www.esf.edu/aec/adks/mammals/moose.php

# Calves begin to browse at 3 weeks of age, and are weaned at 5 months.
# Commencent à manger U vers 5 mois

# Nbe de jeunes
# Cows give birth to a single calf, occasionally twins, 
# and rarely triplets in May or June after a gestation period of 240-246 days.
# The number of calves is a function of the cow's state of nutrition and age. 

# tau_m = 0.002 # inverse du temps où les orignaux restent
#juveniles (estime a 6 mois)

# tau_m = 2000 # inverse du temps où les orignaux restent

# mu_M = 1.5272e+07
mu_M = 70*w_Ma^0.75*365*1.7*4.184
# mu_M = 1.2217*10^7

# mu_M = 1.2217*10^4

# mu_M = 1.5272e+05

# e_UM = 1.8410e+04
# e_UM = 1.18e+05
# e_UM = 1.6 * 10^4

# Choix arbitraite pour ne pas avoir MA_supp_NRJ nul
# e_UM = 1.8 * 10^4
# Following https://www-jstor-org.acces.bibl.ulaval.ca/stable/3808644?seq=2


e_UM = 20083

# e_UM = 1.18e+06

# e_UM = mu_M * (912.5)^-1
# chi_M = m_croiss * ((a_M * e_UM * kUpeak)/
#                       (1+a_M * h_UM * kUpeak) - mu_M)^-1

# k_m = 2 #Voir Turchin2003, pdf 372

# ---- DEER ---- 
# ca_init = 2
# ca_init = 2.1 * 10 
# ca_init = 0.166
# ca_init = 10
# ca_init = 0.000000004
# 

# ca_init = 0
# ca_init = 0.05
# ca_init = 0.05
# ca_init = 5
# 
# ca_init = 2.1
#ca_init = 0
# ca_init = 0.166
# ca_init = ma_init



#cj_init = ca_init*0.1

# ca_init = 20
# cj_init = ca_init*0.1

# h_UC = 4.1873e-03
#h_UC = 1.0959e-03
# h_UC = 4.1873e-03 * 0.33

# Pour estimer le hUC
# hum = kg/an
# kJ/an * (kj/kg)^-1
#mu_C * (e_UC)^-1
# kg/an 
# h_UC = (274.7937)^-1
h_UC = 0.000100274

#
#mu_M * (e_UC)^-1

a_C = 0.05
# e_UC = 1.8410e+04
# e_UC = 1.6 * 10^4
# Choix arbitraite pour ne pas avoir CA_supp_NRJ nul
e_UC = 20083

# mu_C =  4.3967e+06
mu_C =  70*w_Ca^0.75*365*1.7*4.184


c_croiss = 0.25
# chi_C = c_croiss * 
#   ((a_C*e_UC*kUpeak)/(1+a_C*h_UC*kUpeak)- mu_C)^-1
# k_c= (11.43-4.74)*PP +4.74
# k_c= ((11.43-4.74)*PP +4.74) * coef
# tau_c = 2

# tau_c = 8 (12/1.5)

#(voir notes "deer/reproduction")
# Les cerfs de Virginie peuvent atteindre la maturité sexuelle dès 6 ou 7 mois.
tau_c = 1/6

# tau_m = tau_c
# mu_M = mu_C
# ===========================
# # Factice additional prey Q
# 
# 
# #qa_init = 0
# # qa_init = 2.1
# #qj_init = qa_init*0.1
# 
# h_UQ = 1.0959e-03
# 
# a_Q = 0.05
# 
# e_UQ = 1.6 * 10^4
# 
# mu_Q =  4.3967e+06
# q_croiss = 0.25
# # chi_C = c_croiss * 
# #   ((a_C*e_UC*kUpeak)/(1+a_C*h_UC*kUpeak)- mu_C)^-1
# # k_c= (11.43-4.74)*PP +4.74
# # k_c= ((11.43-4.74)*PP +4.74) * coef
# # tau_c = 2
# 
# # tau_c = 8 (12/1.5)
# 
# #(voir notes "deer/reproduction")
# # Les cerfs de Virginie peuvent atteindre la maturité sexuelle dès 6 ou 7 mois.
# tau_q = 1/6


# ==============================================================================
# BEAVER 


h_UQ = 3.29*10^-3

a_Q = 0.417

e_UQ = 1.72 * 10^4

mu_Q =  1.85*10^6

q_croiss = 0.25

tau_q = 1/5
# chi_C = c_croiss * 
#   ((a_C*e_UC*kUpeak)/(1+a_C*h_UC*kUpeak)- mu_C)^-1
# k_c= (11.43-4.74)*PP +4.74
# k_c= ((11.43-4.74)*PP +4.74) * coef
# tau_c = 2

# tau_c = 8 (12/1.5)

#(voir notes "deer/reproduction")
# Les cerfs de Virginie peuvent atteindre la maturité sexuelle dès 6 ou 7 mois.
# ==============================================================================


# ---- WOLF ----

# See for parameters https://www.wrrb.ca/sites/default/files/Fuller%202003.pdf

# p_init = 0.0031
# p_init = 0.004
# p_init = 0.008442148
# p_init = 0.010974793
# p_init = 0.005909504
# p_init = 0.016884297
# p_init = 0.086884297

# Actively begin hunting. 1 year.
# 22 months: Sexual maturity
# Wolf are considered juveniles for 6 moths
# tau_P = 2
# tau_p = 1/22
tau_p = 1/24

# p_init = 0.086884297*5

# p_init = 0.008442148
# p_init = 0.005


#pa_init = 0
# pa_init = 0.005
#pj_init = pa_init * 0.1

p_init = 5
# p_init = 0.004
# p_init = 0.01
# p_init = 0.05


# p_init = 0.0031 * 0.5



# p_init = 0
a_P = 65.116 #km2/an

# Conditionnal value of wolf prospecting area, 
# # depending on the zone
# if (ca_init == 0) { #Eastern condition
#   a_P <- 65.116
# } else { #Western condition
#   a_P <- 97.674
# }

# Serrouya2020:
# Min displacement = 8 km/day
# Max = 11 km/day

P <- 0

# a_P = 30
# a_P = 130

p_croiss = 0.36/2
# mu_P = 2.0683

mu_P = 3.88

# k_P = 0.05


# Conversion rates based on weight
epsi_MN = w_Na / w_Ma
epsi_Maj = w_Mj/w_Ma
epsi_Naj = w_Nj/w_Na
epsi_WC = 0.934
epsi_MC = w_Ca / w_Ma
epsi_Caj = w_Cj/w_Ca
epsi_CM = w_Ma / w_Ca
epsi_MQ = w_Qa / w_Ma
epsi_Qaj = w_Qj/w_Qa

# Conversion rates based on intake rate
alpha_MC = 0.29
alpha_CM = 3.4


# Handling times of preys 
h_P_Ma = 0.105
h_P_Mj = h_P_Ma * epsi_Maj
h_P_Na = h_P_Ma * epsi_MN
h_P_Nj = h_P_Na * epsi_Naj
h_P_Ca = h_P_Ma * epsi_MC
h_P_Cj = h_P_Ma * epsi_Caj
h_P_Qa = 4.515*10^-3
h_P_Qj = h_P_Qa * epsi_Qaj


# Create a parameters vector, that stocks all the fixed 
# values of the model
parms <- c(v_croiss,a_P,w_Ma,w_Mj,w_Na,w_Nj,w_Cj,w_Ca,
           h_P_Ma, h_P_Mj, h_P_Na, h_P_Nj,h_P_Cj,h_P_Ca,
           epsi_Maj, epsi_MN, epsi_Naj, epsi_Caj,epsi_MC,
           mu_P, p_croiss, tau_p)


# Stock all the initials values of parameters of 
# animals in a vector
# initial_conditions_animals <- c(na_init, nj_init,
#                                 ma_init, mj_init, pa_init, pj_init,
#                                 ca_init, cj_init, qa_init, qj_init)

# initial_conditions_animals <- c(na_init, nj_init,
#                                 ma_init, mj_init, pa_init, pj_init,
#                                 ca_init, cj_init)

# Concatenate both vegetation and animals initials values
# y0 <- c(initial_conditions_vegetation
#         ,initial_conditions_animals)
# 
# y0_test <- c(initial_conditions_vegetation)

# parametres_ax <- as.data.frame(do.call(rbind,list(initial_conditions_animals)))
# 
# return()
# }