# ECO-3IO-SFC MODEL (BASED ON MODEL PC + 3-INDUSTRY IO TABLES 
#                                      + ECOSYSTEM 
#                                      + LABOUR MARKET
#                                      + DIFFERENT WAGE RATES
#                                      + DIFFERENT PROFIT RATES
#                                      + CE EXPERIMENTS
#                                      + CONSUMPTION PROPENSITY ALSO DEPENDS ON S.E.S.
#                                      + DAMAGES AND MITIGATION COSTS
# Created by Marco Veronese Passarella
# Last revision: 9 December 2025

# PREPARE THE ENVIRONMENT ####

# Clear Environment
rm(list=ls(all=TRUE))

# Clear Plots
if(!is.null(dev.list())) dev.off()

# Clear Console
cat("\014")

# Set directory/folder
#setwd("C:/Users/...")

# set number of periods
nPeriods = 100

# Set number of scenarios
nScenarios = 4 

# Set number of industries
nIndustries = 3

# Define max. number of iterations
nIterations <- 200

# SET THE COEFFICIENTS (EXOGENOUS VARIABLES AND PARAMETERS) ####
alpha10 <- 0.9436 #Autonomous component of propensity to consume out of income
alpha11 <- 8 #Interest rate elasticity of propensity to consume out of income (minus sign)
alpha12 <- 0.10 #Elasticity of propensity to consume out of income to increase in temperature (minus sign)
alpha13 <- 0.001 #Elasticity of propensity to consume out of income to increase in capital stock (minus sign)
alpha2 <- 0.4 #Propensity to consume out of wealth
w1 <- 1.8 #Wage rate in industry 1
w2 <- 2.7 #Wage rate in industry 2
w3 <- 1 #Wage rate in industry 3
gamma1 <- 0.875 #Profit rate in industry 1
gamma2 <- 0.875 #Profit rate in industry 2
gamma3 <- 0.875 #Profit rate in industry 3
pr1 <- 3.5 #Labour productivity in industry 1
pr2 <- 5 #Labour productivity in industry 2
pr3 <- 2.2 #Labour productivity in industry 3
lambda0 <- 0.635 #Autonomous share of bills
lambda1 <- 5 #Elasticity of bills demand to interest rate
lambda2 <- 0.01 #Elasticity of bills demand to yd/v
theta <- 0.2 #Tax rate on income
r_bar <- matrix(data=0.025,nrow=nScenarios,ncol=nPeriods) #Interest rate as policy instrument
beta1_c_bar <- 0.15 #Household consumption share of product 1
beta2_c_bar <- 0.35 #Household consumption share of product 2
beta3_c_bar <- 0.50 #Household consumption share of product 3
beta1_g_bar <- 0.10 #Government consumption share of product 1
beta2_g_bar <- 0.30 #Government consumption share of product 2
beta3_g_bar <- 0.60 #Government consumption share of product 3
zeta1_dc_bar <- 0.025 #Percentage of discarded socio-economic stock of product 1
zeta2_dc_bar <- 0.035 #Percentage of discarded socio-economic stock of product 2
zeta3_dc_bar <- 0.020 #Percentage of discarded socio-economic stock of product 3
xi1_dc_bar <- 0.05 #Share of goods 1 that are durable 
xi2_dc_bar <- 0.50 #Share of goods 2 that are durable
xi3_dc_bar <- 0.01 #Share of goods 3 that are durable
a11_0 <- 0.11 #Initial value of coefficient a11
a12_0 <- 0.12 #Initial value of coefficient a12
a13_0 <- 0.10 #Initial value of coefficient a13
a21_0 <- 0.21 #Initial value of coefficient a21
a22_0 <- 0.22 #Initial value of coefficient a22
a23_0 <- 0.20 #Initial value of coefficient a23
a31_0 <- 0.15 #Initial value of coefficient a31
a32_0 <- 0.18 #Initial value of coefficient a32
a33_0 <- 0.10 #Initial value of coefficient a33

# CREATE VARIABLES AND ATTRIBUTE INITIAL VALUES ####

# Use 'array' function to create 3-dimension variables
x <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Gross output by industry (real)
d <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Demand by industry (real)
p <- array(data=1,dim=c(nScenarios,nPeriods,nIndustries)) #Unit prices
pr <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Labour productivity coefficients
w <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Wage rates
gamma <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Profit rates
n <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Employment levels
wb <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Wage bills
va <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Value added values
pf <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Capital incomes

