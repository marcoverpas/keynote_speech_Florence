# Balance-sheet and transactions-flow matrix for Model 3IO-PC
# Created by Marco Veronese Passarella
# Last revision: 11 August 2025

# Upload libraries ####
library(knitr)

# Choose a year ####
yr<-10

# Choose a scenario (note: 1 = baseline) ####
scen<-1

# Create row names for BS matrix ####
rownames<-c( "Cash (money)",
             "Bills",
             "Wealth",
             "Column total")

# Create households aggregates for BS ####
H <-c( round(h_h[scen,yr], digits = 2),                                                                    
       round(b_h[scen,yr], digits = 2),                                                                    
       round(-v[scen,yr], digits = 2),                                                                    
       round(-v[scen,yr]+h_h[scen,yr]+b_h[scen,yr], digits = 2)
)                                                                    

# Create table of results
H_BS<-as.data.frame(H,row.names=rownames)

# Print firms column
kable(H_BS)

# Create firms aggregates for BS ####
P <-c( "",                                                                    
       "",                                                                    
       "",                                                                    
       0
)                                                                    

# Create table of results
F_BS<-as.data.frame(P,row.names=rownames)

# Print firms column
kable(F_BS)

# Create government aggregates for BS ####
G   <-c( "",                                                                    
         round(-b_s[scen,yr], digits = 2),                                                                    
         round(b_s[scen,yr], digits = 2),                                                                    
         "0"
)                                                                    

# Create table of results
G_BS<-as.data.frame(G,row.names=rownames)

# Print firms column
kable(G_BS)

# Create CB aggregates for BS ####
CB  <-c( round(-h_s[scen,yr], digits = 2),                                                                    
         round(b_cb[scen,yr], digits = 2),                                                                    
         "0",
         round(-h_s[scen,yr]+b_cb[scen,yr], digits = 2)
)                                                                    

# Create table of results
CB_BS<-as.data.frame(CB,row.names=rownames)

# Print firms column
kable(CB_BS)

# Create "row total" column for BS
Tot  <-c( round(h_h[scen,yr]-h_s[scen,yr], digits = 2),                                                                    
          round(b_h[scen,yr]+b_cb[scen,yr]-b_s[scen,yr], digits = 2),                                                                    
          round(-v[scen,yr]+b_s[scen,yr], digits = 2),
          round(h_h[scen,yr]-h_s[scen,yr]+
                b_h[scen,yr]+b_cb[scen,yr]-b_s[scen,yr]+
                -v[scen,yr]+b_s[scen,yr], digits = 2)
)                                                                    

# Create table of results
Tot_BS<-as.data.frame(Tot,row.names=rownames)

# Print firms column
kable(Tot_BS)

# Create complete BS matrix ####
BS_Matrix<-cbind(H_BS,F_BS,CB_BS,G_BS,Tot_BS)
kable(BS_Matrix) #Unload kableExtra to use this

# Create row names for TFM ####
rownames<-c( "Consumption",
             "Government expenditure",
             "GDP (income)",
             "Interest payments",
             "CB profit",
             "Taxes",
             "Change in cash",
             "Change in bills",
             "Column total")

# Create households aggregates for TFM ####
H <-c( round(-cons[scen,yr]*p_c[scen,yr], digits = 2),
       "",
       round(y[scen,yr], digits = 2),                                                                    
       round(r[scen,yr-1]*b_h[scen,yr-1], digits = 2),
       "",
       round(-t[scen,yr], digits = 2),
       round(-h_h[scen,yr]+h_h[scen,yr-1], digits = 2),
       round(-b_h[scen,yr]+b_h[scen,yr-1], digits = 2),
       round(-cons[scen,yr]*p_c[scen,yr]+y[scen,yr]+r[scen,yr-1]*b_h[scen,yr-1]-t[scen,yr]+
              -h_h[scen,yr]+h_h[scen,yr-1]-b_h[scen,yr]+b_h[scen,yr-1], digits = 2)
)                                                                    

# Create table of results
H_TFM<-as.data.frame(H,row.names=rownames)

# Print firms column
kable(H_TFM)

# Create firms aggregates for TFM ####
P <-c( round(cons[scen,yr]*p_c[scen,yr], digits = 2),
       round(g[scen,yr]*p_g[scen,yr], digits = 2),
       round(-y[scen,yr], digits = 2),                                                                    
       "",
       "",
       "",
       "",
       "",
       round(cons[scen,yr]*p_c[scen,yr]+g[scen,yr]*p_g[scen,yr]-y[scen,yr], digits = 2)
)                                                                    

# Create table of results
F_TFM<-as.data.frame(P,row.names=rownames)

# Print firms column
kable(F_TFM)

