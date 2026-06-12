
#' ReadGCAM
#'
#' @param filetype specify the input is a database (folder) or a project (.dat)
#' @param input_path specify the full path for the input file
#' @param db_name specify the database name
#' @param query use the default query file in the package "my_batch.xml"
#' @param scen_name specify the scenario name (this needs to match the scenario name specified in the DB)
#' @param prj_name specify the project (.dat) name either to name it or load the existed one
#'
#' @return a list to be called in other functions
#' @export
#'
#' @examples
#' \dontrun{
#' prj <- ReadGCAM(filetype = 'db',
#' input_path = "C:/GODEEP/GCAM7/output",
#' db_name = "database_basexdbGCAM-USA_Ref",
#' query = system.file("extdata", "my_batch.xml", package = "GCAMUSAJobs"),
#' scen_name = "GCAM-USA_Ref",
#' prj_name = "mydata.dat")
#' }

ReadGCAM <- function(filetype,
                     input_path = NULL, # full path of the input file/db folder or prj folder
                     db_name = NULL,    # name of the db folder
                     query = system.file("extdata", "my_batch.xml", package = "GCAMUSAJobs"),
                     scen_name = NULL,  # name of the scenario of interest
                     prj_name = NULL) { # name of the prj file

  # Check filetype
  if (missing(filetype) || is.null(filetype)) {
    stop("`filetype` is required. Please use either 'db' or 'prj'.", call. = FALSE)
  }

  if (!filetype %in% c("db", "prj")) {
    stop(
      "`filetype` must be either 'db' for a GCAM output database or 'prj' for an existing rgcam project. ",
      "Current input is: '", filetype, "'.",
      call. = FALSE
    )
  }

  # Check common required input
  if (is.null(input_path)) {
    stop("`input_path` is required.", call. = FALSE)
  }

  if (!dir.exists(input_path)) {
    stop("`input_path` does not exist: ", input_path, call. = FALSE)
  }

  # Read from GCAM output database
  if (filetype == "db") {

    if (is.null(db_name)) {
      stop("`db_name` is required when `filetype = 'db'`.", call. = FALSE)
    }

    if (is.null(scen_name)) {
      stop("`scen_name` is required when `filetype = 'db'`.", call. = FALSE)
    }

    if (is.null(prj_name)) {
      stop("`prj_name` is required when `filetype = 'db'`.", call. = FALSE)
    }

    if (query == "") {
      stop("The default query file was not found. Please provide a valid `query` file path.", call. = FALSE)
    }

    if (!file.exists(query)) {
      stop("The query file does not exist: ", query, call. = FALSE)
    }

    conn <- rgcam::localDBConn(input_path, db_name, migabble = TRUE)
    prj <- rgcam::addScenario(conn, prj_name, scen_name, query)

  } else {

    # Read from existing rgcam project
    if (is.null(prj_name)) {
      stop("`prj_name` is required when `filetype = 'prj'`.", call. = FALSE)
    }

    prj_path <- file.path(input_path, prj_name)

    if (!file.exists(prj_path)) {
      stop("The rgcam project file does not exist: ", prj_path, call. = FALSE)
    }

    prj <- rgcam::loadProject(prj_path)
  }

  return(prj)
}
