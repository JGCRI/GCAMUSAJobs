library(testthat)
library(GCAMUSAJobs)


prj <- ReadGCAM(filetype = 'prj',
                input_path = system.file("extdata", package = "GCAMUSAJobs"),
                prj_name = "package.dat")
EJ_activity <- GCAM_EJ(prj)
elec_gen_activity <- EJ_activity$elec_gen_activity
GW_output <- GCAM_GW(EJ_activity)
GW_activity <- GW_output$GW_activity
JOB_activity <- GCAM_JOB(GW_output)
JOB_activity1 <- GCAM_JOB(GW_output, "Total")
JOB_activity2 <- GCAM_JOB(GW_output, "total")


test_that("GCAM_EJ function works", {
  testthat::expect_equal(colnames(elec_gen_activity), c("scenario", "region", "subsector", "technology", "Year", "Units",
                                    "value" , "activity", "capacity.factor", "fuel"))
})

test_that("GCAM_GW function works", {
  testthat::expect_equal(colnames(GW_activity), c("scenario", "region", "subsector", "technology", "Year", "Units",
                                    "value" , "activity", "capacity.factor", "fuel"))
})

test_that("GCAM_JOB function works", {
  testthat::expect_equal(colnames(JOB_activity), c("scenario", "region",  "Year", "fuel", "subsector", "Units",
                                                  "job", "value"))
})


test_that("GCAM_JOB function output by default use the 'Total' method", {
  testthat::expect_equal(JOB_activity, JOB_activity1)
})

test_that("The method argument of GCAM_JOB function is indifferent to the capitalization of the first letter", {
  testthat::expect_equal(JOB_activity2, JOB_activity1)
})


test_that("throw error message if the method argument of GCAM_JOB is invalid", {
  testthat::expect_error(GCAM_JOB(GW_activity, "123"))
})