# Create matrix of coefficients
A <- matrix(data=0,nrow=nIndustries,ncol=nIndustries) #2D matrix of technical coefficients
a11 <- matrix(data=a11_0,nrow=nScenarios,ncol=nPeriods) #Quantity of product 1 necessary to produce one unit of product 1
a12 <- matrix(data=a12_0,nrow=nScenarios,ncol=nPeriods) #Quantity of product 1 necessary to produce one unit of product 2
a13 <- matrix(data=a13_0,nrow=nScenarios,ncol=nPeriods) #Quantity of product 1 necessary to produce one unit of product 3
a21 <- matrix(data=a21_0,nrow=nScenarios,ncol=nPeriods) #Quantity of product 2 necessary to produce one unit of product 1
a22 <- matrix(data=a22_0,nrow=nScenarios,ncol=nPeriods) #Quantity of product 2 necessary to produce one unit of product 2
a23 <- matrix(data=a23_0,nrow=nScenarios,ncol=nPeriods) #Quantity of product 2 necessary to produce one unit of product 3
a31 <- matrix(data=a31_0,nrow=nScenarios,ncol=nPeriods) #Quantity of product 3 necessary to produce one unit of product 1
a32 <- matrix(data=a32_0,nrow=nScenarios,ncol=nPeriods) #Quantity of product 3 necessary to produce one unit of product 2
a33 <- matrix(data=a33_0,nrow=nScenarios,ncol=nPeriods) #Quantity of product 3 necessary to produce one unit of product 3
I <- diag(x=1, nrow=nIndustries, ncol=nIndustries) #2D diagonal matrix
A4 <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries,nIndustries)) #4D matrix of technical coefficients

# Other 2-dimension variables
alpha1 <- matrix(data=alpha10-alpha11*r_bar,nrow=nScenarios,ncol=nPeriods) #Propensity to consume out of income
b_cb <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Government bills held by Central Bank
b_h <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Government bills held by households
b_s <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Government bills supplied by government
h_h <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Cash money held by households
h_s <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Cash money supplied by central bank
r <- matrix(data=r_bar,nrow=nScenarios,ncol=nPeriods) #Interest rate on government bills
t <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Taxes
v <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Households net financial wealth
v_r <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Financial wealth in real terms
yd <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Disposable income of households
cons <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Consumption (real)
g <- matrix(data=20,nrow=nScenarios,ncol=nPeriods) #Government expenditure (real)
y <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #National income
y_r <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #National income in real terms
p_c <- matrix(data=1,nrow=nScenarios,ncol=nPeriods) #Average price for the consumers
p_g <- matrix(data=1,nrow=nScenarios,ncol=nPeriods) #Average price for the government
infl <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Inflation tax (see Godley and Lavoie, 9.2.4 and 9.3.1)
DC <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Monetary value of stock of durable goods by industry/product
ws <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Wage share

# Ecosystem variables and coefficients ####

# Variables
x_mat <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Production of material goods 
mat <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Extracted matter  
rec <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Recycled socio-economic stock  
dis <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Discarded socioeconomic stock            
kh <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Socio-economic stock       
en <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Total energy required for production
ren <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Renewable energy
nen <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Non-renewable energy                         
co2_cum <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Cumulative emissions
wa <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Waste by industry
temp <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Atmospheric temperature 
k_m <- matrix(data=6000,nrow=nScenarios,ncol=nPeriods) #Matter reserves
conv_m <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Conversion of matter resources into reserves
res_m <- matrix(data=388889,nrow=nScenarios,ncol=nPeriods) #Matter resources
k_e <- matrix(data=37000,nrow=nScenarios,ncol=nPeriods) #Energy reserves
conv_e <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Conversion of energy resources into reserves
res_e <- matrix(data=542000,nrow=nScenarios,ncol=nPeriods) #Energy resources
emis <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Annual emissions by industry
cen <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Carbon mass of energy
o2 <- matrix(data=emis-cen,nrow=nScenarios,ncol=nPeriods) #Mass of oxygen 
dep_m <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Depletion rate of material reserves
dep_e <- matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Depletion rate of energy reserves
emis_by_ind <- array(data=1,dim=c(nScenarios,nPeriods,nIndustries)) #Annual emissions by industry
dc <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Stock of durable goods by industry/product

