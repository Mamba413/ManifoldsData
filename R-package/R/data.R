#' @title orbit planet data
#' @name orbit
#' @docType data
#' @description
#' A orbit planet data include 9 records about the unit normals to orbital planes.
#'
#' @details
#' This orbit planet data containing 9 records about the unit normals to orbital planes.
#' The unit normals is (sin(a)sin(b), -cos(a)sin(b), cos(b)) where a is the the inclination of
#' the orbital plane of a planet to the ecliptic and b is the angle between a fixed line in the ecliptic
#' and the line joining the ascending node of the planet.
#'
#' @format
#' \itemize{
#' \code{nx}: the first coordinates of the unit normals to orbital planes
#'
#' \code{ny}: the second coordinates of the unit normals to orbital planes
#'
#' \code{ny}: the third coordinates of the unit normals to orbital planes
#' }
#'
NULL



#' @title skull data
#' @name skullnormal
#' @docType data
#' @description
#' A skull data include 124 records about the landmark of skull and demographics of healthy samples.
#'
#' @references
#' Patrangenaru, Victor, and Leif Ellingson. Nonparametric statistics on manifolds and their applications to object data analysis. CRC Press, 2015.
#'
#' @format
#' \itemize{
#' \code{skullnormal$x}: A data frame includes the landmark of skull
#'
#' \code{skullnormal$y}: A data frame includes the demographics such as months and gender.
#' }
#'
NULL
