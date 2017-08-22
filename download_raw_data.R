library(RCurl)
#library(XML)

get_data.f <- function(url, file_code, api_key){
  folder <- './raws'
  dir.create(file.path(folder), showWarnings = FALSE)
  contract_sysmbols <- c('H', 'M', 'U', 'Z')
  years <- rep(1989:2015)
  for(i in 1:length(contract_sysmbols)){
    for(year in years) {
      filename <- paste(file_code, contract_sysmbols[i], year, '.csv', sep = '')
      x <- paste(url, filename, sep = '/')
      x <- paste(x, api_key, sep = '?')
      filepath <- paste(folder, paste('CME-',filename, sep = ''), sep = '/')
      download.file(url = x,destfile = filepath, method = "wget")
    }
  }
}

