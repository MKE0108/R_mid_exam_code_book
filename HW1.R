data <- read.csv("input1.csv", na.strings = "")
n_of_user <- nrow(data)
output_row_cnt <- 0
for (i in 1:n_of_user) {
    n_of_event <- sum(!is.na(data[i, 2:ncol(data)]))
    output_row_cnt <- output_row_cnt + n_of_event
    data[i, which(data[i, ] == "s")] <- 1
    data[i, which(data[i, ] == "e")] <- n_of_event
}
output <- data.frame(USERID = character(output_row_cnt), 
                     Time = numeric(output_row_cnt), 
                     Event = character(output_row_cnt))
names(output) <- c("USERID","Time","Event")
start_base <- 1
for (i in 1:n_of_user){
    n_of_event <- sum(!is.na(data[i,2:ncol(data)]))
    if (n_of_event == 0) next
    for(j in 1:n_of_event){
        output[start_base+j-1, "USERID"] <- data[i, "USERID"]
        output[start_base+j-1, "Time"] <- j
        output[start_base+j-1, "Event"] <- colnames(data)[which(data[i, ] == j)]
    }
    start_base <- start_base + n_of_event
}
write.csv(output, file = "output.csv", row.names = FALSE, quote = FALSE)
print(output)