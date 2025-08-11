# Sankey diagram of matter and energy flows ####
# Created by Marco Veronese Passarella
# Last revision: 10 August 2025

# Upload libraries for Sankey diagram ####
library(networkD3)
library(htmlwidgets)
library(htmltools)

# Choose a period ####
yr=20

# Scaling factor for charts ####
sc = 7

# Create nodes: source, target and flows ####
nodes = data.frame("name" = 
                     c("Matter use", # Node 0
                       "Energy use" , # Node 1
                       "Extractions", # Node 2
                       "Recycled matter", # Node 3
                       "Renewable energy sources", # Node 4
                       "Carbon mass of non-renewable energy", #Node 5
                       "Non-renewable energy sources", #Node 6
                       "Oxygen", # Node 7
                       "CO₂ emissions", # Node 8
                       "Discarded stock", #Node 9
                       "Dissipated energy", #Node 10
                       "Change in socio-economic stock" #Node 11
                     )) 

# Create the flows ####
links = as.data.frame(matrix(c(
  
  # Matter
  2, 0, mat[1,yr],
  3, 0, rec[1,yr],
  5, 0, cen[1,yr],
  7, 0, o2[1,yr],
  0, 11, kh[1,yr] - kh[1,yr-1],
  0, 9, dis[1,yr],
  0, 8, emis[1,yr],
  
  # Energy
  4, 1, ren[1,yr]/sc,
  6, 1, nen[1,yr]/sc,
  1, 10, en[1,yr]/sc
  
), 

byrow = TRUE, ncol = 3))
names(links) = c("source", "target", "value")
my_color <- 'd3.scaleOrdinal() .domain([]) .range(["blue",
                                                   "green",
                                                    "yellow",
                                                    "red",
                                                    "purple",
                                                    "khaki",
                                                    "peru",
                                                    "beige",
                                                    "cyan",
                                                    "pink",
                                                    "orange",
                                                    "plum", 
                                                    "pink",
                                                    "indianred",
                                                    "black",
                                                    "gray",
                                                    "lightgreen",
                                                    "yellow",
                                                    "blue",
                                                    "red",
                                                    "beige",
                                                    "cyan",
                                                    "pink",
                                                    "orange",
                                                    "plum", 
                                                    "pink"

])'

# Create and plot the network ####
fig_MatEn <- sankeyNetwork(Links = links, Nodes = nodes,
                        Source = "source", Target = "target",
                        Value = "value", NodeID = "name", colourScale=my_color,
                        fontSize= 20, nodeWidth = 30)%>%
  print()