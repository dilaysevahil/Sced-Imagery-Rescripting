# sced-imagery-rescripting

Analysis and notes on Single-Case Experimental Design methods.

## Background

I came to SCED methodology from the other direction, my existing 
work uses EMA and temporal network analysis, both of which involve 
repeated within-person measurements over time. The data structure 
is the same. What SCED adds is experimental logic: you stagger when 
the intervention starts across participants, so if improvement only 
follows the intervention for each person specifically, you have a 
causal argument without needing a randomised sample.

For Imagery Rescripting research this matters. Treatment response 
varies a lot across individuals, clinical presentations, and memory 
types. Averaging across a group can obscure exactly the kind of 
within-person change trajectory that tells you something about how 
the intervention actually works.

The staggered baseline issue also connects directly to a limitation 
in my Master's thesis on prosocial behaviour and well-being, where 
sensitivity analyses flagged potential unmeasured confounding because 
the design couldn't establish temporal ordering at the individual 
level. SCED builds that ordering into the design itself.

## What's in here

### sced_imagery_rescripting_simulation.R

Simulated multiple baseline SCED across three participants. Outcome 
variable is memory distress on a 0-100 SUDS scale across baseline 
(Phase A) and Imagery Rescripting sessions (Phase B). Baselines are 
staggered at 5, 7, and 9 sessions.

Analyses: descriptive statistics by phase, visual analysis, overlap 
indices (PND, NAP, PEM), Tau-U effect sizes with meta-analytic 
summary, and a hierarchical piecewise linear model across all three 
cases simultaneously.

Tau-U values came out between -0.99 and -1.00 across participants 
(p < .001). The hplm slope in Phase B was -7.04 points per session 
(p < .001). The ICC of essentially zero reflects that the simulation 
used identical parameters across participants. A real dataset would 
show more between-person variance here, which would be the 
interesting part.

## Tools

R package `scan` v0.68.1 (Wilbert, 2026)  
https://jazznbass.github.io/scan-Book/

Vlaeyen, J. W. S., Onghena, P., Vannest, K. J., & Kratochwill, T. R. (2022). Single-Case Experimental Designs: Clinical Research and Practice. In Comprehensive Clinical Psychology, Second Edition (Vol. 3, pp. 1-28). Elsevier. https://doi.org/10.1016/B978-0-12-818697-8.00191-6

Krasny-Pacini, A., & Evans, J. (2017). Single-case experimental designs to assess intervention effectiveness in rehabilitation: A practical guide. Annals of Physical and Rehabilitation Medicine, 61(3), 164–179. https://doi.org/10.1016/j.rehab.2017.12.002

## Related repositories

[real_ema_analysis](https://github.com/dilaysevahil/real_ema_analysis)  
[temporal-symptom-network-practice](https://github.com/dilaysevahil/temporal-symptom-network-practice)