# Create government aggregates for TFM ####
G   <-c( "",
         round(-g[scen,yr]*p_g[scen,yr], digits = 2),
         "",                                                                    
         round(-r[scen,yr-1]*b_s[scen,yr-1], digits = 2),
         round(r[scen,yr-1]*b_cb[scen,yr-1], digits = 2),
         round(t[scen,yr], digits = 2),
         "",
         round(b_s[scen,yr]-b_s[scen,yr-1], digits = 2),
         round(-g[scen,yr]*p_g[scen,yr]+
               -r[scen,yr-1]*b_s[scen,yr-1]+
                r[scen,yr-1]*b_cb[scen,yr-1]+
                t[scen,yr]+
                b_s[scen,yr]-b_s[scen,yr-1], digits = 2)
)                                                                    

# Create table of results
G_TFM<-as.data.frame(G,row.names=rownames)

# Print firms column
kable(G_TFM)

# Create CB aggregates for TFM ####
CB   <-c( "",
         "",
         "",                                                                    
         round(r[scen,yr-1]*b_cb[scen,yr-1], digits = 2),
         round(-r[scen,yr-1]*b_cb[scen,yr-1], digits = 2),
         "",
         round(h_s[scen,yr]-h_s[scen,yr-1], digits = 2),
         round(-b_cb[scen,yr]+b_cb[scen,yr-1], digits = 2),
         round(h_s[scen,yr]-h_s[scen,yr-1]-b_cb[scen,yr]+b_cb[scen,yr-1], digits = 2)
)                                                                    

#Create table of results
CB_TFM<-as.data.frame(CB,row.names=rownames)

#Print firms column
kable(CB_TFM)

# Create "row total" column (note: prices omitted) ####
Tot   <-c(round(cons[scen,yr]-cons[scen,yr], digits = 2),
          round(g[scen,yr]-g[scen,yr], digits = 2),
          round(y[scen,yr]-y[scen,yr], digits = 2),                                                                    
          round(r[scen,yr-1]*b_h[scen,yr-1]+r[scen,yr-1]*b_cb[scen,yr-1]-r[scen,yr-1]*b_s[scen,yr-1], digits = 2),
          round(r[scen,yr-1]*b_cb[scen,yr-1]-r[scen,yr-1]*b_cb[scen,yr-1], digits = 2),
          round(-t[scen,yr]+t[scen,yr], digits = 2),
          round(-h_h[scen,yr]+h_h[scen,yr-1]+h_s[scen,yr]-h_s[scen,yr-1], digits = 2),
          round(-b_h[scen,yr]+b_h[scen,yr-1]-b_cb[scen,yr]+b_cb[scen,yr-1]+b_s[scen,yr]-b_s[scen,yr-1], digits = 2),
          round(cons[scen,yr]-cons[scen,yr]+
                  g[scen,yr]-g[scen,yr]+
                  y[scen,yr]-y[scen,yr]+
                  r[scen,yr-1]*b_h[scen,yr-1]+r[scen,yr-1]*b_cb[scen,yr-1]-r[scen,yr-1]*b_s[scen,yr-1]+
                  r[scen,yr-1]*b_cb[scen,yr-1]-r[scen,yr-1]*b_cb[scen,yr-1]+
                  -t[scen,yr]+t[scen,yr]+
                  -h_h[scen,yr]+h_h[scen,yr-1]+h_s[scen,yr]-h_s[scen,yr-1]+
                  -b_h[scen,yr]+b_h[scen,yr-1]-b_cb[scen,yr]+b_cb[scen,yr-1]+b_s[scen,yr]-b_s[scen,yr-1], digits = 2)
)                                                                    

# Create table of results
Tot_TFM<-as.data.frame(Tot,row.names=rownames)

# Print firms column
kable(Tot_TFM)

# Create complete TFM matrix ####
TFM_Matrix<-cbind(H_TFM,F_TFM,CB_TFM,G_TFM,Tot_TFM)
kable(TFM_Matrix) #Unload kableExtra to use this

# Create html and latex tables ####

# Upload libraries
library(kableExtra)

# Create captions
caption1 <- paste("Table 1. Balance sheet of Model PC in period", yr, "under scenario", scen)
caption2 <- paste("Table 2. Transactions-flow matrix of Model PC in period ",yr, "under scenario", scen)

# Create html table for BS
BS_Matrix %>%
  kbl(caption=caption1,
      format= "html",
      #format= "latex",
      col.names = c("Households","Firms","Central bank","Government","Row total"),
      align="r") %>%
  kable_classic(full_width = F, html_font = "helvetica") %>%
  print()

# Create html table for TFM
TFM_Matrix %>%
  kbl(caption=caption2,
      format= "html",
      #format= "latex",
      col.names = c("Households","Firms","Central bank","Government","Row total"),
      align="r") %>%
  kable_classic(full_width = F, html_font = "helvetica")%>%
  print()