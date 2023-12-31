% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data-documentation.R
\docType{data}
\name{Schmidt2007}
\alias{Schmidt2007}
\title{Schmidt (2007)}
\format{
A data frame with 172 rows and 13 variables
}
\source{
Schmidt, A. C. (2007). The effects of a group contingency on group
  and individual behavior in an urban first-grade classroom.  Masters Thesis,
  University of Kansas, Department of Applied Behavioral Sciences. ProQuest
  Dissertations & Theses Global, thesis number 1443719.
  https://kuscholarworks.ku.edu/bitstream/handle/1808/32097/Schmidt_Anna_C_2007_5349292.pdf
}
\description{
Data from a study by Schmidt (2007). The variables are as
  follows:

  \itemize{ \item \code{Behavior_type}. Outcome measure description
  (disruptive behavior or on task behavior). \item \code{Procedure}. The
  observation recording procedure used to measure the outcome. \item
  \code{Metric}. The metric in which the outcome measurement is expressed
  ("count" for natural counts; "percentage" for percentage of intervals)
  \item \code{Session_length}. Length (in minutes) of the observation
  sessions \item \code{Interval_length}. If an interval method was used, the
  length of the intervals (in seconds); \code{NA} otherwise. \item
  \code{Case_Pseudonym}. Case Pseudonym provided by the authors. \item
  \code{Session_number}. Within-series session-number. \item \code{Phase}.
  Label for each unique phase (e.g., A1 is the first baseline phase, B2 is
  the second treatment phase). \item \code{Condition}. Label indicating
  whether the outcome is in the baseline (A) or treatment (B) phase. \item
  \code{Outcome}. Outcome measurement. \item \code{Phase_num}. Indicator for
  each pair of baseline and treatment phases. \item \code{direction}.
  Direction of therapeutic improvement for the outcome. \item
  \code{n_Intervals}. If an interval method was used, the total number of
  intervals; \code{NA} otherwise. }
}
\note{
Data were reconstructed from figures in the source document.
  Consequently, outcome measurements in this dataset include additional error
  from the reconstruction process and may not exactly match the original
  source data.

  In earlier versions of the package (0.5.0 and earlier), the
  \code{Case_Pseudonym} variable contained incorrect labels for each case,
  which did not match the labels in the source document. Specifically, Faith
  was incorrectly labeled as Albert; Lilly was incorrectly labeled as Faith;
  and Albert was incorrectly labeled as Lilly.
}
\keyword{datasets}
