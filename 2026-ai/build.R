# Run from the project root: Rscript build.R
if (!requireNamespace("xaringan", quietly = TRUE)) {
  stop("Install required packages first: install.packages(c('xaringan', 'rmarkdown'))")
}
stopifnot(file.exists("index_files/remark-latest.min.js"))
rmarkdown::render("index.Rmd", encoding = "UTF-8", clean = TRUE)
