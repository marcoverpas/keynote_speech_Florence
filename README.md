# Modelling the Green Transition Through a Simple IO-SFC Model

---

## Overview

This repository accompanies the keynote speech delivered at the [Summer School on *Multiscale Modeling and Ecological Macroeconomics*](https://www.must4water.unifi.it/p40.html) (8-10 September 2025, University of Florence, Italy). It presents a prototype hybrid model that integrates [Input-Output (IO) analysis](https://en.wikipedia.org/wiki/Input%E2%80%93output_model) with [Stock-Flow Consistent (SFC) modelling](https://en.wikipedia.org/wiki/Stock-flow_consistent_model) to assess ecological transition strategies in a macroeconomic framework.

---

## Abstract

The shift towards an ecologically sustainable economic system necessitates robust modelling tools that capture the intricate interplay among financial, economic, social, and ecological variables. In my speech, I will explore the integration of insights from Input-Output (IO) models with Stock-Flow Consistent (SFC) models as a promising methodological approach for simulating and assessing green transition strategies. IO models have traditionally been employed to map inter-industry relationships and quantify resource flows, while SFC models provide a dynamic framework that ensures consistency in the stock and flow dynamics within both the economy and the ecosystem. Despite their complementary strengths, these two modelling approaches have largely evolved in isolation. By synthesising insights from recent literature, I will argue that hybrid IO-SFC models offer a powerful tool for understanding the macroeconomic implications of the green transition. I will present the main features of a prototype IO-SFC model designed to simulate green innovations in a single-area economy, highlighting its ability to address cross-industry interdependencies and environmental impacts. The model will be grounded in a broadly defined post-Keynesian theoretical framework in which money is endogenously created, production is demand-driven, and industries utilise the labour force and intermediate products to produce final goods while generating waste and emissions and depleting natural resources. Through this integrated approach, I will underscore how IO-SFC models can provide a broader perspective on the socio-economic and environmental outcomes of green policies.

---

## Keywords

Green Transition • Sustainability • Input-Output Analysis • Stock-Flow Consistent Models

---

## Introduction

Since the mid-1990s, **dynamic stochastic general equilibrium** (DSGE) models have dominated macroeconomics. Yet, these models are rarely applied to environmental issues (Fevereiro et al. 2025). This is unsurprising: their small size and simplified “harmonic oscillator” dynamics make them ill-suited for analysing climate change, biodiversity loss, rebound effects, lock-in effects, commons management, or circular economy policies. **Standard neoclassical growth** (NG) models fare no better, as environmental variables typically have no impact on the structural drivers of growth (Rivera et al. 2018).

To address environmental questions, mainstream economists often rely on two additional model classes: **integrated assessment models** (IAMs) and **computable general equilibrium** (CGE) models. IAMs explicitly link the economy to the biosphere and atmosphere, combining social, economic, and environmental modules to assess mitigation scenarios or estimate the social cost of carbon. However, many IAMs - especially cost-benefit variants - inherit the same controversial assumptions as DSGE and NG models: a unique, stable, socially optimal equilibrium, and a hyper-rational representative agent optimising intertemporal utility under constraints. CGE models, by contrast, are large-scale and grounded in input-output and national accounts data, making them rich in sectoral detail. Yet their behavioural equations are rooted in neoclassical equilibrium theory, and they typically compare only pre- and post-shock states without modelling the transition in between.

### Alternative Modelling Approaches

Two alternative frameworks offer a way forward: **demand-driven input-output** (IO) models and **stock-flow consistent** (SFC) macroeconomic models.

- **IO models** capture interdependencies between industries and, like CGE models, can be extended to incorporate ecosystem-related variables. Their simplicity makes them highly transparent and data-driven, but they are essentially static, comparing two points in time without describing the path between them.  

- **SFC models** are a class of system dynamics tools developed mainly by post-Keynesian economists-integrate flows and stocks across the economy and the environment in a fully consistent manner (Carnevali et al. 2019). They have become increasingly popular in ecological macroeconomics thanks to their flexibility: SFC models can simulate dynamic transitions, test policy scenarios, and explore feedback effects between the economy and the ecosystem. Their limitation is that they typically operate at a high level of aggregation, overlooking inter-industry detail.

For many environmental applications, **combining IO and SFC approaches** can offer the best of both worlds: sectoral granularity from IO, dynamic and financial coherence from SFC. This hybrid perspective enables researchers to explore environmental transitions in a way that is both empirically grounded and dynamically rich (Fevereiro et al. 2025; Thomsen et al. 2025).

---

## Assembling Blocks: From Model PC to Model ECO-3IO-PC

Arguably, when constructing a formal model, best practice is to tailor its features to the historically and geographically specific institutional characteristics of the region or country under consideration. However, building a model from scratch can be both time-consuming and technically demanding. This may discourage students and early-career researchers from engaging with formal modelling, particularly when the framework departs from standard neoclassical principles. Moreover, excessive model complexity can hinder the dissemination of results and impede constructive dialogue with policymakers.

To address these challenges, an effective strategy is to develop the model by assembling pre-existing blocks... [to be continued]

\:construction: Work in progress!

<figure>
<img
src="https://github.com/marcoverpas/figures/blob/main/network_eco_3io_pc_2.png" width="500">
</figure>

---

## Playing with the Model

\:construction: Work in progress!

[![Open Shiny App](https://img.shields.io/badge/Launch-Shiny_App-blue?style=for-the-badge&logo=r)](https://x52gnt-marco-passarella.shinyapps.io/eco_3io_sfc_model/)

---

## A Complete Model

\:construction: Work in progress!

---

## References

- Carnevali, E., Deleidi, M., Pariboni, R., & Veronese Passarella, M. (2019). **SFC dynamic models: features, limitations and developments**. In: P. Arestis and M. Sawyer (eds.), \textit{Frontiers of Heterodox Economics, Series: International Papers in Political Economy}, Basingstoke \& New York: Palgrave Macmillan, pp. 223-276.

- Fevereiro, J. B. R. T., Genovese, A., Purvis, B., Valles Codina, O., & Veronese Passarella, M. (2025). [**Macroeconomic Models for Assessing the Transition towards a Circular Economy: A Systematic Review**](https://doi.org/10.1016/j.ecolecon.2025.108669). *Ecological Economics*, Vol. 236, 108669.

- Godley, W., & Lavoie, M. (2007). **Monetary Economics: An Integrated Approach to Credit, Money, Income, Production and Wealth**. Palgrave Macmillan. Chapters 1-4.

- Miller, R. E., & Blair, P. D. (2009). **Input-Output Analysis: Foundations and Extensions**. Cambridge University Press, 2nd edition. Chapters 1-2.

- Thomsen, S. F., Raza, H., & Byrialsen, M. R. (2025). [**An assessment of carbon taxation policies: The case of Denmark**](https://doi.org/10.1016/j.ecolecon.2025.108741). *Ecological Economics*, Vol. 238, 108741. 

- Rivera, G.L., Malliet, P., Saussay, A., & Reynes, F. (2018). **The State of Applied Environmental Macroeconomics**. *Revue de l'OFCE*, 157 (3): 133-149.  

- Veronese Passarella, M. (2024). **Notes for the 17th EAEPE Summer School**. [GitHub Repository](https://github.com/marcoverpas/EAEPE_summer_school_2024).

- Veronese Passarella, M. (2025). **Issues in Monetary Policies and Monetary Circuits**. [GitHub Repository](https://github.com/marcoverpas/PhD_Lectures_Macerata_2025), Sections B1–B5.

