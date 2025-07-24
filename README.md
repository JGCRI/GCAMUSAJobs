# GCAMUSAJobs: An R package for employment projections based on GCAM-USA power sector outcomes

<br />

<!-------------------------->
<!-------------------------->
# <a name="Contents"></a>Contents
<!-------------------------->
<!-------------------------->

- [Citation](#Citation)
- [Key Links](#KeyLinks)
- [Related Publications](#RelatedPublications)
- [Overview](#Overview)
- [Installation Guide](#InstallGuides)
- [How-to Guides](#How-toGuides)
- [User Notice](#UserNotice)

<br />

<!-------------------------->
<!-------------------------->
# <a name="Citation"></a>Citation
<!-------------------------->
<!-------------------------->

Di Sheng, Brian O'Neill, Stephanie Waldhoff, Matthew Binsted, and Ying Zhang. 2025. GCAMUSAJob: 
An R package for employment projections based on GCAM-USA power sector outcomes. 
(In progress) *Journal of Open Source Software*, DOI: XXXX

[Back to Contents](#Contents)

<br />

<!-------------------------->
<!-------------------------->
# <a name="KeyLinks"></a>Key Links
<!-------------------------->
<!-------------------------->

GitHub Repo: https://github.com/JGCRI/GCAMUSAJobs

Website: https://jgcri.github.io/GCAMUSAJobs/

[Back to Contents](#Contents)

<br />

<!-------------------------->
<!-------------------------->
# <a name="RelatedPublications"></a>Related Publications
<!-------------------------->
<!-------------------------->

Kennedy, K.M., S. Vo, K. Vangelov, B. Buddi, S. Smith, J. Lou, R. Cui, and N. Hultman (2024). 
“The Renewable Energy Transition in Maryland: Implications for Energy Generating Facilities and Small Businesses.” 
Center for Global Sustainability, University of Maryland. 50 pp. [Link](https://mde.maryland.gov/programs/air/ClimateChange/MCCC/Doclib_EIR/The%20Renewable%20Energy%20Transition%20in%20Maryland,%20Energy%20Industry%20Revitalization%20Working%20Group%20--%20Report_Final.pdf)

[Back to Contents](#Contents)

<br />

<!-------------------------->
<!-------------------------->
# <a name="Overview"></a>Overview
<!-------------------------->
<!-------------------------->

`GCAMUSAJobs` aims to provide employment projections for the power sector based on GCAM-USA output. 
Specifically, this package was developed to post-process electric power projections from [GCAM-USA](https://jgcri.github.io/gcam-doc/gcam-usa.html), 
enabling the estimation of future power sector jobs at the state-level by generation technology and job type. Currently, GCAM-USA does not calculate 
power sector jobs. `GCAMUSAJobs` extends GCAM-USA functionality by 
(1) estimating the power plant capacity levels of different activities – operational capacity, capacity addition, and retirement; and 
(2) calculating jobs associated with those activities, including jobs in operation and maintenance (O&M), construction, and decommissioning. 

<div style="text-align: center">
  <img src="man/figures/workflow.jpg" width="100%">
  <p><em>Workflow of GCAMUSAJobs</em></p>
</div>

<br />

`GCAMUSAJobs` utilizes GCAM-USA annual electricity generation outputs to estimate underlying capacity levels based on assumptions about capacity factors 
and calculate associated power sector jobs based on employment factors. The employment factor represents the average number of jobs created per unit of 
power plant activity (e.g., jobs per gigawatt). This method is widely used in the relevant literature<sup>1,2</sup>. `GCAMUSAJobs` adopts employment factors from 
NREL’s Jobs & Economic Development Impacts [(JEDI)](https://www.nrel.gov/analysis/jedi/models.html) model, which has been broadly used in the literature<sup>1,3,4</sup>. 
The tool focuses on estimating direct jobs in the power sector, meaning employment directly involved in the construction, operation, or decommissioning 
of power plants, as opposed to indirect or induced jobs in the broader economy.

This functionality supports the need for assessing the distributional labor impacts of energy system transition. 

[Back to Contents](#Contents)

<br />

<!-------------------------->
<!-------------------------->
# <a name="InstallationGuides"></a>Installation Guides
<!-------------------------->
<!-------------------------->

1. Download and install:

    - R (https://www.r-project.org/)
    - R studio (https://www.rstudio.com/)

2. Open R studio:

```
install.packages('devtools')
devtools::install_github('JGCRI/rgcam')
devtools::install_github('JGCRI/GCAMUSAJobs')
```

[Back to Contents](#Contents)

<br />

<!-------------------------->
<!-------------------------->
# <a name="How-toGuides"></a>How-to Guides
<!-------------------------->
<!-------------------------->

See [Package vignette](https://jgcri.github.io/GCAMUSAJobs/articles/package_vignette.html) for a step-by-step demonstration of how to use the package. 
In general, this package generates data tables and visualizations related to power generation and job impacts using GCAM-USA model outputs. The workflow 
proceeds through a series of functions, each building on the output of the previous one. Here are the key processing functions:

| Function   | Purpose                                                                                                                                                                                                                                                                          |
|------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| GCAM_EJ()  | Takes GCAM-USA output as input and calculates average annual electricity generation (in exajoules or EJ), broken down by state, fuel type, technology, and activity.                                                                                                             |
| GCAM_GW()  | Converts the output of GCAM_EJ() into average annual capacity levels (in gigawatts or GW) by state, fuel, technology, and activity (e.g., operation, addition, retirement). Supports both the “Total” and “Net” methods for dealing with simultaneous additions and retirements. |
| GCAM_JOB() | Uses GCAM_GW() results to compute average annual direct job estimates, disaggregated by state, fuel type, and job type (e.g., construction, O&M, decommissioning). Users can select between the “Total” or “Net” methods (default is “Total”).                                   |

*Details on Methods can be found [here](https://jgcri.github.io/GCAMUSAJobs/articles/methods.html).*

<br />

Here are the key visualization functions:

| Function        | Description                                                                                                                                                                                                                                            |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PLOT_EF()       | Plots annual average employment factors (EFs) during the project period. Assumes 5-year decommissioning periods for all fuels, while construction durations vary across fuels. O&M EFs are shown on an annual basis during the lifetime of a facility. |
| PLOT_GW()       | Plots average annual capacity levels by activity and fuel type over years. Uses the output from GCAM_GW().                                                                                                                                             |
| PLOT_JOB()      | Plots average annual direct power sector jobs by fuel and job type over years. Uses GCAM_JOB() output.                                                                                                                                                 |
| PLOT_JOB_TYPE() | Plots direct jobs by job type (e.g., construction, O&M) aggregated across all fuels for a selected year.                                                                                                                                               |
| MAP_JOB()       | Plots a map of state-level total power sector direct jobs for a selected year.                                                                                                                                                                         |

*Note that all of these PLOT_ functions will produce results either for an individual state or for the U.S. as a whole.*

[Back to Contents](#Contents)

<br />

<!-------------------------->
<!-------------------------->
# <a name="UserNotice"></a>User Notice
<!-------------------------->
<!-------------------------->

`GCAMUSAJobs`, by default, works with GCAM-USA v7.1, and is compatible with GCAM v6 or later versions conditional on updated [GCAM-USA assumption input](https://jgcri.github.io/GCAMUSAJobs/articles/methods.html) 
(e.g., plant retirement assumptions), as this package uses three main inputs: GCAM-USA model outputs, GCAM-USA input data and assumptions, and 
employment factors from the JEDI model. More details can be found [here](https://jgcri.github.io/GCAMUSAJobs/articles/user_notice.html).

[Back to Contents](#Contents)

<br />
_________

1.	Rutovitz, J., Dominish, E. & Downes, J. Calculating global energy sector jobs: 2015 methodology. (2015).
2.	Mayfield, E., Jenkins, J., Larson, E. & Greig, C. Labor pathways to achieve net-zero emissions in the United States by mid-century. *Energy Policy* 177, 113516 (2023).
3.	Xie, J. J., Martin, M., Rogelj, J. & Staffell, I. Distributional labour challenges and opportunities for decarbonizing the US power system. *Nat. Clim. Change* 13, 1203–1212 (2023).
4.	Jacobson, M. Z. et al. 100% Clean and Renewable Wind, Water, and Sunlight All-Sector Energy Roadmaps for 139 Countries of the World. *Joule* 1, 108–121 (2017).

<br />
<br />
<br />