# Coefficients
mu1_mat <- 0.4 #Initial value of mu_mat_1
mu2_mat <- 0.7 #Initial value of mu_mat_2
mu3_mat <- 0.3 #Initial value of mu_mat_3
eps1_en <- 8 #Initial value of eps_en_1                                          
eps2_en <- 6 #Initial value of eps_en_2 
eps3_en <- 3 #Initial value of eps_en_3 
beta0_e <- 0.07 #Initial value of beta_e
eta1_en <- 0.12 #Initial value of eta_en_1                                          
eta2_en <- 0.15 #Initial value of eta_en_2 
eta3_en <- 0.18 #Initial value of eta_en_3 
g0_beta_e <- 0.002 #Initial value of g_beta_e
tcre <- 1.65/1000 #Transient climate response to cumulative carbon emissions
fnc <- 0.34 #Non-CO2 fraction of total anthropocentric forcing
sigma_m <- 0.0005 #Conversion rate of matter resources into reserves
car <- 3.67 #Coefficient converting Gt of carbon into Gt of CO2
sigma_e <- 0.003 #Conversion rate of energy resources into reserves
beta_e <- matrix(data=beta0_e,nrow=nScenarios,ncol=nPeriods) #CO2 intensity of non-renewable energy sources
g_beta_e <- matrix(data=g0_beta_e,nrow=nScenarios,ncol=nPeriods) #Declining rate of beta_e
rho_dis <- matrix(data=0.2,nrow=nScenarios,ncol=nPeriods) #Recycling rate
mu_mat <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Material intensity coefficients by industry
eps_en <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Energy intensity coefficients by industry                                          
eta_en <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Shares of renewable energy in total energy by industry       
beta_c <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Real consumption composition
beta_g <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Real government expenditure composition
zeta_dc <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Percentages of discarded socio-economic stock by industry
xi_dc <- array(data=0,dim=c(nScenarios,nPeriods,nIndustries)) #Share of durable goods to total consumption goods

# ADDITIONAL VARIABLES AND COEFFICIENTS FOR ROMA3 LECTURE
Cmit= matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Mitigation costs
df = matrix(data=0,nrow=nScenarios,ncol=nPeriods) #Damage function
mu_e = 0.6 #Abatement rate 
psi <- 0.242 #Cost for mitigation (if '+' then = taxes; if '-' then = subsidies)
beta <- 2.9 #Convexity parameter (increasing marginal cost of abatement)
thetad1 <- 0 #Linear coefficient in damage function
thetad2 <- 0.000236 #Quadratic coefficient in damage function

# ATTRIBUTE INITIAL VALUES TO PARAMETERS THAT WILL BE SHOCKED
zeta_dc[,,1]=zeta1_dc_bar
zeta_dc[,,2]=zeta2_dc_bar
zeta_dc[,,3]=zeta3_dc_bar  
xi_dc[,,1]=xi1_dc_bar
xi_dc[,,2]=xi2_dc_bar
xi_dc[,,3]=xi3_dc_bar  
beta_c[,,1]=beta1_c_bar
beta_c[,,2]=beta2_c_bar
beta_c[,,3]=beta3_c_bar
gamma[,,1]=gamma1
gamma[,,2]=gamma2
gamma[,,3]=gamma3
pr[,,1]=pr1
pr[,,2]=pr2
pr[,,3]=pr3
w[,,1]=w1
w[,,2]=w2
w[,,3]=w3
mu_mat[,,1]=mu1_mat
mu_mat[,,2]=mu2_mat
mu_mat[,,3]=mu3_mat  
eps_en[,,1]=eps1_en
eps_en[,,2]=eps2_en
eps_en[,,3]=eps3_en  
eta_en[,,1]=eta1_en
eta_en[,,2]=eta2_en
eta_en[,,3]=eta3_en  

# Add a convergence tolerance and a vector to record iterations
tol <- 1e-6 # Convergence tolerance
iter_used <- array(0, dim=c(nScenarios, nPeriods)) # Record iterations used per scenario and period

# Create a progress bar ####
pb <- progress_bar$new( total = nScenarios * nPeriods,
                        format = "Progress [:bar] :percent ETA: :eta")

# RUN THE MODEL ####

# DEFINE THE LOOPS

