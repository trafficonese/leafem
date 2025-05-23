% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/file.R
\name{addTileFolder}
\alias{addTileFolder}
\title{Add raster tiles from a local folder}
\usage{
addTileFolder(
  map,
  folder,
  tms = TRUE,
  layerId = NULL,
  group = NULL,
  attribution = NULL,
  options = leaflet::tileOptions(),
  data = leaflet::getMapData(map)
)
}
\arguments{
\item{map}{a mapview or leaflet object.}

\item{folder}{the (top level) folder where the tiles (folders) reside.}

\item{tms}{whether the tiles are served as TMS tiles.}

\item{layerId}{the layer id.}

\item{group}{the group name for the tile layer to be added to \code{map}.}

\item{attribution}{the attribution text of the tile layer (HTML).}

\item{options}{a list of extra options for tile layers.
See \code{\link[leaflet]{tileOptions}} for details. When the tiles
were created with \code{gdal2tiles.py} argument \code{tms} needs to be
set to \code{TRUE}.}

\item{data}{the data object from which the argument values are derived;
by default, it is the data object provided to leaflet() initially,
but can be overridden.}
}
\description{
Add tiled raster data pyramids from a local folder that was created with
gdal2tiles.py (see \url{https://gdal.org/en/latest/programs/gdal2tiles.html} for details).
}
