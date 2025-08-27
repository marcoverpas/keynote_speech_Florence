# Plots of alternative scenario
# Created by Marco Veronese Passarella
# Last revision: 6 August 2025

# Adjust plotting period
period = 49:tspan

# Layout
layout(matrix(c(1:6), 3, 2, byrow = TRUE))
par(mar = c(5.1+1, 4.1+1, 4.1+1, 2.1+1), 
    oma = c(0, 0, 3, 0))  

# Figure 1: redundant equation
plot(h_s[2,2:tspan]-h_h[2,2:tspan], type="l", col="darkgreen",lwd=3,lty=1,font.main=1,cex.main=1,
     main=expression("Figure 1. Consistency check: " * italic(H[phantom("")]["s"]) - italic(H[phantom("")]["h"])),
     cex.axis=1,cex.lab=1,ylab = '\u00A3',
     xlab = '',ylim = range(-1,1))
rect(xleft=-10,xright=tspan*1.1,ybottom=-0.5,ytop=0.5,col=mycol1,border=NA)
abline(h=c(-0.5,0.5),lwd=1,col="darkgreen")

# PLOT RESULTS ####

# Add title
title("Alternative scenario: higher temperature elasticity of consumption in t = 50", outer = TRUE)

# Figure 2: disposable income and consumption
plot(period,yd[2,49:tspan],type="l", col=2, lwd=2, lty=1, font.main=1,cex.main=1,
     main="Figure 2. Disposable income and consumption",
     ylab = '\u00A3',xlab = '',ylim = range(min(cons[2,49:tspan]*p_c[2,49:tspan]),max(yd[2,49:tspan])),
     cex.axis=1,cex.lab=1)
lines(period,cons[2,49:tspan]*p_c[2,49:tspan],type="l",lwd=2,lty=1,col="purple1")
legend("right",c("Disposable income","Nom. consumption"),  bty = "n",
       cex=1, lty=c(1,1), lwd=c(2,2), col = c(2,"purple1"), box.lty=0)
abline(h=yd[1,nPeriods],col=1,lty=3)

# Figure 3: Final demand by industry 
plot(period,d[2,49:tspan,1]*p[2,49:tspan,1],type="l",lwd=2,col="springgreen4",font.main=1,
     main="Figure 3. Final demand by industry (nominal)",
     font.main=1,cex.main=1,
     ylab = '£',xlab = '',ylim=range(max(p[2,49:tspan,]*d[2,49:tspan,]),min(p[2,49:tspan,]*d[2,49:tspan,])))
lines(period,p[2,49:tspan,2]*d[2,49:tspan,2],type="l",lwd=2,col="orangered",lty=1)
lines(period,p[2,49:tspan,3]*d[2,49:tspan,3],type="l",lwd=2,col="dodgerblue3",lty=1)
legend("right",c("Agriculture","Manufacturing","Services"),  bty = 'n', cex=1, lty=c(1,1,1), lwd=c(2,2,2), col = c("springgreen4","orangered","dodgerblue3"), box.lty=0)

# Figure 4: Gross outputs by industry 
plot(period,x[2,49:tspan,1],type="l",lwd=2,col="springgreen4",font.main=1,
     main="Figure 4. Gross output by industry (real)",
     font.main=1,cex.main=1,
     ylab = 'Index',xlab = '',ylim=range(max(x[2,49:tspan,]),min(x[2,49:tspan,])))
lines(period,x[2,49:tspan,2],type="l",lwd=2,col="orangered",lty=1)
lines(period,x[2,49:tspan,3],type="l",lwd=2,col="dodgerblue3",lty=1)
legend("bottomright",c("Agriculture","Manufacturing","Services"),  bty = 'n', cex=1, lty=c(1,1,1), lwd=c(2,2,2), col = c("springgreen4","orangered","dodgerblue3"), box.lty=0)

# Figure 5: Unit prices by industry 
plot(period,p[2,49:tspan,1],type="l",lwd=2,col="springgreen4",font.main=1,
     main="Figure 5. Unit prices by industry",
     font.main=1,cex.main=1,
     ylab = '£',xlab = '',ylim=range(max(p[2,49:tspan,]),min(p[2,49:tspan,])))
