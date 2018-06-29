# Pre-loaded data info
# path describes where to find the data
# varnames are the Phase identifier variable name, Outcome variable name, and then any number of clustering variable names
# phase vals are the values corresponding to the baseline and treatment phase, respectively
# direction describes direction type
# direction_var is the name of the variable that applies the direction.

example_list <- c("McKissick et al. (2010)" = "McKissick", "Schmidt (2007)" = "Schmidt2007")

exampleMapping <- list(
  Schmidt2007 = list(condition = "Condition",
                     outcome = "Outcome",
                     cluster_vars = c("Case_pseudonym", "Behavior_type", "Phase_num"),
                     phase_vals = c("A", "B"),
                     direction = "series",
                     direction_var = "direction",
                     session_num = "Session_number",
                     scale = "series",
                     scale_var = "Metric",
                     intervals = "n_Intervals",
                     observation_length = "Session_length"),
  McKissick = list(condition = "Condition",
                   outcome = "Outcome",
                   cluster_vars = "Case_pseudonym",
                   phase_vals = c("A", "B"),
                   direction = "decrease",
                   session_num = "Session_number",
                   scale = "all percentage",
                   intervals = NA,
                   observation_length = NA)
  
)