# Choose scenario
for (j in 1:nScenarios){
  
  # Define time loop
  for (i in 2:nPeriods){
    
    # Update the progress bar ####
    pb$tick()
    
    # Initial guess for y (from previous period)
    y_old <- y[j,i-1]
    
    # Define iterations
    for (iterations in 1:nIterations){
      
      # Add alternative scenarios as CE-driven exogenous shocks
      
      # Scenario 2: PLE
      if (i>=50 && j==2){
          
        beta_c[j,i,] = c(beta1_c_bar - 0.01,
                         beta2_c_bar - 0.01,
                         beta3_c_bar + 0.02) # Higher consumption of services, less of other
          
        zeta_dc[j,i,] = c(zeta1_dc_bar - 0.01,
                          zeta2_dc_bar - 0.01,
                          zeta3_dc_bar - 0.01) # Lower discarding rates
          
        xi_dc[j,i,] = c(xi1_dc_bar + 0.01,
                        xi2_dc_bar + 0.15,
                        xi3_dc_bar + 0.00) # Higher duration (i.e. share of durable goods)
          
        rho_dis[j,i] = 0.2 + 0.02 # Higher reparation (via small increase in recycling)
          
        gamma[j,i,] = c(gamma1 + 0.00,
                        gamma2 + 0.00,
                        gamma3 + 0.025) #Higher price of services (via profit rate)
        }
      
      # Scenario 3: CSC
      if (i>=50 && j==3){
        
        a11[j,i] = a11_0 * 0.999
        a12[j,i] = a12_0 * 0.980
        a13[j,i] = a13_0 * 0.999
        a21[j,i] = a21_0 * 0.999
        a22[j,i] = a22_0 * 0.980
        a23[j,i] = a23_0 * 0.999
        a31[j,i] = a31_0 * 0.999
        a32[j,i] = a32_0 * 0.980
        a33[j,i] = a33_0 * 0.999 # Lower technical coefficients (mainly in manufacturing)
        
        rho_dis[j,i] = 0.2 + 0.04 # Lower extraction (via a moderate increase in recycling)
        }
      
      # Scenario 4: RE + RWM
      if (i>=50 && j==4){
        
        mu_mat[j,i,] <- c(mu1_mat*0.9,
                          mu2_mat*0.9,
                          mu3_mat*0.9) # Lower material intensity coefficients
        
        eps_en[j,i,] <- c(eps1_en*0.9,
                          eps2_en*0.9,
                          eps3_en*0.9) # Lower energy intensity coefficients                                           
        
        eta_en[j,i,] <- c(eta1_en*1.1,
                          eta2_en*1.1,
                          eta3_en*1.1) # Higher shares of renewable energy sources       
        
        g_beta_e[j,i] <-  g0_beta_e*2 # Higher declining rate of CO2 intensity of non-renewable energy sources
        
        rho_dis[j,i] = 0.2 + 0.06 # Lower waste (via a strong increase in recycling)
        
        gamma[j,i,] = c(gamma1 + 0.00,
                        gamma2 + 0.025,
                        gamma3 + 0.00) #Higher price of manufacturing (via profit rate)
        }
      
      # A) Technical & labour coefficients and labour market calculations ####
      
      # 4D matrix of technical coefficients
      A4[j,i,,]=matrix(c(a11[j,i],a12[j,i],a13[j,i],
                         a21[j,i],a22[j,i],a23[j,i],
                         a31[j,i],a32[j,i],a33[j,i]), nrow=3, byrow=TRUE)                  
      
      # 2D matrix of technical coefficients
      A = A4[j,i,,]          
      
      # Employment levels by industry
      n[j,i,]=x[j,i,]/pr[j,i,]
      
      # Wage bills by industry
      wb[j,i,] = w[j,i,] * n[j,i,]
      
      # Value added by industry
      va[j,i,1] = x[j,i,1]*p[j,i,1]-(x[j,i,1]*a11[j,i]*p[j,i,1]
                                   +x[j,i,1]*a21[j,i]*p[j,i,2]
                                   +x[j,i,1]*a31[j,i]*p[j,i,3])
      
      va[j,i,2] = x[j,i,2]*p[j,i,2]-(x[j,i,2]*a12[j,i]*p[j,i,1]
                                    +x[j,i,2]*a22[j,i]*p[j,i,2]
                                    +x[j,i,2]*a32[j,i]*p[j,i,3])
        
      va[j,i,3] = x[j,i,3]*p[j,i,3]-(x[j,i,3]*a13[j,i]*p[j,i,1]
                                    +x[j,i,3]*a23[j,i]*p[j,i,2]
                                    +x[j,i,3]*a33[j,i]*p[j,i,3])
      
      # Capital incomes by industry
      pf[j,i,1] = gamma[j,i,1]*x[j,i,1]*(a11[j,i]*p[j,i,1]+
                                         a21[j,i]*p[j,i,2]+
                                         a31[j,i]*p[j,i,3])
      
      pf[j,i,2] = gamma[j,i,2]*x[j,i,2]*(a12[j,i]*p[j,i,1]+
                                         a22[j,i]*p[j,i,2]+
                                         a32[j,i]*p[j,i,3])
      
      pf[j,i,3] = gamma[j,i,3]*x[j,i,3]*(a13[j,i]*p[j,i,1]+
                                         a23[j,i]*p[j,i,2]+
                                         a33[j,i]*p[j,i,3])
      
      # B) Define government spending shares ####
      beta_g[j,i,1]=beta1_g_bar
      beta_g[j,i,2]=beta2_g_bar
      beta_g[j,i,3]=beta3_g_bar
      
      # C) Input-output structure ####
      
      # Real final demand vector by industry - eq. 14
      d[j,i,] = beta_c[j,i,]*cons[j,i] + beta_g[j,i,]*g[j,i]
      
      # Real gross output by industry  - eq. 15
      x[j,i,] = solve(I-A) %*% d[j,i,]
      
      # Value of net output (GDP)  - eq. 1.A
      y[j,i] = t(p[j,i,]) %*% d[j,i,]
      
      
      # D) Price setting ####
      
      # Set unit prices for each industry - eq. 17
      p[j,i,1] = (w[j,i,1]/pr[j,i,1]) + (p[j,i,1]*A[1,1] + p[j,i,2]*A[2,1] + p[j,i,3]*A[3,1])*(1 + gamma[j,i,1])*(1+df[j,i]) 
      p[j,i,2] = (w[j,i,2]/pr[j,i,2]) + (p[j,i,1]*A[1,2] + p[j,i,2]*A[2,2] + p[j,i,3]*A[3,2])*(1 + gamma[j,i,2])*(1+df[j,i]) 
      p[j,i,3] = (w[j,i,3]/pr[j,i,3]) + (p[j,i,1]*A[1,3] + p[j,i,2]*A[2,3] + p[j,i,3]*A[3,3])*(1 + gamma[j,i,3])*(1+df[j,i]) 
      
      # Average price for the consumers - eq. 18
      p_c[j,i] = t(p[j,i,]) %*% beta_c[j,i,]
      
      # Average price for the government - eq. 19
      p_g[j,i] = t(p[j,i,]) %*% beta_g[j,i,]
      
      
      # E) Households' behaviour ####
      
      # Disposable income - eq. 2
      yd[j,i] = y[j,i] - t[j,i] + r[j,i-1]*b_h[j,i-1] - Cmit[j,i]
      
      # Wealth accumulation - eq. 4 
      v[j,i] = v[j,i-1] + (yd[j,i] - p_c[j,i]*cons[j,i])
      
      # Real consumption function with no monetary illusion - eq. 5.A.1 
      cons[j,i] = alpha1[j,i]*((yd[j,i]/p_c[j,i])-infl[j,i]) + alpha2*v[j,i-1]/p_c[j,i]
      
      # Inflation tax for households - eq. 5.A.1
      infl[j,i] = ((p_c[j,i]-p_c[j,i-1])/p_c[j,i-1])*(v[j,i-1]/p_c[j,i])
      
      
      # F) Portfolio equations ####
      
      # Demand for cash money - eq. 6
      h_h[j,i] = v[j,i] - b_h[j,i]
      
      # Demand for government bills - eq. 7
      b_h[j,i] = v[j,i]*(lambda0 + lambda1*r[j,i] - lambda2*(yd[j,i]/v[j,i]))
      
      
      # G) Government ####
      
      # Tax payments - eq. 3 
      t[j,i] = theta*(y[j,i] + r[j,i-1]*b_h[j,i-1])
      
      # Supply of government bills - eq. 8
      b_s[j,i] = b_s[j,i-1] + ( p_g[j,i]*g[j,i] + r[j,i-1]*b_s[j,i-1]) - (t[j,i] + r[j,i-1]*b_cb[j,i-1]) - Cmit[j,i]
      
      
      # H) Central bank ####
      
      # Supply of cash - eq. 9
      h_s[j,i] = h_s[j,i-1] + b_cb[j,i] - b_cb[j,i-1]
      
      # Government bills held by the central bank - eq. 10
      b_cb[j,i] = b_s[j,i] - b_h[j,i]
      
      # Interest rate as policy instrument - eq. 11
      r[j,i] = r_bar[j,i]
      
      
      # I) Ecosystem ####
      
      # Extraction of matter and waste ####
      
      # Production of material goods 
      x_mat[j,i] = t(mu_mat[j,i,]) %*% x[j,i,]
      
      # Extraction of matter                                       
      mat[j,i] = x_mat[j,i] - rec[j,i]                                             
      
      # Recycled matter (of socioeconomic stock + industrial waste)
      rec[j,i] = rho_dis[j,i]*dis[j,i]         
      
      # Discarded socioeconomic stock            
      dis[j,i] = t(mu_mat[j,i,]) %*% (zeta_dc[j,i,] * dc[j,i-1,])
      
      # Stock of durable consumption goods                 
      dc[j,i,] = dc[j,i-1,] + xi_dc[j,i,] * beta_c[j,i,]*cons[j,i] - zeta_dc[j,i,] * dc[j,i-1,]    
      
      # Monetary value of stock of durable consumption goods                 
      DC[j,i] = t(p[j,i,]) %*% dc[j,i,]    
      
      # Socioeconomic stock
      kh[j,i] = kh[j,i-1] + x_mat[j,i] - dis[j,i]       
      
      # Wasted socio-economic stock
      wa[j,i] = mat[j,i] - (kh[j,i]-kh[j,i-1])                                                                     
      
      
      # Use of energy, emissions and temperature ####
      
      # Energy required for production
      en[j,i] = t(eps_en[j,i,]) %*% x[j,i,]                                          
      
      # Renewable energy at the end of the period
      ren[j,i] = t(eps_en[j,i,]) %*% (eta_en[j,i,]*x[j,i,])                         
      
      # Non-renewable energy
      nen[j,i] = en[j,i] - ren[j,i]                                                
      
      # Annual C02 emissions
      emis[j,i] = beta_e[j,i]*nen[j,i]*(1-mu_e)  
      
      # Auxiliary calculations: annual C02 emissions by industry
      emis_by_ind[j,i,] = eps_en[j,i,] * ((1-eta_en[j,i,]) * x[j,i,]) * beta_e[j,i]
      
      # C02 emission rate
      beta_e[j,i] = beta_e[j,i-1]*(1-g_beta_e[j,i])   
      
      # Cumulative emissions
      co2_cum[j,i] = co2_cum[j,i-1] + emis[j,i]
      
      # Atmospheric temperature 
      temp[j,i] = (1/(1-fnc))*tcre*(co2_cum[j,i])
      
      
      # Resources and reserves #### 
      
      # Stock of material reserves
      k_m[j,i] = k_m[j,i-1] + conv_m[j,i] - mat[j,i]                      
      
      # Material resources converted to reserves 
      conv_m[j,i] = sigma_m*res_m[j,i]                                    
      
      # Stock of material resources
      res_m[j,i] = res_m[j,i-1] - conv_m[j,i]                            
      
      # Carbon mass of non-renewable energy 
      cen[j,i] = emis[j,i]/car                                            
      
      # Mass of oxygen 
      o2[j,i] = emis[j,i] - cen[j,i]                                      
      
      # Stock of energy reserves
      k_e[j,i] = k_e[j,i-1] + conv_e[j,i] - en[j,i]                       
      
      # Energy resources converted to reserves 
      conv_e[j,i] = sigma_e*res_e[j,i]                                    
      
      # Stock of energy resources
      res_e[j,i] = res_e[j,i-1] - conv_e[j,i]                             
      
      
      # CLIMATE RELATED IMPACTS ####
      
      # Endogenous propensity to consume out of income - eq. 12.A
      alpha1[j,i] = alpha10 - alpha11*r[j,i-1] - alpha12 * (temp[j,i] - temp[j,i-1]) - alpha13 * (kh[j,i] - kh[j,i-1])   
      
      
      # INDICES ####
      
      # Depletion rate of material reserves
      dep_m[j,i] = mat[j,i]/k_m[j,i-1] 
      
      # Depletion rate of energy reserves
      dep_e[j,i] = nen[j,i]/k_e[j,i-1]
      
      # Wage share
      ws[j,i] = (wb[j,i,1]+wb[j,i,2]+wb[j,i,3])/y[j,i]
      
      # National income in real terms (using sector-specific deflators)
      y_r[j,i] = cons[j,i]+g[j,i]
      
      # Real financial wealth
      v_r[j,i] = v[j,i]/p_c[j,i]
      
      
      # ADDITIONAL VARIABLES FOR ROMA 3 LECTURE
      
      # Mitigation costs *new*
      Cmit[j,i] = psi*(mu_e^beta)*y[j,i-1] 
      
      #Damage rate *new2*
      df[j,i] = thetad1*temp[j,i-1] + thetad2*temp[j,i-1]^2
      
      
      # CHECK CONVERGENCE (BASED ON Y) ####
      if (abs(y[j,i] - y_old) < tol){
        iter_used[j,i] <- iterations
        break   # Stop iterating once convergence is reached
      }
      
      # Update y_old for next iteration
      y_old <- y[j,i]
      
      # If max iterations reached
      if (iterations == nIterations){
        iter_used[j,i] <- nIterations
      }
      
    }
  }
}

