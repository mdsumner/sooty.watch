#' Watch the new online data library
#'
#' @return data frame with summary of curated datasets
#' @export
#' @name watch
#' @aliases watch_buckets watch_curated
#' @examples
#' watch_curated()
watch_curated <- function() {
  dplyr::group_by(sooty:::.curated_objects(), .data$Dataset) |>
  dplyr::summarize(mindate = min(date),
                   maxdate = max(date),
                   n = dplyr::n()) |>
  dplyr::arrange(desc(maxdate))
}

#' @name watch
#' @export
watch_buckets <- function() {
  dplyr::group_by(sooty:::.objects() , .data$Bucket) |>
  dplyr::summarize(n = dplyr::n()) |>
  dplyr::arrange(desc(.data$n))
}
