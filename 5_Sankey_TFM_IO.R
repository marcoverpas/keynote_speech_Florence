# Sankey diagrams of economic flows and 3IO interdependencieS 
# Created by Marco Veronese Passarella
# Last revision: 10 August 2025

# Upload libraries for Sankey diagram ####
library(networkD3)
library(htmlwidgets)
library(htmltools)

# A) Sankey diagram of money transactions-flow and nominal changes in stocks ####

# Create nodes: source, target and flows
nodes = data.frame("name" = 
                     c("Firms outflow", # Node 0
                       "Households outflow", # Node 1
                       "Government outflow", # Node 2
                       
                       "Firms inflow", # Node 3
                       "Households inflow", # Node 4
                       "Government inflow", # Node 5
                       
                       "Wages", # Node 6
                       "Consumption", # Node 7
                       "Taxes", # Node 8
                       "Government spending", # Node 9
                       "Money (change)", # Node 10
                       
                       "Interest payments", # Node 11
                       "Bills (change)", # Node 12                       
                       "CB outflow", # Node 13                    
                       "CB inflow" # Node 14                    
                       )) 

# Select period
yr=5

# Create the flows
links = as.data.frame(matrix(c(
  0, 6, p_c[1,yr]*cons[1,yr]+p_g[1,yr]*g[1,yr],  
  1, 7, p_c[1,yr]*cons[1,yr] ,
  1, 8, t[1,yr],
  1, 10, h_h[1,yr]-h_h[1,yr-1],
  2, 9, p_g[1,yr]*g[1,yr],
  6, 4, p_c[1,yr]*cons[1,yr]+p_g[1,yr]*g[1,yr],
  7, 3, p_c[1,yr]*cons[1,yr],
  8, 5, t[1,yr],
  9, 3, p_g[1,yr]*g[1,yr],
  2, 11, r[1,yr-1]*b_h[1,yr-1],
  11, 4, r[1,yr-1]*b_h[1,yr-1],
  10, 14, h_s[1,yr]-h_s[1,yr-1],
  12, 5, b_s[1,yr]-b_s[1,yr-1],
  1, 12, b_h[1,yr]-b_h[1,yr-1],
  13, 12, b_cb[1,yr]-b_cb[1,yr-1]
), 

# Note: each row represents a link. The first number represents the node being
# connected from. The second number represents the node connected to. The third
# number is the value of the node.  

byrow = TRUE, ncol = 3))
names(links) = c("source", "target", "value")
my_color <- 'd3.scaleOrdinal() .domain([]) .range(["blue","green","yellow","red","purple","khaki","peru","violet","cyan","pink","orange","beige","white"])'

# Create and plot the network
sankeyNetwork(Links = links, Nodes = nodes,
              Source = "source", Target = "target",
              Value = "value", NodeID = "name", colourScale=my_color,
              fontSize= 25, nodeWidth = 30)%>%
  print()

# B) Sankey diagram of cross-industry relations ####

library(networkD3)

# Create nodes for 3-industry model
nodes = data.frame("name" = 
                     c("a) Agriculture output", # Node 0
                       "b) Manufacturing output", # Node 1
                       "c) Services output", # Node 2
                       
                       "d) Agriculture inputs", # Node 3
                       "e) Manufacturing inputs", # Node 4
                       "f) Services inputs", # Node 5
                       
                       "g) Final demand for product 1", # Node 6
                       "h) Final demand for product 2", # Node 7
                       "i) Final demand for product 3", # Node 8
                       
                       "j) Market for agriculural products", # Node 9
                       "k) Market for manufacturing products", # Node 10
                       "l) Market for services" # Node 11
                     )) 

# Create the flows (using yr=1)
links = as.data.frame(matrix(c(
  
  # Agriculture flows
  0, 9, x[1,yr,1]*p[1,yr,1],
  9, 3, x[1,yr,1]*A[1]*p[1,yr,1],  # A11
  9, 4, x[1,yr,2]*A[4]*p[1,yr,1],  # A12
  9, 5, x[1,yr,3]*A[7]*p[1,yr,1],  # A13
  9, 6, d[1,yr,1]*p[1,yr,1],
  
  # Manufacturing flows
  1, 10, x[1,yr,2]*p[1,yr,2],
  10, 3, x[1,yr,1]*A[2]*p[1,yr,2],  # A21
  10, 4, x[1,yr,2]*A[5]*p[1,yr,2],  # A22
  10, 5, x[1,yr,3]*A[8]*p[1,yr,2],  # A23
  10, 7, d[1,yr,2]*p[1,yr,2],
  
  # Services flows
  2, 11, x[1,yr,3]*p[1,yr,3],
  11, 3, x[1,yr,1]*A[3]*p[1,yr,3],  # A31
  11, 4, x[1,yr,2]*A[6]*p[1,yr,3],  # A32
  11, 5, x[1,yr,3]*A[9]*p[1,yr,3],  # A33
  11, 8, d[1,yr,3]*p[1,yr,3]
), 
byrow = TRUE, ncol = 3))

names(links) = c("source", "target", "value")

my_color <- 'd3.scaleOrdinal() .domain([]) .range(["darkgreen","blue","purple",
              "mediumseagreen","turquoise","orchid",
              "palegreen","skyblue","violet",
              "seagreen","royalblue","darkorchid"])'

# Create and plot the network
sankeyNetwork(Links = links, Nodes = nodes,
              Source = "source", Target = "target",
              Value = "value", NodeID = "name", colourScale=my_color,
              fontSize= 20, nodeWidth = 30)%>%
  print()
