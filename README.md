<figure>
<img
src="https://github.com/marcoverpas/figures/blob/main/cover.png" width="1000">
</figure>

## Overview

This repository accompanies the keynote speech delivered at the [Summer School on *Multiscale Modeling and Ecological Macroeconomics*](https://www.must4water.unifi.it/p40.html) (8-10 September 2025, University of Florence, Italy). It presents a prototype hybrid model that integrates [Input-Output (IO) analysis](https://en.wikipedia.org/wiki/Input%E2%80%93output_model) with [Stock-Flow Consistent (SFC) modelling](https://en.wikipedia.org/wiki/Stock-flow_consistent_model) to assess ecological transition strategies in a macroeconomic framework. The material is organised as follows:

- [1 - Introduction](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#1---introduction)

- [1.1 - Standard Modelling Approaches](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#11---standard-modelling-approaches)

- [1.2 - Alternative Modelling Approaches](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#12---alternative-modelling-approaches)

- [2 - Assembling Blocks: From Model PC to Model ECO-3IO-PC](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#2---assembling-blocks-from-model-pc-to-model-eco-3io-pc)

- [2.1 - Model PC](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#21---model-pc)

- [2.2 - Model 3IO-PC](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#22---model-3io-pc)

- [2.3 - Model ECO-3IO-PC](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#23---model-eco-3io-pc)

- [3 - Playing with the Model](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#3-playing-with-the-model)

- [4 - A More Advanced Model](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#4-a-more-advanced-model)

- [References](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#references)

---

## Abstract

The shift towards an ecologically sustainable economic system necessitates robust modelling tools that capture the intricate interplay among financial, economic, social, and ecological variables. In my speech, I will explore the integration of insights from Input-Output (IO) models with Stock-Flow Consistent (SFC) models as a promising methodological approach for simulating and assessing green transition strategies. IO models have traditionally been employed to map inter-industry relationships and quantify resource flows, while SFC models provide a dynamic framework that ensures consistency in the stock and flow dynamics within both the economy and the ecosystem. Despite their complementary strengths, these two modelling approaches have largely evolved in isolation. By synthesising insights from recent literature, I will argue that hybrid IO-SFC models offer a powerful tool for understanding the macroeconomic implications of the green transition. I will present the main features of a prototype IO-SFC model designed to simulate green innovations in a single-area economy, highlighting its ability to address cross-industry interdependencies and environmental impacts. The model will be grounded in a broadly defined post-Keynesian theoretical framework in which money is endogenously created, production is demand-driven, and industries utilise the labour force and intermediate products to produce final goods while generating waste and emissions and depleting natural resources. Through this integrated approach, I will underscore how IO-SFC models can provide a broader perspective on the socio-economic and environmental outcomes of green policies.

---

## Keywords

Green Transition • Sustainability • Input-Output Analysis • Stock-Flow Consistent Models

---

## 1 - Introduction

### 1.1 - Standard Modelling Approaches

Since the mid-1990s, [dynamic stochastic general equilibrium](https://en.wikipedia.org/wiki/Dynamic_stochastic_general_equilibrium) (DSGE) models have dominated macroeconomics. Yet, these models are rarely applied to environmental issues ([Fevereiro et al. 2025](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)). This is unsurprising: their small size and simplified “harmonic oscillator” dynamics make them ill-suited for analysing climate change, biodiversity loss, rebound effects, lock-in effects, commons management, or circular economy policies. [Standard neoclassical growth](https://en.wikipedia.org/wiki/Solow%E2%80%93Swan_model) (NG) models fare no better, as environmental variables typically have no impact on the structural drivers of growth ([Rivera et al. 2018](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)).

To address environmental questions, mainstream economists often rely on two additional model classes: [integrated assessment models](https://en.wikipedia.org/wiki/Integrated_assessment_modelling) (IAMs) and [computable general equilibrium](https://en.wikipedia.org/wiki/Computable_general_equilibrium) (CGE) models. IAMs explicitly link the economy to the biosphere and atmosphere, combining social, economic, and environmental modules to assess mitigation scenarios or estimate the social cost of carbon. However, many IAMs - especially cost-benefit variants - inherit the same controversial assumptions as DSGE and NG models: a unique, stable, socially optimal equilibrium, and a hyper-rational representative agent optimising intertemporal utility under constraints. CGE models, by contrast, are large-scale and grounded in input-output and national accounts data, making them rich in sectoral detail. Yet their behavioural equations are rooted in neoclassical equilibrium theory, and they typically compare only pre- and post-shock states without modelling the transition in between.

### 1.2 - Alternative Modelling Approaches

Two alternative frameworks offer a way forward: [demand-driven input-output](https://en.wikipedia.org/wiki/Input%E2%80%93output_model) (IO) models and [stock-flow consistent](https://en.wikipedia.org/wiki/Stock-flow_consistent_model) (SFC) macroeconomic models.

- *IO models* capture interdependencies between industries and, like CGE models, can be extended to incorporate ecosystem-related variables. Their simplicity makes them highly transparent and data-driven, but they are essentially static, comparing two points in time without describing the path between them.  

- *SFC models* are a class of system dynamics tools developed mainly by post-Keynesian economists-integrate flows and stocks across the economy and the environment in a fully consistent manner ([Carnevali et al. 2019](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)). They have become increasingly popular in ecological macroeconomics thanks to their flexibility: SFC models can simulate dynamic transitions, test policy scenarios, and explore feedback effects between the economy and the ecosystem. Their limitation is that they typically operate at a high level of aggregation, overlooking inter-industry detail.

For many environmental applications, *combining IO and SFC approaches* can offer the best of both worlds: industrial granularity from IO, dynamic and financial coherence from SFC. This hybrid perspective enables researchers to explore environmental transitions in a way that is both empirically grounded and dynamically rich ([Fevereiro et al. 2025](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references); [Thomsen et al. 2025](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)).

---

## 2 - Assembling Blocks: From Model PC to Model ECO-3IO-PC

Arguably, when constructing a formal model, best practice is to tailor its features to the historically and geographically specific institutional characteristics of the region or country under consideration. However, building a model from scratch can be both time-consuming and technically demanding. This may discourage students and early-career researchers from engaging with formal modelling, particularly when the framework departs from familiar neoclassical principles. Moreover, excessive model complexity can hinder the dissemination of results and impede constructive dialogue with policymakers.

To address these challenges, an effective strategy is to develop the model by assembling pre-existing blocks drawn from the literature. This approach enables the creation of a *toy model* suitable for preliminary comparative-dynamics exercises, which can subsequently be adapted to reflect the institutional specificities of the country or area under consideration. 

In this lecture, we will employ three main blocks. The SFC skeleton of the model will be drawn from one of the simplest SFC frameworks, the so-called *Model PC* (see [Godley and Lavoie, 2007, ch. 4](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)). The interdependencies across industries will be modelled following the standard IO literature ([Miller and Blair, 2009, chs 1-2](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)). Finally, the ecological block will be adapted from [Dafermos, Nikolaidi, and Galanis (2016)](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references).

### 2.1 - Model PC

This is one of the simplest SFC toy models, and we will use it as our benchmark. PC stands for “portfolio choice”, as households can hold their wealth in the form of cash and/or government bills. The key assumptions are as follows: the economy is closed; there are four agents or sectors (households, firms, government, and central bank); there are two financial assets (government bills and cash); firms do not invest in fixed capital or hold inventories; prices are fixed; all corporate income is distributed to households; and there are no banks, hence no deposits. A complete description of the model is provided [here](https://github.com/marcoverpas/PhD_Lectures_Macerata_2025/blob/main/README.md#b2_model_pc) (*tip:* I suggest opening the link in a new tab). 

### 2.2 - Model 3IO-PC

There are currently only a few prototype input-output SFC models, despite recent progress (e.g. Thomsen et al. 2025). Integrating IO and SFC techniques poses challenges, but it is crucial for analysing the interaction of the ecosystem with the economy ([Hardt and O’Neill, 2017](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references); [Fevereiro et al. 2025](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)).

*Model 3IO-PC* is an input-output extension of *Model PC*, where *3IO* stands for "three-industry input-output structure".

In comparison to Model PC, additional assumptions include:

1. Three industries are considered: agriculture, manufacturing, services

1. Circulating capital is used

1. Technical coefficients are fixed

1. Each industry uses only one technique to produce one product

1. Prices are determined by reproduction conditions

1. The composition of both consumption and government spending is exogenously defined

The macro-accounting structure of *Model 3IO-PC* is identical to that of Model PC and is therefore relatively simple. Its key identities are derived from the balance-sheet matrix and the transaction-flow matrix. 

#### Table 1. Balance sheet matrix  


|              | Households  | Firms      |Central bank |Government | Row. tot |
|:------------:|:------:     |:------:    |:------:     |:------:   |:---:     |
|              |             |            |             |           |          |
|Cash (money)  |$$H_h$$      |            |$$-H_s$$     |           |   0      |
|Bills         |$$B_h$$      |            |$$B_{cb}$$   |$$-B_s$$   |   0      |
|Wealth        |$$-V_h$$     |            |             |$$V_g$$    |   0      |
|              |             |            |             |           |          |
|Column tot.   |   0         |0           |0            |0          |   0      |

#### Table 2. Transactions-flow matrix  

|                       |Households           |Firms             |Central bank             |Government           | Row. tot |
|:----------------------|:---------------:    |:----------------:|:--------------:         |:--------------:     |:-------: |
|                       |                     |                  |                         |                     |          |
|Consumption            |$$p_c \cdot -c_d$$   |$$p_c \cdot C_s$$ |                         |                     |   0      |
|Government expenditure |                     |$p_g \cdot $G$$   |                         |$$-p_g \cdot G$$     |   0      |
|GDP (income)           |$$Y$$                |$$-Y$$            |                         |                     |   0      |
|Interest payments      |$$r \cdot B_{h,-1}$$ |                  |$$r \cdot B_{cb,-1}$$    |$$-r \cdot B_{s,-1}$$|   0      |
|CB profit              |                     |                  |$$-r \cdot B_{cb,-1}$$   |$$r \cdot B_{cb,-1}$$|   0      |
|Taxes                  |$$-T$$               |                  |                         |$$T$$                |   0      |
|                       |                     |                  |                         |                     |          |
|Change in cash         |$$-\Delta H_h$$      |                  |$$\Delta H_s$$           |                     |   0      |
|Change in bills        |$$-\Delta B_h$$      |                  |$$-\Delta B_{cb}$$       |$$\Delta B_s$$       |   0      |
|                       |                     |                  |                         |                     |          |
|Column tot.            |0                    |0                 |0                        |0                    |   0      |

*Note*: The code needed to generate **Table 1** and **Table 2** can be accessed [here](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/3_BS_TFM_Tables.R).

For simplicity, the three-industry division applies only to the firm sector, not to households. In each industry, a single good is produced using a single production technique. It is further assumed that the marginal propensity to consume out of income is a negative function of the interest rate, as an increase in $r$ redistributes income from wage earners to rentiers, who have a lower propensity to consume:

$$\alpha_{1} = \alpha_{10} - \alpha_{11} \cdot r_{-1} $  

Under these assumptions, a few additional equations are required to transform *Model PC* (see [equations (1) to (12)](https://github.com/marcoverpas/PhD_Lectures_Macerata_2025/blob/main/README.md#b2_model_pc)) into *Model 3IO-PC*.

Notice that scalars are represented using *italic characters*, whereas vectors and matrices are represented using non-italic characters hereafter.

Column vector defining *composition of real consumption* (behavioural):

$$**\text{B}_c** = **\bar{\text{B}}_c** \quad \text{(13)} $$  

where $\mathrm{B_c} = [ B_{c1} \text{ } B_{c2} \text{ } B_{c3}]$ and $B_{c1} + B_{c2} + B_{c3} = 1$.

Column vector defining *composition of real government expenditure* (behavioural):

$$**\text{B}_g** = **\bar{\text{B}}_g** \quad \text{(14)} $$  

where $\mathrm{B_g} = [ B_{g1} \text{ } B_{g2} \text{ } B_{g3}]$ and $B_{g1} + B_{g2} + B_{g3} = 1$.

Column vector of *final demands in real terms* (identity):

$$**\text{d}** = **\text{B}_c** \cdot c + **\text{B}_g** \cdot g \quad \text{(15)} $$  

Column vector of *real gross outputs* (identity):

$$**\text{x}** = **\text{A}** \cdot **\text{x}** + **\text{d}**, ~ with: **\text{A}**= \left(\begin{array}{ccc} a_{11} & a_{12} & a_{13} \\
                                                                        a_{21} & a_{22} & a_{23} \\
                                                                        a_{31} & a_{32} & a_{33}
                                                                        \end{array}\right) \quad \text{(16)} $$  

Modified equation for *national income* (identity):

$$Y = **\text{p}^T** \cdot **\text{d}** \quad \text{(1.A)} $$

Column vector of *unit prices of reproduction* (behavioural):

$$**\text{p}** = \frac{w}{**\text{pr}**} + ( **\text{p}**^T \cdot **\text{A}** ) \cdot (1 + \mu) \quad \text{(17)} $$

where $w$ is the (uniform) wage rate, $\mathrm{pr}$ is the vector of labour productivities, and $\mu$ is the (uniform) profit rate.

*Average consumer price* (identity):

$$p_c = **\text{p}^T** \cdot **\text{B}_c** \quad \text{(18)} $$  

*Average price for the government* (identity):

$$p_g = **\text{p}^T** \cdot **\text{B}_g** \quad \text{(19)} $$  

*Real consumption function* (behavioural):

$$c = \alpha_1 \cdot \left( \frac{YD}{p_c} - \pi \cdot \frac{V_{-1}}{p_c} \right) + \alpha_2 \cdot \frac{V_{-1}}{p_{c}} \quad \text{(5.A)} $$

where $\pi$ is the rate of growth of the consumer price index (inflation rate), as consumers are assumed not to suffer from monetary illusion.

Note: the superscript $T$ stands for the transpose of the matrix, turning a column vector into a row vector. 

Equations (`13`) to (`19`) are additional ones. Equations (`1.A`) and (`5.A`) replace equations (`1`) and (`5`) of *Model PC*, respectively. Nominal consumption in equation (`4`) and nominal government spending in equation (`8`) are redefined as $p_c \cdot c$ and $p_g \cdot g$, respectively. 

Using the hidden equation, **Figure 1** demonstrates that the model is watertight, while **Figure 2** illustrates that the evolution of consumption and disposable income towards the steady state exactly matches that of a standard (aggregative) SFC model. However, unlike a standard SFC model, Model IO-PC also allows for the accounting of the input-output structure of the economy (**Figure 3** and **Figure 4**) and the way prices are set (**Figure 5** and **Figure 6**).

<figure>
<img
src="https://github.com/marcoverpas/figures/blob/main/3io_pc_baseline.png" width="1000">
</figure>

The simplified input-output matrix of *Model 3IO-PC* is shown in **Table 3**.

#### Table 3. Simplified input-output matrix

|                                | Agriculture (demand) | Manufacturing (demand) | Services (demand)    |  Final demand   |             Output              |
|:----------------------------   |:--------------------:|:--------------------:  |:--------------------:|:---------------:|:-------------------------------:|
|                                |                      |                        |                      |                 |                                 |
| **Agriculture (production)**   | \$p_1 a\_{11} x_1 \$ | \$p_1 a\_{12} x_2 \$   | \$p_1 a\_{13} x_3 \$ | $p_1 \cdot d_1$ |         $p_1 \cdot x_1$         |
| **Manufacturing (production)** | \$p_2 a\_{21} x_1 \$ | \$p_2 a\_{22} x_2 \$   | \$p_2 a\_{23} x_3 \$ | $p_2 \cdot d_2$ |         $p_2 \cdot x_2$         |
| **Services (production)**      | \$p_2 a\_{31} x_1 \$ | \$p_3 a\_{32} x_2 \$   | \$p_3 a\_{33} x_3 \$ | $p_3 \cdot d_3$ |         $p_3 \cdot x_3$         |
| **Value added**                |        $yn_1$        |        $yn_2$          |        $yn_3$        |      $yn$       |                                 |
| **Output**                     |   $p_1 \cdot x_1$    |   $p_2 \cdot x_2$      |   $p_3 \cdot x_3$    |                 | $\mathrm{p}^T \cdot \mathrm{x}$ |

*Note*: The main `R` code for developing Model *3IO-PC* and conducting experiments can be found [here](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/0_3IO-PC-Model.R).
The code needed to generate *Table 3* can be accessed [here](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/4_IO_Table.R).

**Table 3** illustrates cross-industry interdependencies in a simplified economy where two products are produced using the same products and labour.

While figures 6 to 4 show the evolution of model variables over time, Sankey diagrams can be used to take snapshots of the economy in a specific period.

<figure>
<img
src="https://github.com/marcoverpas/figures/blob/main/sankeys.png" width="1000">
</figure>

For instance, the diagrams above illustrate the payments across social sectors and the flows of inputs across industries, respectively, in period 5. The related code can be found [here](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/5_Sankey_TFM_IO.R).

Alternatively, network graphs can be used to illustrate the technical interdependencies among industries

<figure>
<img
src="https://github.com/marcoverpas/figures/blob/main/network_eco_3io_pc_2.png" width="500">
</figure>

Here, the size of each vertex is proportional to the corresponding industry's size. The related code can be accessed [here](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/7_IO_Network.R).

\:construction: Work in progress!

### 2.3 - Model ECO-3IO-PC

\:construction: Work in progress!

<figure>
<img
src="https://github.com/marcoverpas/figures/blob/main/sankey_mat_en.png" width="800">
</figure>

---

## 3. Playing with the Model

One of the advantages of creating formal models using `R` is that they can be conveniently converted into online interactive models using the `Shiny` package. Click the link below (or the figure) to open the simulation laboratory for *Model ECO-3IO-PC*.

[![Open Shiny App](https://img.shields.io/badge/Launch-Shiny_App-blue?style=for-the-badge&logo=r)](https://x52gnt-marco-passarella.shinyapps.io/eco_3io_sfc_model/)

<figure>
<a href="https://x52gnt-marco-passarella.shinyapps.io/eco_3io_sfc_model/" target="_blank">
<img src="https://raw.githubusercontent.com/marcoverpas/figures/main/laboratory.png" width="1000">
</a>
</figure>

---

## 4. A More Advanced Model

\:construction: Work in progress!

<figure>
<img
src="https://github.com/marcoverpas/figures/blob/main/Network_3.png" width="500">
</figure>

---

## References

- Carnevali, E., Deleidi, M., Pariboni, R., & Veronese Passarella, M. (2019). [**SFC dynamic models: features, limitations and developments**](https://link.springer.com/book/10.1007/978-3-030-23929-9). In: P. Arestis and M. Sawyer (eds.), \textit{Frontiers of Heterodox Economics, Series: International Papers in Political Economy}, Basingstoke \& New York: Palgrave Macmillan, pp. 223-276.

- Dafermos, Y., Nikolaidi, M., & Galanis, G. (2017). [**A stock-flow-fund ecological macroeconomic model**](https://www.sciencedirect.com/science/article/pii/S0921800916301343). Ecological Economics, 131: 191-207.

- Fevereiro, J. B. R. T., Genovese, A., Purvis, B., Valles Codina, O., & Veronese Passarella, M. (2025). [**Macroeconomic Models for Assessing the Transition towards a Circular Economy: A Systematic Review**](https://doi.org/10.1016/j.ecolecon.2025.108669). *Ecological Economics*, Vol. 236, 108669.

- Godley, W., & Lavoie, M. (2007). [**Monetary Economics: An Integrated Approach to Credit, Money, Income, Production and Wealth**](https://link.springer.com/book/10.1007/978-1-137-08599-3). Palgrave Macmillan. Chapters 1-4.

- Hardt, L., & O'Neill, D. W. (2017). [**Ecological Macroeconomic Models: Assessing Current Developments**](https://doi.org/10.1016/j.ecolecon.2016.12.027). Ecological Economics, 134: 198-211.

- Miller, R. E., & Blair, P. D. (2009). [**Input-Output Analysis: Foundations and Extensions**](https://www.cambridge.org/core/books/inputoutput-analysis/69827DA658E766CD1E17B1A47BA2B9C3). Cambridge University Press, 2nd edition. Chapters 1-2.

- Thomsen, S. F., Raza, H., & Byrialsen, M. R. (2025). [**An assessment of carbon taxation policies: The case of Denmark**](https://doi.org/10.1016/j.ecolecon.2025.108741). *Ecological Economics*, 238, 108741. 

- Rivera, G.L., Malliet, P., Saussay, A., & Reynes, F. (2018). [**The State of Applied Environmental Macroeconomics**](https://sciencespo.hal.science/hal-03443474/file/8-157-2018-the-state-of-applied-environmental-macroeconomics-glandarivera.pdf). *Revue de l'OFCE*, 157(3): 133-149.  

- Veronese Passarella, M. (2024). [**Notes for the 17th EAEPE Summer School**](https://github.com/marcoverpas/EAEPE_summer_school_2024). GitHub Repository.

- Veronese Passarella, M. (2025). [**Issues in Monetary Policies and Monetary Circuits**](https://github.com/marcoverpas/PhD_Lectures_Macerata_2025). GitHub Repository, Sections B1–B5.

- Nikiforos, M., & Zezza, G. (2017). [**Stock-flow Consistent Macroeconomic Models: A Survey**](https://doi.org/10.1111/joes.12221). *Journal of Economic Surveys*, 3(5): 1204-1239.
