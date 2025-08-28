<figure>
<img
src="https://github.com/marcoverpas/figures/blob/main/cover_2.png" width="1000">
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

- [3 - Playing with the Model](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#3---playing-with-the-model)

- [4 - Additional Experiments](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#4---additional-experiments)

- [5 - More Advanced Models](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#5---more-advanced-models)

- [5.1 - Circular Economy Intervention in a 2-Area World Economy Model](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#51---circular-economy-interventions-in-a-2-area-world-economy-model)

- [5.2 - Assessing Green Transition Policies](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#52---assessing-green-transition-policies)

- [6 - Final remarks](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#6---final-remarks)

- [References](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/README.md#references)

You can access the lecture slides [here](https://www.marcopassarella.it/wp-content/uploads/Presentation_Florence.pdf).

---

## Abstract

The shift towards an ecologically sustainable economic system necessitates robust modelling tools that capture the intricate interplay among financial, economic, social, and ecological variables. In my speech, I will explore the integration of insights from Input-Output (IO) models with Stock-Flow Consistent (SFC) models as a promising methodological approach for simulating and assessing green transition strategies. IO models have traditionally been employed to map inter-industry relationships and quantify resource flows, while SFC models provide a dynamic framework that ensures consistency in the stock and flow dynamics within both the economy and the ecosystem. Despite their complementary strengths, these two modelling approaches have largely evolved in isolation. By synthesising insights from recent literature, I will argue that hybrid IO-SFC models offer a powerful tool for understanding the macroeconomic implications of the green transition. I will present the main features of a prototype IO-SFC model designed to simulate green innovations in a single-area economy, highlighting its ability to address cross-industry interdependencies and environmental impacts. The model will be grounded in a broadly defined post-Keynesian theoretical framework in which money is endogenously created, production is demand-driven, and industries utilise the labour force and intermediate products to produce final goods while generating waste and emissions and depleting natural resources. Through this integrated approach, I will underscore how IO-SFC models can provide a broader perspective on the socio-economic and environmental outcomes of green policies.

---

## Keywords

Green Transition • Sustainability • Input-Output Analysis • Stock-Flow Consistent Models

---

:construction: Warning: work in progress!

## 1 - Introduction

### 1.1 - Standard Modelling Approaches

Since the mid-1990s, [dynamic stochastic general equilibrium](https://en.wikipedia.org/wiki/Dynamic_stochastic_general_equilibrium) (DSGE) models have dominated macroeconomics. Yet, these models are rarely applied to environmental issues ([Fevereiro et al. 2025](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)). This is unsurprising: their small size and simplified “harmonic oscillator” dynamics make them ill-suited for analysing climate change, biodiversity loss, rebound effects, lock-in effects, commons management, or circular economy policies. [Standard neoclassical growth](https://en.wikipedia.org/wiki/Solow%E2%80%93Swan_model) (NG) models fare no better, as environmental variables typically have no impact on the structural drivers of growth ([Rivera et al. 2018](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)).

To address environmental questions, mainstream economists often rely on two additional model classes: [integrated assessment models](https://en.wikipedia.org/wiki/Integrated_assessment_modelling) (IAMs) and [computable general equilibrium](https://en.wikipedia.org/wiki/Computable_general_equilibrium) (CGE) models. IAMs explicitly link the economy to the biosphere and atmosphere, combining social, economic, and environmental modules to assess mitigation scenarios or estimate the social cost of carbon. However, many IAMs - especially cost-benefit variants - inherit the same controversial assumptions as DSGE and NG models: a unique, stable, socially optimal equilibrium, and a hyper-rational representative agent optimising intertemporal utility under constraints. CGE models, by contrast, are large-scale and grounded in input-output and national accounts data, making them rich in sectoral detail. Yet their behavioural equations are often rooted in neoclassical equilibrium theory, and they typically compare only pre- and post-shock states without modelling the transition in between.

### 1.2 - Alternative Modelling Approaches

Two alternative frameworks offer a way forward: [demand-driven input-output](https://en.wikipedia.org/wiki/Input%E2%80%93output_model) (IO) models and [stock-flow consistent](https://en.wikipedia.org/wiki/Stock-flow_consistent_model) (SFC) macroeconomic models.

- *IO models* capture interdependencies between industries and, like CGE models, can be extended to incorporate ecosystem-related variables. Their simplicity makes them highly transparent and data-driven, but they are essentially static, comparing two points in time without describing the path between them.  

- *SFC models* are a class of system dynamics tools developed mainly by post-Keynesian economists. These models integrate flows and stocks across the economy and the environment in a fully consistent manner ([Carnevali et al. 2019](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)). They have become increasingly popular in ecological macroeconomics thanks to their flexibility: SFC models can simulate dynamic transitions, test policy scenarios, and explore feedback effects between the economy and the ecosystem. Their limitation is that they typically operate at a high level of aggregation, overlooking inter-industry detail.

For many environmental applications, *combining IO and SFC approaches* can offer the best of both worlds: industrial granularity from IO, dynamic and financial coherence from SFC. This hybrid perspective enables researchers to explore environmental transitions in a way that is both empirically grounded and dynamically rich ([Fevereiro et al. 2025](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references); [Thomsen et al. 2025](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)).

---

## 2 - Assembling Blocks: From Model PC to Model ECO-3IO-PC

Arguably, when constructing a formal model, best practice is to tailor its features to the historically and geographically specific institutional characteristics of the region or country under consideration. However, building a model from scratch can be both time-consuming and technically demanding. This may discourage students and early-career researchers from engaging with formal modelling, particularly when the framework departs from familiar neoclassical principles. Moreover, excessive model complexity can hinder the dissemination of results and impede constructive dialogue with policymakers.

To address these challenges, an effective strategy is to develop the model by assembling pre-existing blocks drawn from the literature. This approach enables the creation of a *toy model* suitable for preliminary comparative-dynamics exercises, which can subsequently be adapted to reflect the institutional specificities of the country or area under consideration. 

In this lecture, we will employ three main blocks. The SFC skeleton of the model will be drawn from one of the simplest SFC frameworks, the so-called *Model PC* (see [Godley and Lavoie, 2007, ch. 4](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)). The interdependencies across industries will be modelled following the standard IO literature ([Miller and Blair, 2009, chs 1-2](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)). Finally, the ecological block will be adapted from [Dafermos, Nikolaidi, and Galanis (2016)](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references).

### 2.1 - Model PC

This is one of the simplest SFC toy models, and we will use it as our benchmark. PC stands for “portfolio choice”, as households can hold their wealth in the form of cash and/or government bills. The key assumptions are as follows: the economy is closed; there are four agents or sectors (households, firms, government, and central bank); there are two financial assets (government bills and cash); firms do not invest in fixed capital or hold inventories; prices are fixed; all corporate income is distributed to households; and there are no banks, hence no deposits. A complete description of the model is provided [here](https://github.com/marcoverpas/PhD_Lectures_Macerata_2025/blob/main/README.md#b2_model_pc) (*tip:* I suggest opening the link in a new tab). 

### 2.2 - Model 3IO-PC

There are currently only a few prototype input-output SFC models, despite recent progress (e.g. [Thomsen et al. 2025](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)). Integrating IO and SFC techniques poses challenges, but it is crucial for analysing the interaction of the ecosystem with the economy ([Hardt and O’Neill, 2017](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references); [Fevereiro et al. 2025](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)).

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
|Consumption            |$$-p_c \cdot c_d$$   |$$p_c \cdot c_s$$ |                         |                     |   0      |
|Government expenditure |                     |$$p_g \cdot g$$   |                         |$$-p_g \cdot g$$     |   0      |
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

For simplicity, the three-industry division applies only to the firm sector, not to households. In each industry, a single good is produced using a single production technique. Under these assumptions, a few additional equations are required to transform *Model PC* (see [equations (1) to (12)](https://github.com/marcoverpas/PhD_Lectures_Macerata_2025/blob/main/README.md#b2_model_pc)) into *Model 3IO-PC*.

*Note*: Scalars are represented using *italic characters*, whereas vectors and matrices are represented using non-italic characters hereafter.

The column vector defining *composition of real consumption* (behavioural equation) is:

$$**\text{B}_c** = **\bar{\text{B}}_c** \quad \text{(13)} $$  

where $\mathrm{B_c} = [ B_{c1} \text{ } B_{c2} \text{ } B_{c3}]$ and $B_{c1} + B_{c2} + B_{c3} = 1$.

The column vector defining *composition of real government expenditure* (behavioural equation) is:

$$**\text{B}_g** = **\bar{\text{B}}_g** \quad \text{(14)} $$  

where $\mathrm{B_g} = [ B_{g1} \text{ } B_{g2} \text{ } B_{g3}]$ and $B_{g1} + B_{g2} + B_{g3} = 1$.

The column vector of *final demands in real terms* (identity) is:

$$**\text{d}** = **\text{B}_c** \cdot c + **\text{B}_g** \cdot g \quad \text{(15)} $$  

The column vector of *real gross outputs* (identity) is:

$$**\text{x}** = **\text{A}** \cdot **\text{x}** + **\text{d}**, ~ with: **\text{A}**= \left(\begin{array}{ccc} a_{11} & a_{12} & a_{13} \\
                                                                        a_{21} & a_{22} & a_{23} \\
                                                                        a_{31} & a_{32} & a_{33}
                                                                        \end{array}\right) \quad \text{(16)} $$  

The modified equation for *national income* (identity) is:

$$Y = **\text{p}^T** \cdot **\text{d}** \quad \text{(1.A)} $$

The column vector of *unit prices of reproduction* (behavioural) is:

$$**\text{p}** = \frac{w}{**\text{pr}**} + ( **\text{p}**^T \cdot **\text{A}** ) \cdot (1 + \mu) \quad \text{(17)} $$

where $w$ is the (uniform) wage rate, $\mathrm{pr}$ is the vector of labour productivities, and $\mu$ is the (uniform) profit rate.

The *average consumer price index* (identity) is:

$$p_c = **\text{p}^T** \cdot **\text{B}_c** \quad \text{(18)} $$  

The *average price for the government* (identity) is:

$$p_g = **\text{p}^T** \cdot **\text{B}_g** \quad \text{(19)} $$  

The *real consumption function* (behavioural equation) is:

$$c = \alpha_1 \cdot \left( \frac{YD}{p_c} - \pi \cdot \frac{V_{-1}}{p_c} \right) + \alpha_2 \cdot \frac{V_{-1}}{p_{c}} \quad \text{(5.A)} $$

where $\pi$ is the rate of growth of the consumer price index (inflation rate), as consumers are assumed not to suffer from monetary illusion.

*Note*: The superscript $T$ stands for the transpose of the matrix, turning a column vector into a row vector. 

Equations (`13`) to (`19`) are additional ones. Equations (`1.A`) and (`5.A`) replace equations (`1`) and (`5`) of *Model PC*, respectively. Nominal consumption in equation (`4`) and nominal government spending in equation (`8`) are redefined as $p_c \cdot c$ and $p_g \cdot g$, respectively. 

Using the hidden equation, **Figure 1** demonstrates that the model is watertight, while **Figure 2** illustrates that the evolution of consumption and disposable income towards the steady state exactly matches that of a standard (aggregative) SFC model. However, unlike a standard SFC model, Model IO-PC also allows for the accounting of the input-output structure of the economy (**Figure 3** and **Figure 4**) and the way prices are set (**Figure 5** and **Figure 6**).

<figure>
<img
src="https://github.com/marcoverpas/figures/blob/main/combined_anim_charts_2.gif" width="1000">
</figure>

*Note*: In principle, intermediate consumption can be included in the transactions-flow matrix by splitting the firm sector into three sub-sectors, corresponding to the three industries. However, as the number of industries increases, the transactions-flow quickly becomes cumbersome without adding much information of relevance to sectoral balances. This is because intermediate consumption is an internal exchange within the firm sector, so that the sub-sector entries cancel out at the end of the period. By contrast, cross-industry interdependencies are more appropriately analysed through the input-output table, which is designed to capture the technological structure of production.

The simplified input-output matrix of *Model 3IO-PC* is shown in **Table 3**.

#### Table 3. Simplified input-output matrix

|                                                | Agriculture (demand)             | Manufacturing (demand)             | Services (demand)                                  |  Final demand   |             Output              |
|:-----------------------                        |:--------------------:            |:--------------------:              |:--------------------:                              |:---------------:|:-------------------------------:|
|                                                |                                  |                                    |                                                    |                 |                                 |
| **Agriculture (production)**                   | \$p_1 \cdot a\_{11} \cdot x_1 \$ | \$p_1 \cdot a\_{12} \cdot x_2 \$   | \$p_1 \cdot a\_{13} \cdot x_3 \$                   | $p_1 \cdot d_1$ |         $p_1 \cdot x_1$         |
| **Manufacturing (production)**                 | \$p_2 \cdot a\_{21} \cdot x_1 \$ | \$p_2 \cdot a\_{22} \cdot x_2 \$   | \$p_2 \cdot a\_{23} \cdot x_3 \$                   | $p_2 \cdot d_2$ |         $p_2 \cdot x_2$         |
| **Services&nbsp;&nbsp; (production)**          | \$p_3 \cdot a\_{31} \cdot x_1 \$ | \$p_3 \cdot a\_{32} \cdot x_2 \$   | \$p_3 \cdot a\_{33} \cdot x_3 \$                   | $p_3 \cdot d_3$ |         $p_3 \cdot x_3$         |
| **Value added**                                |          $Y_1$                   |      $Y_2$                         |      $Y_3$                                         |       $Y$       |                                 |
| *- Labour income*                              | $WB_1 = w \cdot x_1 / pr_1$      | $WB_2 = w \cdot x_2 / pr_2$        |  $WB_3 = w \cdot x_3 / pr_3$                       |      $WB$       |                                 |
| *- Capital income*                             |        $PF_1 = Y_1 - WB_1$       |      $PF_2 = Y_2 - WB_2$           |           $PF_3 = Y_3 - WB_3$                      |      $PF$       |                                 |
| **Output**                                     |   $p_1 \cdot x_1$                |   $p_2 \cdot x_2$                  |   $p_3 \cdot x_3$                                  |                 | $\mathrm{p}^T \cdot \mathrm{x}$ |

*Note*: The main `R` code for developing Model *3IO-PC* and conducting experiments can be found [here](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/0_3IO-PC-Model.R).
The code needed to generate *Table 3* can be accessed [here](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/4_IO_Table.R).

**Table 3** illustrates cross-industry interdependencies in a simplified economy where two products are produced using the same products and labour.

*Note*: Since there are no taxes (or subsidies) on products and incomes are only calculated at the aggregate level, industry-specific value added figures ($Y_1$, $Y_2$ and $Y_3$) are derived residually (as the difference between total output and the value of inputs employed in each industry).

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

### 2.3 - Model ECO-3IO-PC

Although the origins of ecological macroeconomics can be traced back to the inception of economics itself, early SFC models for economic research did not incorporate the ecosystem. This gap was bridged in the late 2010s (e.g., Dafermos et al. [2017](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references), [2018](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references); and [Jackson and Victor, 2015](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)). The primary characteristic of ecological SFC models is their integration of monetary variables (following [Godley and Lavoie, 2007](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)) with physical variables (in line with [Georgescu-Roegen, 1971](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)) in a consistent manner. Several ECO-SFC models have been developed since then.

Here we consider a simple extension of *Model 3IO-PC*, named *Model ECO-3IO-PC*, where **ECO** stands for "ecological". Additional assumptions are as follows:

1. There are 2 types of reserves: matter and energy

1. There are 2 types of energy: renewable and non-renewable

1. Resources are converted into reserves at a certain rate

1. Industrial CO<sub>2</sub> emissions are associated with the use of non-renewable energy

1. Atmospheric temperature is a growing function of CO<sub>2</sub> emissions

1. All goods can be durable or non-durable

1. A share of durable goods (hence socio-economic stock) is discarded in every period

1. Both waste and emissions are produced only by the firm sector

Behavioural equations draw inspiration from the works of [Dafermos, Nikolaidi, and Galanis (2016, 2018)](https://define-model.org/). The main code of Model ECO-IO-PC is available [here](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/1_ECO-3IO-PC-Model.R). New variables and coefficients are defined between line 94 and line 133. The blocks providing the additional equations for the ecosystem are those included between line 251 and 334.

Firstly, extractions of matter and waste are modelled.

Production of *material goods*:

$$ x_{mat} = **\text{m}_{mat}^T** \cdot **\text{x}** \quad \text{(20)} $$

where $\text{m}_{mat}$ is the vector of material intensity coefficients by industry.

*Extraction* of matter:

$$mat = x_{mat} - rec \quad \text{(21)} $$

*Recycled* matter:

$$rec = \rho_{dis} \cdot dis \quad \text{(22)} $$

where $\rho_{dis}$ is the recycling rate of discarded products.

*Discarded* socioeconomic stock:  

$$dis = **\text{m}_{mat}^T** \cdot (**\text{z}_{dc}** \odot **\text{dc}_{-1}**) \quad \text{(23)} $$

where $\text{z}_{dc}$ is the vector defining the percentages of discarded socio-economic stock by industry.

Stock of *durable goods*:

$$ **\text{dc}** = **\text{dc}_{-1}** + **\text{B}_c** \cdot c - **\text{z}_{dc}** \cdot **\text{dc}_{-1}** \quad \text{(24)} $$

*Socioeconomic stock*:

$$k_h = k_{h,-1} + x_{mat} - dis \quad \text{(25)} $$

*Waste*:

$$wa = mat - (k_h - k_{h,-1}) \quad \text{(26)} $$

Secondly, energy use and CO<sub>2</sub> emissions are considered.

*Total energy* required for production:

$$en = **\text{e}_{en}^T** \cdot **\text{x}** \quad \text{(27)} $$

where $\text{e}_{en}$ is the vector that defines the energy intensity coefficients by industry.

*Renewable* energy at the end of the period:

$$ren = **\text{e}_{en}^T** \cdot (**\text{a}_{en}** \odot **\text{x}** )    \quad \text{(28)}      $$

where $\text{a}_{en}$ is the vector that defines the industry-specific shares of renewable energy to total energy.

*Non-renewable* energy:

$$nen = en - ren \quad \text{(29)} $$

Annual flow of *CO<sub>2</sub> emissions*:

$$emis = \beta_{e} \cdot nen \quad \text{(30)} $$

where $\beta_{e}$ is the CO<sub>2</sub> intensity coefficient of non-renewable energy sources.

*Cumulative* emissions:

$$co2_{cum} = co2_{cum,-1} + emis \quad \text{(31)} $$

Atmospheric *temperature*:

$$temp = \frac{1}{1-fnc} \cdot tcre \cdot co2_{cum} \quad \text{(32)} $$

where $fnc$ is the non-CO<sub>2</sub> fraction of total anthropocentric forcing and $tcre$ is the transient climate response to cumulative carbon emissions.

Thirdly, the dynamics of reserves is modelled.

Stock of *matter reserves*:

$$k_m = k_{m,-1} + conv_m - mat \quad \text{(33)} $$

Matter resources *converted* to reserves:

$$conv_m = \sigma_{m} \cdot res_m \quad \text{(34)} $$

where $\sigma_{m}$ is the conversion rate of matter resources into reserves.

Stock of *matter resources*:

$$res_m = res_{m,-1} - conv_m \quad \text{(35)} $$

*Carbon mass* of non-renewable energy:

$$cen = \frac{emis}{car} \quad \text{(36)} $$

where $car$ is the coefficient converting $Gt$ of carbon into $Gt$ of CO<sub>2</sub>.

Mass of *oxygen*:

$$o2 = emis - cen \quad \text{(37)} $$

Stock of *energy reserves*:

$$k_e = k_{e,-1} + conv_e - en \quad \text{(38)} $$

Energy resources *converted* to reserves:

$$conv_e = \sigma_e \cdot res_e \quad \text{(39)} $$

where $\sigma_e$ is the conversion rate of energy resources into reserves.

Stock of *energy resources*:

$$res_e = res_{e,-1} - conv_e \quad \text{(40)} $$

Lastly, feedback effects and damages can be introduced. Here the assumption is made that the propensity to consume out of income is (negatively) influenced by climate change.

New *propensity to consume* out of income:

$$\alpha_1 = \alpha_{10} - \alpha_{11} \cdot r_{-1} - \alpha_{12} \cdot \Delta temp \quad \text{(12.A)} $$

where $\alpha_{12}$ is a positive coefficient.

The related physical constraints (used to define ecosystem identities) are displayed by **Table 4** and **Table 5**, in which matter is expressed in $Gt$ and energy is expressed in $EJ$. 

#### Table 4. Physical flow matrix

|                               |*Matter*        |*Energy*        |
|:------------------------------|:------------:  |:--------------:|
|                               |                |                |
|**INPUTS**                     |                |                |
|Extracted matter               |$$mat$$         |                |
|Recycled socio-economic stock  |$$rec$$         |                |
|Renewable energy               |                |$$ren$$         |
|Non-renewable energy           |$$cen$$         |$$nen$$         |
|Oxygen                         |$$o2$$          |                |
|                               |                |                |
|**OUTPUTS**                    |                |                |
|Industrial CO2 emissions       |$$-emis$$       |                |
|Discarded socio-economic stock |$$-dis$$        |                |
|Dissipated energy              |                |$$-nen$$        |
|Change in socio-economic stock |$$-\Delta k_h $$|                |
|                               |                |                |
|**TOTAL**                      |0               |0               |


#### Table 5. Physical stock-flow matrix

|                                     |*Matter*     |*Energy*     |*CO<sub>2</sub>* |*SES*       |
|:------------------------------------|:----------: |:----------: |:----------:     |:----------:|
|                                     |             |             |                 |            |
|**INITIAL STOCK**                    |$$k_{m,-1}$$ |$$k_{e,-1}$$ |$$co2_{cum,-1}$$ |$$k_{h,-1}$$|
|Resources converted into reserves    |$$conv_m$$   |$$conv_e$$   |                 |            |
|CO<sub>2</sub> emissions             |             |             |$$emis $$        |            |
|Production of material goods         |             |             |                 |$$x_{mat} $$|
|Extraction of matter / use of energy |$$-mat$$     |$$-en $$     |                 |            |
|Destruction of socio-economic stock  |             |             |                 |$$-dis$$    |
|**FINAL STOCK**                      |$$k_m$$      |$$k_e$$      |$$co2_{cum}$$    |$$k_h$$     |

*Note*: The code needed to generate **Table 4** and **Table 5** can be accessed [here](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/8_Mat_En_Tables.R).

Once again, the model is simulated over a 100-period time span. In addition to economic, financial, and industrial variables, the new code for *Model ECO-3IO-PC* also tracks environmental variables, such as matter and energy reserves (**Figure 7**), CO<sub>2</sub> emissions (**Figure 8** and **Figure 9**), and atmospheric temperature (**Figure 10**).

<figure>
<img
src="https://github.com/marcoverpas/figures/blob/main/combined_anim_charts_7_10.gif" width="1000">
</figure>

Note that the behaviour of the economy is qualitatively unchanged relative to *Model 3IO-PC*, except for the effect of rising temperature on consumption.

Lastly, the physical flow relations and the physical stock-flow structure of the model can be visualised, for each period, using Sankey diagrams:

<figure>
<img
src="https://github.com/marcoverpas/figures/blob/main/sankey_mat_en.png" width="800">
</figure>

The related code is available [here](https://github.com/marcoverpas/keynote_speech_Florence/blob/main/6_Sankey_Mat_En.R). Note: while the diagrams above depict the aggregate economy, they can be easily adapted to apply to individual industries.

---

## 3 - Playing with the Model

One of the advantages of creating formal models using `R` is that they can be conveniently converted into online interactive models using the `Shiny` package. 

[![Open Shiny App](https://img.shields.io/badge/Launch-Shiny_App-blue?style=for-the-badge&logo=r)](https://x52gnt-marco-passarella.shinyapps.io/eco_3io_sfc_model/)

<figure>
<a href="https://x52gnt-marco-passarella.shinyapps.io/eco_3io_sfc_model/" target="_blank">
<img src="https://raw.githubusercontent.com/marcoverpas/figures/main/laboratory.png" width="1000">
</a>
</figure>
<br><br>

Click the link above (or the figure) to open the simulation laboratory for *Model ECO-3IO-PC*.

---

## 4 - Additional Experiments

The ecological transition is commonly understood as the shift towards a more sustainable economy and society. This entails moving from a linear economic model - characterised by extraction, production, consumption, and disposal - to a circular economy (CE) that emphasises reuse, repair, and recycling. Following [Aguilar-Hernandez et al. (2018)](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references), CE can be categorised in terms of:

- Closing supply chains (CSC)

- Enhancing resource efficiency (RE)

- Managing residual waste (RWM)

- Extending product lifetimes (PLE)

Despite its simplicity, *Model ECO-3IO-PC* enables the simulation of scenarios related to each of these CE interventions. These can be conveniently represented as combinations of changes in the values of coefficients and exogenous variables ([Fevereiro et al. 2024](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references)).

For example, PLE interventions can be conceptualised as a combination of increased product durability and a reduced discarding rate of durable goods, potentially stimulated by higher government expenditure - such as incentives offered to firms and consumers. In a more complex model incorporating fixed capital, PLE would also be associated with a lower depreciation rate of that capital.

Similarly, CSC interventions can be modelled by assuming that inputs produced from virgin raw materials are progressively replaced with inputs derived from reprocessed secondary materials, which entails changes in technical coefficients, an increase in the recycling rate and a reduction in the extraction rate. Once again, these interventions can be triggered or fostered by the government through increased spending or targeted tax cuts.

[![Open Shiny App](https://img.shields.io/badge/Launch-Shiny_App-blue?style=for-the-badge&logo=r)](https://x52gnt-marco-passarella.shinyapps.io/eco_3io_additional_experiments/)

<figure>
<a href="https://x52gnt-marco-passarella.shinyapps.io/eco_3io_additional_experiments/" target="_blank">
<img src="https://raw.githubusercontent.com/marcoverpas/figures/main/laboratory_experiments.png" width="1000">
</a>
</figure><br><br>

Click the link above (or the figure) to launch the additional experiments with *Model ECO-3IO-PC*.

---

## 5 - More Advanced Models

Simplified though it is, *Model ECO-3IO-PC* can serve as a foundation for more sophisticated models. Recent examples include the one being developed by [Fevereiro et al. (2024)](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references) and the one by [Veronese Passarella (2025b)](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references). A short description of each is provided below. 

### 5.1 - Circular Economy Interventions in a 2-Area World Economy Model

Using an open-economy ecological 54IO-SFC model calibrated for the European Union and the rest of the world, [Fevereiro et al. (2024)](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references) show that CE interventions in the former have significant impacts on the latter. Moreover, trade-offs between social, economic, and environmental targets are unavoidable, thus requiring some form of democratic planning of policy decisions.  

<figure>
<a href="https://just2ce.eu/wp-content/uploads/2024/11/Attachment_D5.3.pdf" target="_blank">
<img
src="https://github.com/marcoverpas/figures/blob/main/fevereiro_2024.png" width="1000">
</figure>

### 5.2 - Assessing Green Transition Policies 

Using an ecological 20IO-SFC model calibrated for Italy, [Veronese Passarella (2025b)](https://github.com/marcoverpas/keynote_speech_Florence/tree/main?tab=readme-ov-file#references) shows that the transition to an economy based on renewable energy sources can take time (because of rebound effects) and is likely to have uneven effects on different social groups.  

<figure>
<a href="https://www.marcopassarella.it/en/an-io-sfc-model-for-the-italian-economy-2/" target="_blank">
<img
src="https://github.com/marcoverpas/figures/blob/main/madme_figures_web.png" width="1000">
</figure>

---

## 6 - Final remarks 

The prototype *Model ECO-3IO-PC* presented here is not intended as a fully fledged policy tool, but rather as a transparent and adaptable framework for exploring the interplay between industrial structure, financial dynamics, and ecological constraints. By integrating the industrial detail of IO analysis with the dynamic and accounting coherence of SFC modelling, it allows for richer analyses of ecological transition pathways than either approach can provide in isolation.

While the model’s simplicity is deliberate, its modular design means it can be progressively extended - for example, by introducing additional sectors, industries, regions, behavioural equations, or more complex representations of technological change and environmental feedbacks. The aim is to offer early-career researchers, students, and policymakers an accessible starting point from which to test hypotheses, compare transition strategies, and assess their socio-economic and environmental implications over time.

Ultimately, the ecological transition is not merely a technical challenge, but a systemic transformation involving production, finance, institutions, and the biosphere. Hybrid IO-SFC models such as *Model ECO-3IO-PC* can help to make these interdependencies explicit, support informed debate, and guide the design of policies that are both economically viable and ecologically sustainable.

---

## References

- Aguilar-Hernandez, G. A., Sigüenza-Sanchez, C. P., Donati, F., Rodrigues, J. F., and Tukker, A. (2018). [**Assessing circularity interventions: a review of EEIOA-based studies**](https://journalofeconomicstructures.springeropen.com/articles/10.1186/s40008-018-0113-3). *Journal of Economic Structures*, 7(14): 1-24.

- Carnevali, E., Deleidi, M., Pariboni, R., and Veronese Passarella, M. (2019). [**SFC dynamic models: features, limitations and developments**](https://link.springer.com/book/10.1007/978-3-030-23929-9). In: P. Arestis and M. Sawyer (eds.), *Frontiers of Heterodox Economics, Series: International Papers in Political Economy*, Palgrave Macmillan, pp. 223-276.

- Dafermos, Y., Nikolaidi, M., and Galanis, G. (2017). [**A stock-flow-fund ecological macroeconomic model**](https://www.sciencedirect.com/science/article/pii/S0921800916301343). *Ecological Economics*, 131: 191-207.

- Dafermos, Y., Nikolaidi, M., and Galanis, G. (2017). [**Climate Change, Financial Stability and Monetary Policy**](https://doi.org/10.1016/j.ecolecon.2018.05.011). *Ecological Economics*, 152: 219-234.

- Fevereiro, J. B. R. T., Genovese, A., Valles Codina, O., and Veronese Passarella, M. (2024). [**Scenario Analysis. Policy Briefs**](https://just2ce.eu/wp-content/uploads/2024/11/Attachment_D5.3.pdf). JUST2CE Project, D5.3.

- Fevereiro, J. B. R. T., Genovese, A., Purvis, B., Valles Codina, O., and Veronese Passarella, M. (2025). [**Macroeconomic Models for Assessing the Transition towards a Circular Economy: A Systematic Review**](https://doi.org/10.1016/j.ecolecon.2025.108669). *Ecological Economics*, Vol. 236, 108669.

- Georgescu-Roegen, N. (1971). [**The Entropy Law and the Economic Process**](http://dx.doi.org/10.4159/harvard.9780674281653). Harvard University Press.

- Godley, W., and Lavoie, M. (2007). [**Monetary Economics: An Integrated Approach to Credit, Money, Income, Production and Wealth**](https://link.springer.com/book/10.1007/978-1-137-08599-3). Palgrave Macmillan. Chapters 1-4.

- Hardt, L., and O'Neill, D. W. (2017). [**Ecological Macroeconomic Models: Assessing Current Developments**](https://doi.org/10.1016/j.ecolecon.2016.12.027). *Ecological Economics*, 134: 198-211.

- Jackson, T., and Victor P. A. (2015). [**Does credit create a ‘growth imperative’? A quasi-stationary economy with interest-bearing debt**](https://www.sciencedirect.com/science/article/abs/pii/S0921800915003766). *Ecological Economics*, 120: 32-48.

- Miller, R. E., and Blair, P. D. (2009). [**Input-Output Analysis: Foundations and Extensions**](https://www.cambridge.org/core/books/inputoutput-analysis/69827DA658E766CD1E17B1A47BA2B9C3). Cambridge University Press, 2nd edition. Chapters 1-2.

- Nikiforos, M., and Zezza, G. (2017). [**Stock-flow Consistent Macroeconomic Models: A Survey**](https://doi.org/10.1111/joes.12221). *Journal of Economic Surveys*, 3(5): 1204-1239.

- Rivera, G.L., Malliet, P., Saussay, A., and Reynes, F. (2018). [**The State of Applied Environmental Macroeconomics**](https://sciencespo.hal.science/hal-03443474/file/8-157-2018-the-state-of-applied-environmental-macroeconomics-glandarivera.pdf). *Revue de l'OFCE*, 157(3): 133-149.  

- Thomsen, S. F., Raza, H., and Byrialsen, M. R. (2025). [**An assessment of carbon taxation policies: The case of Denmark**](https://doi.org/10.1016/j.ecolecon.2025.108741). *Ecological Economics*, 238, 108741. 

- Veronese Passarella, M. (2024). [**Notes for the 17th EAEPE Summer School**](https://github.com/marcoverpas/EAEPE_summer_school_2024). GitHub Repository.

- Veronese Passarella, M. (2025a). [**Issues in Monetary Policies and Monetary Circuits**](https://github.com/marcoverpas/PhD_Lectures_Macerata_2025). GitHub Repository, Sections B1–B5.

- Veronese Passarella, M. (2025b). [**An Empirically Calibrated IO-SFC Model for Assessing Green Transition Policies in Italy**](https://www.marcopassarella.it/en/an-io-sfc-model-for-the-italian-economy-2/), working paper presented at MADME Conference, Venice, 29-30 May 2025.
