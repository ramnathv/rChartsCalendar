plotCalMap <- function(x, y, data, domain, start, ...){
  r1 <- rCharts$new()
  r1$setLib(system.file('calmap', package = 'rChartsCalendar'))
  data[x] <- as.numeric(as.POSIXct(data[[x]]))
  dat <- setNames(as.list(data[[y]]), data[[x]])
  r1$set(
    data = dat, 
    domain = domain, 
    start = start,
    ...
  )
  return(r1)
}