# Close the progress bar
pb$terminate()

# DEFINE PLOTTING LAYOUT AND COLOURS ####

# Layout
layout(matrix(c(1:6), 3, 2, byrow = TRUE))
par(mar = c(5.1+1, 4.1+1, 4.1+1, 2.1+1), 
    oma = c(0, 0, 3, 0))  

# Customized colours
mycol1 <- rgb(0, 200, 0, max = 255, alpha = 80)

# Considered time span
tspan <- nPeriods

# PLOT ITERATIONS PER PERIOD ####
plot(1:nPeriods, iter_used[1,], type="h", col="coral",
     lwd=1,lty=1,font.main=1,cex.main=1,
     xlab="", ylab="Iterations",
     main=paste("Figure 1a. Iterations per Period1"),
     ylim=c(0, nIterations))
grid()

# CONSISTENCY CHECK (REDUNDANT EQUATION) ####

# Create consistency statement and other info ####
aerror<-0
error<-0
for (j in 1:nScenarios){
  for (i in 2:(nPeriods-1)){
    error <- error + abs(h_s[j,i]-h_h[j,i])}}
aerror <- error/(nPeriods*nScenarios)
if ( aerror<0.1 ){cat("\n ************************************* \n Good news! The model is watertight! \n", "Average error =", aerror, "< 0.1 \n", "Cumulative error =", error, "\n *************************************")} else{
  if ( aerror<1 && aerror<1 ){cat("\n ************************************* \n Minor issues with model consistency \n", "Average error =", aerror, "> 0.1 \n", "Cumulative error =", error, "\n *************************************")}
  else{cat("\n ********************************************* \n Warning: the model is not fully consistent! \n", "Average error =", aerror, "> 1 \n", "Cumulative error =", error, "\n *********************************************")} }      
