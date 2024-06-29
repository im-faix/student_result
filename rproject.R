data <- read.csv("result.csv")
 print(data)
high_achievers <- data[data$Percentage >80, ]
cat("\nThe Names of the Students those percentage is greater than 80%\n")
print(high_achievers)
passed_students <- data[data$Status == 'Pass', ]
cat("\nList of All Passed Students\n") 
print(passed_students)
failed_students <- data[data$Status == 'Fail', ]
cat("\nList of all Failed Students\n") 
print(failed_students)
topper_sub1 <- data[which.max(data$Subject.1), ]
cat("\nName of student who got maximum marks in Subject 1:\n")
print(topper_sub1)
topper_sub2 <- data[which.max(data$Subject.2), ]
cat("\nName of student who got maximum marks in Subject 2:\n")
print(topper_sub2)
topper_sub3 <- data[which.max(data$Subject.3), ]
cat("\nName of student who got maximum marks in Subject 3:\n")
print(topper_sub3)
 library(dplyr)
data_sorted1 <- data %>% arrange(desc(Subject.1))
 top_5_sub1 <- data_sorted1[1:5, ]
cat("\nTop 5 students who scored Maximum in Subject 1:\n") 
print(top_5_sub1)
data_sorted2 <- data %>% arrange(desc(Subject.2))
 top_5_sub2 <- data_sorted2[1:5, ]
cat("\nTop 5 students who scored Maximum in Subject 2:\n") 
print(top_5_sub2)
data_sorted3 <- data %>% arrange(desc(Subject.3))
 top_5_sub3 <- data_sorted3[1:5, ]
cat("\nTop 5 students who scored Maximum in Subject 3:\n") 
print(top_5_sub3)
pass_sort <- passed_students[order(-passed_students$Percentage), ]
 top_10 <- head(pass_sort,10)
cat("\nThe Top 10 Students\n ")
print(top_10)
par(mfrow = c(2, 2))
subject_1 <- data$Subject.1
pie(subject_1,labels = data$Name, main = "Subject 1 Distribution", col=terrain.colors(length(subject_1)))
subject_2 <- data$Subject.2
pie(subject_2 ,labels = data$Name, main= "Subject 2 Marks Distribution",col=rainbow(length(subject_2)))
subject_3 <- data$Subject.3
pie(subject_3 , labels= data$Name, main="Subject 3 Marks distribution", col=topo.colors(length(subject_3)))
#total <- data$Total
#pie(total, labels = data$Name, main="Distribution of total s Students",col=c(rgb(length(total))))
find_student_details <- function(student_name) {
  student_info <- data[data$Name == student_name, ]
  return(student_info)
}
#funtin have been created for finding name from the student lists


student_name_to_find <- readline("\nEnter the name you want to find out\n")
details_of_student <- find_student_details(student_name_to_find)

if (nrow(details_of_student) > 0) {
  print(details_of_student)
} else {
  cat("No student found with the provided name.\n")
}
