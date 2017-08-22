library(data.table)  

source('download_raw_data.R')

#Download 5-year treasury notes
#get_data.f('https://www.quandl.com/api/v3/datasets/CME', 'FV', 'api_key=1i1Z713RZkzQTZNDGvdt')

#Download 10-year treasury notes
#get_data.f('https://www.quandl.com/api/v3/datasets/CME', 'TY', 'api_key=1i1Z713RZkzQTZNDGvdt')

#read data into df
files <- list.files(path = './raws',pattern = '.csv', full.names = TRUE)
temp <- lapply(files, fread, sep=',', header = TRUE)
data <- rbindlist( temp )

#Fix data types
data$Date <- as.Date(data$Date)
