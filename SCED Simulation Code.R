library(scan)
library(ggplot2)

# -------------------------------------------------------
# Simulated Multiple Baseline SCED: Imagery Rescripting
#
# Outcome: Memory distress (SUDS 0-100), measured each session
# Design: Multiple baseline across 3 participants
# Phase A = baseline (repeated distress ratings before ImRs)
# Phase B = intervention (distress ratings during ImRs sessions)
#
# Staggered baselines (5, 7, 9 sessions) are the core of the
# multiple baseline logic: if distress declines only when
# the intervention starts for each specific participant,
# time and maturation are ruled out as explanations.
# -------------------------------------------------------

set.seed(42)
simulate_participant <- function(n_baseline, n_intervention, 
                                 baseline_mean = 80, 
                                 intervention_start = 70,
                                 intervention_end = 15) {
  baseline <- round(rnorm(n_baseline, mean = baseline_mean, sd = 4))
  intervention <- round(seq(intervention_start, intervention_end, 
                            length.out = n_intervention) + 
                          rnorm(n_intervention, mean = 0, sd = 4))
  c(baseline, intervention)
}

p1 <- scdf(
  values = simulate_participant(n_baseline = 5, n_intervention = 8),
  phase_design = c(A = 5, B = 8),
  name = "Participant 1"
)

p2 <- scdf(
  values = simulate_participant(n_baseline = 7, n_intervention = 8),
  phase_design = c(A = 7, B = 8),
  name = "Participant 2"
)

p3 <- scdf(
  values = simulate_participant(n_baseline = 9, n_intervention = 8),
  phase_design = c(A = 9, B = 8),
  name = "Participant 3"
)

mb_design <- combine(p1, p2, p3)
print(mb_design)

# 1. Descriptive statistics by phase
describe(mb_design)

# 2. Visual analysis
suppressWarnings(
  plotSC(mb_design,
         ylab = "Memory Distress (SUDS 0-100)",
         xlab = "Session",
         main = "Multiple Baseline SCED: Imagery Rescripting")
)

# 3. Overlap indices
overlap(mb_design)

# 4. Tau-U effect size
tau_u(mb_design)

# 5. Hierarchical piecewise linear model
hplm(mb_design)