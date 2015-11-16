setwd('C:/Users/mcoyne/Documents/R/basicTm/capstone/doc')

# Load packages
require(knitr)
require(markdown)

# create report file
knit("report.Rmd")
markdownToHTML("report.md", "report.html", options=c("use_xhml"))
system("pandoc -s report.html -o  report.pdf")