cat("\n Number of industries =", nIndustries)
cat("\n Number of scenarios =", nScenarios)
cat("\n Convergence tolerance =", tol)
cat("\n Max number of iterations =", max(iter_used),"/",nIterations)
cat("\n *************************************")

# Figure 1: redundant equation
plot(h_s[1,2:tspan]-h_h[1,2:tspan], type="l", col="darkgreen",lwd=3,lty=1,font.main=1,cex.main=1,
     main=expression("Figure 1b. Consistency check: " * italic(H[phantom("")]["s"]) - italic(H[phantom("")]["h"])),
     cex.axis=1,cex.lab=1,ylab = '\u00A3',
     xlab = '',ylim = range(-1,1))
rect(xleft=-10,xright=tspan*1.1,ybottom=-0.5,ytop=0.5,col=mycol1,border=NA)
abline(h=c(-0.5,0.5),lwd=1,col="darkgreen")

# Add notification sound
library(beepr)
beep(sound = 2)

# PLOT RESULTS ####

# Add title
title("Baseline scenario", outer = TRUE)

# Figure 2: disposable income and consumption
plot(yd[1,2:tspan],type="l", col=2, lwd=2, lty=1, font.main=1,cex.main=1,
     main="Figure 2. Disposable income and consumption",
     ylab = '\u00A3',xlab = '',ylim = range(min(cons[1,2:tspan]*p_c[1,2:tspan]),max(yd[1,2:tspan])),
     cex.axis=1,cex.lab=1)
