% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/addGeoRaster.R
\name{addGeotiff}
\alias{addGeotiff}
\title{Add a GeoTIFF file to a leaflet map using optimised rendering.}
\usage{
addGeotiff(
  map,
  file = NULL,
  url = NULL,
  group = NULL,
  layerId = NULL,
  resolution = 96,
  bands = NULL,
  arith = NULL,
  project = TRUE,
  method = NULL,
  opacity = 0.8,
  options = leaflet::tileOptions(),
  colorOptions = NULL,
  rgb = FALSE,
  pixelValuesToColorFn = NULL,
  autozoom = TRUE,
  imagequery = TRUE,
  imagequeryOptions = NULL,
  ...
)
}
\arguments{
\item{map}{the map to add the raster data to.}

\item{file}{path to the GeoTIFF file to render.}

\item{url}{url to the GeoTIFF file to render. Ignored if \code{file} is provided.}

\item{group}{he name of the group this raster image should belong to.}

\item{layerId}{the layerId.}

\item{resolution}{the target resolution for the simple nearest neighbor interpolation.
Larger values will result in more detailed rendering, but may impact performance.
Default is 96 (pixels).}

\item{bands}{which bands to use in case of multi-band Geotiff.}

\item{arith}{an optional function to be applied to a multi-layer object.
Will be computed on-the-fly in the browser.}

\item{project}{if TRUE (default), automatically project x to the map projection
expected by georaster-layer-for-leaflet (EPSG:4326);
if FALSE, it's the caller's responsibility to ensure that \code{file} is already projected.}

\item{method}{character defining the resampling method to be used when
\code{project} is \code{TRUE}.
See \url{https://gdal.org/en/latest/programs/gdalwarp.html#cmdoption-gdalwarp-r} for
possible values.}

\item{opacity}{opacity of the rendered layer.}

\item{options}{options to be passed to the layer.
See \code{\link[leaflet]{tileOptions}} for details.}

\item{colorOptions}{list defining the palette, breaks and na.color to be used.}

\item{rgb}{logical, whether to render Geotiff as RGB.}

\item{pixelValuesToColorFn}{optional JS function to be passed to the browser.
Can be used to fine tune and manipulate the color mapping.
See examples & \url{https://github.com/r-spatial/leafem/issues/25} for
some examples.}

\item{autozoom}{whether to automatically zoom to the full extent of the layer.
Default is \code{TRUE}}

\item{imagequery}{If \code{TRUE} a leaflet control with the hovered/clicked
value will appear on the map.}

\item{imagequeryOptions}{additional options for the control panel.}

\item{...}{currently not used.}
}
\value{
A leaflet map object.
}
\description{
Add a GeoTIFF file to a leaflet map using optimised rendering.
}
\details{
This uses the leaflet plugin 'georaster-layer-for-leaflet' to render GeoTIFF data.
See \url{https://github.com/GeoTIFF/georaster-layer-for-leaflet} for details.
The GeoTIFF file is read directly in the browser using geotiffjs
(\url{https://geotiffjs.github.io/}), so there's no need to read data into
the current R session. GeoTIFF files can be read from the file system or via url.
The clue is that rendering uses simple nearest neighbor interpolation on-the-fly
to ensure smooth rendering. This enables handling of larger rasters than with
the standard \code{\link[leaflet]{addRasterImage}}.
}
\examples{
if (interactive()) {
  library(leaflet)
  library(leafem)
  library(stars)

  tif = system.file("tif/L7_ETMs.tif", package = "stars")
  x1 = read_stars(tif)
  x1 = x1[, , , 3] # band 3

  tmpfl = tempfile(fileext = ".tif")

  write_stars(st_warp(x1, crs = 4326), tmpfl)

  leaflet() \%>\%
    addTiles() \%>\%
    addGeotiff(
      file = tmpfl
      , opacity = 0.9
      , colorOptions = colorOptions(
        palette = hcl.colors(256, palette = "inferno")
        , na.color = "transparent"
      )
    )

}

}
