# IO table for Model 3IO-PC
# Created by Marco Veronese Passarella
# Last revision: 28 August 2025

# Upload libraries ####
library(knitr)

# Choose a year
yr<-10

# Create row names for IO matrix ####
rownames <-c( "Agriculture (production)",
              "Manufacturing (production)",
              "Services (production)",
              "Value added",
              "- Labour income",
              "- Capital income",
              "Output"
)

# Calculate intermediate consumption by industry
k1 <- x[1,yr,1]*(a11*p[1,yr,1]+a21*p[1,yr,2]+a31*p[1,yr,3])
k2 <- x[1,yr,2]*(a12*p[1,yr,1]+a22*p[1,yr,2]+a32*p[1,yr,3])
k3 <- x[1,yr,3]*(a13*p[1,yr,1]+a23*p[1,yr,2]+a33*p[1,yr,3])

# Create Agriculture column ####
Agr <- c(round(x[1,yr,1]*a11*p[1,yr,1], digits = 2),                                                                    
          round(x[1,yr,1]*a21*p[1,yr,2], digits = 2),
          round(x[1,yr,1]*a31*p[1,yr,3], digits = 2),
          round(x[1,yr,1]*p[1,yr,1]-k1, digits = 2),
          round(w*x[1,yr,1]/pr1, digits = 2),
          round(mu*k1, digits = 2), 
          round(x[1,yr,1]*p[1,yr,1], digits = 2)
)

# Create table of results
IO_Agr<-as.data.frame(Agr,row.names=rownames)
kable(IO_Agr)

# Create industry 2 column ####
Man <- c(round(x[1,yr,2]*a12*p[1,yr,1], digits = 2),                                                                    
          round(x[1,yr,2]*a22*p[1,yr,2], digits = 2),
          round(x[1,yr,2]*a32*p[1,yr,3], digits = 2),
          round(x[1,yr,2]*p[1,yr,2]-k2, digits = 2),
          round(w*x[1,yr,2]/pr2, digits = 2),
          round(mu*k2, digits = 2), 
          round(x[1,yr,2]*p[1,yr,2], digits = 2)
)

#Create table of results
IO_Man<-as.data.frame(Man,row.names=rownames)
kable(IO_Man)

# Create industry 3 column ####
Ser <- c(round(x[1,yr,3]*a13*p[1,yr,1], digits = 2),                                                                    
          round(x[1,yr,3]*a23*p[1,yr,2], digits = 2),
          round(x[1,yr,3]*a33*p[1,yr,3], digits = 2),
          round(x[1,yr,3]*p[1,yr,3]-k3, digits = 2),
          round(w*x[1,yr,3]/pr3, digits = 2),
          round(mu*k3, digits = 2), 
          round(x[1,yr,3]*p[1,yr,3], digits = 2)
)

# Create table of results
IO_Ser<-as.data.frame(Ser,row.names=rownames)
kable(IO_Ser)

# Create final demand column ####
Dem <- c(round(d[1,yr,1]*p[1,yr,1], digits = 2),                                                                    
         round(d[1,yr,2]*p[1,yr,2], digits = 2),
         round(d[1,yr,3]*p[1,yr,3], digits = 2),
         round((d[1,yr,1]*p[1,yr,1]
                +d[1,yr,2]*p[1,yr,2]
                +d[1,yr,3]*p[1,yr,3]), digits = 2),
         round(w*x[1,yr,1]/pr1 +
               w*x[1,yr,2]/pr2 +
               w*x[1,yr,3]/pr3, digits = 2),
         round(mu*(k1 + k2 + k3), digits = 2), 
         
         "")

# Create table of results
IO_Dem<-as.data.frame(Dem,row.names=rownames)
kable(IO_Dem)

# Create output column ####
Out <- c(round(x[1,yr,1]*a11*p[1,yr,1]
              +x[1,yr,2]*a12*p[1,yr,1]
              +x[1,yr,3]*a13*p[1,yr,1]
              +d[1,yr,1]*p[1,yr,1], digits = 2),                                                                    
         round(x[1,yr,1]*a21*p[1,yr,2]
              +x[1,yr,2]*a22*p[1,yr,2]
              +x[1,yr,3]*a23*p[1,yr,2]
              +d[1,yr,2]*p[1,yr,2], digits = 2),
         round(x[1,yr,1]*a31*p[1,yr,3]
              +x[1,yr,2]*a32*p[1,yr,3]
              +x[1,yr,3]*a33*p[1,yr,3]
              +d[1,yr,3]*p[1,yr,3], digits = 2),
         "",
         "",
         "",
         round(p[1,yr,1]*x[1,yr,1]
              +p[1,yr,2]*x[1,yr,2]
              +p[1,yr,3]*x[1,yr,3], digits = 2))

# Create table of results
IO_Out<-as.data.frame(Out,row.names=rownames)
kable(IO_Out)

# Create complete IO matrix ####
IO_Matrix<-cbind(IO_Agr,IO_Man,IO_Ser,IO_Dem,IO_Out)
kable(IO_Matrix) #Unload kableExtra to use this

# Create html and latex versions ####

# Upload libraries
library(kableExtra)

# Create captions
caption3 <- paste("Table 3. Input-output matrix in period ",yr, "under baseline")

# Create html table for IO
IO_Matrix %>%
  kbl(caption=caption3,
      format= "html",
      col.names = c("Agriculture (demand)","Manufacturing (demand)","Services (demand)","Final demand","Output"),
      align="r") %>%
  kable_classic(full_width = F, html_font = "helvetica") %>%

  print()

