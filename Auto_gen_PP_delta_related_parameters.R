# Function to calculate the parameters based on PP
# Coming from the "Parametres_vegetation" original script

generate_parameter_dataframe <- function() {
  
  # Create the scenarios dataset
  scenarios <- expand.grid(
    PP = seq(0, 1, 0.1),
    # PP = seq(0, 1, 1),
    # PP = 1,
    # TODO: get rid of delta
    delta = 1)
  
  
  
  calculate_parameters <- function(PP, delta) {
    
    ### Vegetation
    ## Deciduous
    # Deciduous growth rate 
    u_croiss <-  (1+4*PP)*30000 
    
    # Max deciduous carrying capacity 
    kUpeak  <-  (1 + PP/2)*kUpeak_0
    
    # Stable deciduous carrying capacity
    kUstable <- (1+(PP/2))* kUstable_0 * 2.4
    
    
    # Stable lichen carrying capacity
    kVnorm = -771778*PP + 964000
    
    
    kVlow = 0.2*kVnorm     
    # kg/km², valeur pour laquelle on atteint 50# de perte
    # de biomasse du lichen
    
    
    # ------------------------------------------------------
    
    ### Animals
    
    # Conversion rate of energy into newborns
    # Deer
    #0.25*(0.05*e_UC*240000/(1+0.05*h_UC*240000) - mu_C)^-1
    chi_C = 2.669839e-09
    
    # Moose
    chi_M = chi_C * epsi_MC 
    
    # Caribou
    chi_N = 2.669839e-09 * 0.7
    
    
    
    ## Carrying capacities
    # With competition
    k_m = 0.5953*PP+ 0.0047
    epsi_CM = w_Ma / w_Ca
    
    alpha_CM = 3.4
    alpha_CQ = 0.33
    # k_c = k_m * epsi_CM #pour convertir la qte d'orignaux supportable par le 
    # milieu en quantité de cerfs supportables
    # ie si le milieu peut supporter 1 orignal, il peut supporter 1 * epsi_CM cerfs
    
    k_c = k_m * alpha_CM
    
    alpha_MQ = 0.0917
    alpha_QM = 10.29
    
    k_q = k_m * alpha_QM
    
    chi_Q = 7.4158 * 10^-8
    
    k_n = 9E-08*kVnorm - 0.0093
    
    
    # ------------------------------------------------------
    # TODO: Voir si on garde ca
    # Eventually, to include perturbations of the vegetation
    
    t_perturb = 2000           # years
    # t_perturb = 10
    
    # Definition des moments suivant la perturbation
    t_low = t_perturb + 5           # years : temps pour atteindre le minimum de
    # biomasse apres une perturbation
    t_kpeak = t_low + (50 - 25*PP) # years :  temps pour atteindre le maximum de
    # biomasse apres une perturbation
    t_kstable = t_kpeak + 100      # years : temps pour atteindre une stabilité de
    
    kUcoeff1 = (kUstable - kUpeak)/(t_kstable - t_kpeak)
    kUcoeff2 = kUpeak - (kUstable - kUpeak)/(t_kstable - t_kpeak) * t_kpeak
    
    
    return(data.frame(PP, delta, u_croiss, kUpeak, kUstable,
                      chi_M, chi_C, t_low, t_kpeak,t_kstable,
                      kUcoeff1, kUcoeff2, t_perturb,
                      kVnorm, kVlow, chi_N, k_m, k_c, chi_Q, k_q, k_n))
    
  }
  
  
  # Apply the custom function to all combinations of "PP" and "delta"
  df_parameter_values <- do.call(rbind, apply(scenarios, 1, function(row) calculate_parameters(row["PP"], row["delta"])))
  
  
  # Rename the columns if needed
  colnames(df_parameter_values) <- c("PP", "delta", "u_croiss", "kUpeak",
                                     "kUstable",  "chi_M", "chi_C",
                                     "t_low", "t_kpeak","t_kstable",
                                     "kUcoeff1", "kUcoeff2",  "t_perturb",
                                     "kVnorm", "kVlow", "chi_N", "k_m", "k_c", "chi_Q", "k_q", "k_n")
  
  
  return(df_parameter_values)
  
}


