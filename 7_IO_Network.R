# Load necessary library ####
library(MASS)  # For matrix operations

# Define the input-output coefficients matrix (A) ####
A <- matrix(c(a11, a12, a13,
              a21, a22, a23,
              a31, a32, a33), 
              nrow = 3, ncol = 3, byrow = TRUE)

# Define the final demand vector (D) ####
# Note: D[i] represents the final demand for the output of industry i
D <- c(d[1,tspan,1], d[1,tspan,2], d[1,tspan,3])

# Calculate the Leontief inverse matrix (I - A)^(-1) ####
I <- diag(3)  # Identity matrix
Leontief_inverse <- ginv(I - A)  # Generalized inverse (pseudo-inverse) of (I - A)

# Calculate the total output vector (X) ####
# X = (I - A)^(-1) * D
X <- Leontief_inverse %*% D

# Print the results ####
cat("Input-Output Coefficients Matrix (A):\n")
print(A)

cat("\nFinal Demand Vector (D):\n")
print(D)

cat("\nLeontief Inverse Matrix ((I - A)^(-1)):\n")
print(Leontief_inverse)

cat("\nTotal Output Vector (X):\n")
print(X)

# Load necessary libraries for creating a network graph ####
library(igraph)  

# Define industry names ####
industries <- c("Agriculture", "Manufacturing", "Services")

# Create a graph from the adjacency matrix (A) ####
# Note: command to convert matrix A into a graph object
graph <- graph_from_adjacency_matrix(A, mode = "directed", weighted = TRUE)

# Set vertex (node) labels ####
V(graph)$name <- industries

# Set edge weights for visualization ####
E(graph)$width <- E(graph)$weight * 8  # Scale edge weights for better visibility

# Add edge labels (weights) and plot chart ####
edge_labels <- round(E(graph)$weight, 2)
edge_labels <- paste0("italic(a)[", 
                      c("11", "12", "13", "21", "22", "23", "31", "32", "33"), 
                      "] == ", 
                      edge_labels)

# Reset to 1 plot per device (default)
par(mfrow = c(1, 1))

# Plot the network graph
set.seed(123)
plot(graph, 
     edge.arrow.size = 0.5,
     edge.color = "gray50",
     vertex.color = c("lightgreen", "lightblue", "pink"),
     vertex.size = 1.2*c(x[1,tspan,1],x[1,tspan,2],x[1,tspan,3]),
     vertex.label.color = "black",
     vertex.label.cex = 1.2,
     vertex.label.dist = 2,
     #main = "Input-output network with 3 industries",
     layout = layout_with_fr(graph),
     edge.label = parse(text = edge_labels),  # Use parse() to interpret plotmath
     edge.label.color = "black",
     edge.label.cex = 0.8
)