lines(cons[1,2:tspan]*p_c[1,2:tspan],type="l",lwd=2,lty=1,col="purple1")
legend("right",c("Disposable income","Nom. consumption"),  bty = "n",
       cex=1, lty=c(1,1), lwd=c(2,2), col = c(2,"purple1"), box.lty=0)
abline(h=yd[1,nPeriods],col=1,lty=3)

# Figure 3: Final demand by industry 
plot(d[1,2:tspan,1]*p[1,2:tspan,1],type="l",lwd=2,col="springgreen4",
     main="Figure 3. Final demand by industry (nominal)",
     font.main=1,cex.main=1,
     ylab = '£',xlab = '',ylim=range(min(p[1,2:tspan,]*d[1,2:tspan,]),max(p[1,2:tspan,]*d[1,2:tspan,])))
lines(p[1,2:tspan,2]*d[1,2:tspan,2],type="l",lwd=2,col="orangered",lty=1)
lines(p[1,2:tspan,3]*d[1,2:tspan,3],type="l",lwd=2,col="dodgerblue3",lty=1)
legend("right",c("Agriculture","Manufacturing","Services"),  bty = 'n', cex=1, lty=c(1,1,1), lwd=c(2,2,2), col = c("springgreen4","orangered","dodgerblue3"), box.lty=0)

# Figure 4: Gross outputs by industry 
plot(x[1,2:tspan,1],type="l",lwd=2,col="springgreen4",
     main="Figure 4. Gross output by industry (real)",
     font.main=1,cex.main=1,
     ylab = 'Index',xlab = '',ylim=range(min(x[1,2:tspan,]),max(x[1,2:tspan,])))
