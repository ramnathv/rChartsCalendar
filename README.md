## rChartsCalendar

This is an [rCharts](http://rcharts.io) binding for the excellent [Cal-Heatmap](http://kamisama.github.io/cal-heatmap/) plugin, developed by [Wan Qi Chen](https://github.com/kamisama). This binding was motivated by a tweet by [Alex Bresler](https://twitter.com/abresler/status/412314310782644224/photo/1) and uses data provided by him on points scored by Paul George.

You can install it from `github` using `devtools`.

```S
library(devtools)
install_github("ramnathv/rCharts@dev")
install_github("ramnathv/rChartsCalendar")
```

### Quick Start

Let us start with some data on points scored by Paul George.


```S
dat <- read.csv('http://t.co/mN2RgcyQFc')[,c('date', 'pts')]
library(rChartsCalendar)
r1 <- plotCalMap(x = 'date', y = 'pts',
  data = dat, 
  domain = 'month',
  start = "2012-10-27",
  legend = seq(10, 50, 10),
  itemName = 'point',
  range = 7
)
```

[![calmap1](http://i.imgur.com/abBCyk8.png)](http://rcharts.io/viewer/?7979341#.U430PJRdXAI).

Here is another example showing stock price of APPLE.

```S
library(quantmod)
getSymbols("AAPL")
xts_to_df <- function(xt){
  data.frame(
    date = format(as.Date(index(xt)), '%Y-%m-%d'),
    coredata(xt)
  )
}

dat = xts_to_df(AAPL)
plotCalMap('date', 'AAPL.Adjusted', 
  data = dat, 
  domain = 'month',
  legend = seq(500, 700, 40),
  start = '2014-01-01',
  itemName = '$$'
)
```

![apple](http://i.imgur.com/G5xvsFk.png)