lines(period,p[2,49:tspan,2],type="l",lwd=2,col="orangered",lty=1)
lines(period,p[2,49:tspan,3],type="l",lwd=2,col="dodgerblue3",lty=1)
legend("topright",c("Agriculture","Manufacturing","Services"),  bty = 'n', cex=1, lty=c(1,1,1), lwd=c(2,2,2), col = c("springgreen4","orangered","dodgerblue3"), box.lty=0)

# Figure 6: Price indexes by sector 
plot(period,p_c[2,49:tspan],type="l",lwd=2,col="brown",font.main=1,
     main="Figure 6. Price indexes by sector",
     font.main=1,cex.main=1,
     ylab = '£',xlab = '',ylim=range(0.9,1.1))
lines(period,p_g[2,49:tspan],type="l",lwd=2,col="gold3",lty=1)
legend("topright",c("Consumer","Government"),  bty = 'n', cex=1, lty=c(1,1), lwd=c(2,2), col = c("brown","gold3"), box.lty=0)

#Figure 7: reserves depletion rates 
plot(period,100*(mat[2,49:tspan]/k_m[2,48:(tspan-1)]),type="l",
     col="coral3", lwd=3, lty=1, font.main=1,cex.main=1,
     main="Figure 7. Reserves depletion rates",
     ylab = 'Index (%)',xlab = '',cex.axis=1,cex.lab=1,ylim=range(0.5,2))
lines(period,100*(en[2,49:tspan]/k_e[2,48:(tspan-1)]),col="cyan4", lwd=3, lty=1)
legend("topright",c("Matter","Energy"),  bty = "n",
       cex=1, lty=c(1,1), lwd=c(3,3), col = c("coral3","cyan4"), box.lty=0)


# Figure 8: Annual CO2 emissions by industry 
plot(period,emis_by_ind[2,49:tspan,1],type="l",lwd=2,col="springgreen4",font.main=1,
     main="Figure 8. Annual CO2 emissions by industry",
     font.main=1,cex.main=1,
     ylab = 'Index',xlab = '',ylim=range(max(emis_by_ind[2,49:tspan,]),min(emis_by_ind[2,49:tspan,])))
lines(period,emis_by_ind[2,49:tspan,2],type="l",lwd=2,col="orangered",lty=1)
lines(period,emis_by_ind[2,49:tspan,3],type="l",lwd=2,col="dodgerblue3",lty=1)
legend("topright",c("Agriculture","Manufacturing","Services"),  bty = 'n', cex=1, lty=c(1,1,1), lwd=c(2,2,2), col = c("springgreen4","orangered","dodgerblue3"), box.lty=0)

#Figure 9: Total emissions
plot(period,emis[2,49:tspan], type = "l", col = "yellow3", lwd = 2, lty = 1, font.main = 1, cex.main = 1,
     main = "Figure 9. Total CO2 emissions",
     ylab = 'Index', xlab = '', 
     ylim = range(min(emis[2,49:tspan]), max(emis[2,49:tspan])),
     cex.axis = 1, cex.lab = 1)
par(new = TRUE)
plot(period,co2_cum[2,49:tspan], type = "l", lwd = 2, lty = 1, col = "salmon",
     axes = FALSE, xlab = "", ylab = "", 
     ylim = range(min(co2_cum[2,49:tspan]), max(co2_cum[2,49:tspan])))
axis(4)  # Add right y-axis
#mtext("Cumulative Index", side = 4, line = 3, cex=0.8)  # Label for right y-axis
legend("right", c("Annual", "Cumulative (right axis)"), bty = "n",
       cex = 1, lty = c(1, 1), lwd = c(2, 2), col = c("yellow3", "salmon"), box.lty = 0)

#Figure 10: Atmospheric temperature
plot(period,temp[2,49:tspan],type="l",
     col="cornflowerblue", lwd=3, lty=1, font.main=1,cex.main=1,
     main="Figure 10. Atmospheric temperature",

     ylab = 'C',xlab = '',cex.axis=1,cex.lab=1)