lines(x[1,2:tspan,2],type="l",lwd=2,col="orangered",lty=1)
lines(x[1,2:tspan,3],type="l",lwd=2,col="dodgerblue3",lty=1)
legend("bottomright",c("Agriculture","Manufacturing","Services"),  bty = 'n', cex=1, lty=c(1,1,1), lwd=c(2,2,2), col = c("springgreen4","orangered","dodgerblue3"), box.lty=0)

# Figure 5: Unit prices by industry 
plot(p[1,2:tspan,1],type="l",lwd=2,col="springgreen4",
     main="Figure 5. Unit prices by industry",
     font.main=1,cex.main=1,
     ylab = '£',xlab = '',ylim=range(min(p[1,2:tspan,]),max(p[1,2:tspan,])))
lines(p[1,2:tspan,2],type="l",lwd=2,col="orangered",lty=1)
lines(p[1,2:tspan,3],type="l",lwd=2,col="dodgerblue3",lty=1)
legend("topright",c("Agriculture","Manufacturing","Services"),  bty = 'n', cex=1, lty=c(1,1,1), lwd=c(2,2,2), col = c("springgreen4","orangered","dodgerblue3"), box.lty=0)

# Figure 6: Price indexes by sector 
plot(p_c[1,2:tspan],type="l",lwd=2,col="brown",
     main="Figure 6. Price indexes by sector",
     font.main=1,cex.main=1,
     ylab = '£',xlab = '',ylim=range(min(p_g[1,2:tspan])-0.2,max(p_c[1,2:tspan]))+0.1)
lines(p_g[1,2:tspan],type="l",lwd=2,col="gold3",lty=1)
legend("topright",c("Consumer","Government"),  bty = 'n', cex=1, lty=c(1,1), lwd=c(2,2), col = c("brown","gold3"), box.lty=0)

#Figure 7: reserves depletion rates 
plot(100*(mat[1,2:tspan]/k_m[1,1:(tspan-1)]),type="l",
     col="coral3", lwd=3, lty=1, font.main=1,cex.main=1,
     main="Figure 7. Reserves depletion rates",
     ylab = 'Index (%)',xlab = '',cex.axis=1,cex.lab=1,ylim=range(0.3,1.5))
lines(100*(nen[1,2:tspan]/k_e[1,1:(tspan-1)]),col="cyan4", lwd=3, lty=1)
legend("topright",c("Matter","Energy"),  bty = "n",
       cex=1, lty=c(1,1), lwd=c(3,3), col = c("coral3","cyan4"), box.lty=0)

# Figure 8: Annual CO2 emissions by industry 
plot(emis_by_ind[1,2:tspan,1],type="l",lwd=2,col="springgreen4",
     main=expression("Figure 8. Annual CO"[2]~"emissions by industry"),
     font.main=1,cex.main=1,
     ylab = expression('GtCO'[2]),xlab = '',ylim=range(min(emis_by_ind[1,2:tspan,]),max(emis_by_ind[1,2:tspan,])))
lines(emis_by_ind[1,2:tspan,2],type="l",lwd=2,col="orangered",lty=1)
lines(emis_by_ind[1,2:tspan,3],type="l",lwd=2,col="dodgerblue3",lty=1)
legend("topright",c("Agriculture","Manufacturing","Services"),  bty = 'n', cex=1, lty=c(1,1,1), lwd=c(2,2,2), col = c("springgreen4","orangered","dodgerblue3"), box.lty=0)

#Figure 9: Total emissions
plot(emis[1, 2:tspan], type = "l", col = "yellow3", lwd = 2, lty = 1, font.main = 1, cex.main = 1,
     main = expression("Figure 9. Total CO"[2]~"emissions"),
     ylab = expression('GtCO'[2]), xlab = '', 
     ylim = range(min(emis[1, 2:tspan]), max(emis[1, 2:tspan])),
     cex.axis = 1, cex.lab = 1)
par(new = TRUE)
plot(co2_cum[1, 2:tspan], type = "l", lwd = 2, lty = 1, col = "salmon",
     axes = FALSE, xlab = "", ylab = "", 
     ylim = range(min(co2_cum[1, 2:tspan]), max(co2_cum[1, 2:tspan])))
axis(4)  # Add right y-axis
#mtext("Cumulative Index", side = 4, line = 3, cex=0.8)  # Label for right y-axis
legend("right", c("Annual", "Cumulative (right axis)"), bty = "n",
       cex = 1, lty = c(1, 1), lwd = c(2, 2), col = c("yellow3", "salmon"), box.lty = 0)

#Figure 10: Atmospheric temperature
plot(temp[1,2:tspan],type="l",
     col="cornflowerblue", lwd=3, lty=1, font.main=1,cex.main=1,
     main="Figure 10. Atmospheric temperature",
     ylab = 'C',xlab = '',cex.axis=1,cex.lab=1)