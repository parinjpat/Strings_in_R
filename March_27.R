library(stringr)

emails <-readRDS("email.rds")

# 1. Create a character string that contains just one quotation mark: "

print("\"") # This actually won't work.
#### You need to use an "escape character" to ensure that it will print quotation marks.
###   In R, the escape character is \
##      You'll need to use this for any quotation mark " or backslash \ in a string

cat("\"")
#### The cat() function will allow you to add a quotation mark to print a string

cat("DSO\n545")
#### This will allow you to print two rows of strings

cat("DSO\t545")
#### This will allow you to put a tab between two strings


# 2. Create the following in R: :-\ , (^_^"), @_'-' , \m/

cat(":-\\")

cat("(^_^\")")

cat("@_'-'")

cat("\\m/")


# 3. Load stringr R package, and search for str_locate() and str_sub()

?str_locate

?str_sub


# 4. Locate the character "a" in "great", "fantastic", and "super".

str_locate(string = "great", pattern = "a")

str_locate(string = "fantastic", pattern = "a")

# Since fantastic has more than one "a", you can use str_locate_all to find all instances of the character
str_locate_all("fantastic", "a")

str_locate(string = "super", pattern = "a")


#### Or you can use this to locate all instances of "a" in every string
str_locate(c("fantastic", "great", "super"),
           pattern = "a")

# 5. Extract the substrings "tes", "ting", and "test" from "testing".

#### str_sub (string = "STRING", start = #, end = #) will allow you to extract a string using start/end points
str_sub(string = "testing", start = 1,
        end = 3)

str_sub(string = "testing", start = 4,
        end = 7)

str_sub(string = "testing", start = 1,
        end = 4)
        

# 6. What do you think this code is doing?

input <- c("abc", "defg")
str_sub(input, c(2,3))
#### The str_sub function is pulling in the array called "input" that we created
###   and it is starting each string at 2nd and 3rd position, respectively.
##      Since there is no "end =" function, it will pull the entire string from the start position for each string.




#Load the dataset "email.rds" from Blackboard (make sure you save it in your new R folder for this project)

emails <- readRDS "emails.rds"

# see the unformatted email
emails[1]

# see the formatted email
cat(emails[1])


# 7. Usc str_locate() to identify the location of the blank line that separates the header from the body in the first email. 
#     (Hint: a blank line is a newline immediately followed by another newline)

str_locate(string = emails[1], pattern = "\n\n")


# 8. Extract the header and the body for the first email.

# Header
header = str_sub(string = emails[1], start = 1, 
        end = 842)

cat(header)

#Body
body = str_sub(string = emails[1], start = 843)

cat(body)


# 10. Extract the header and body for all email messages. Store the header and body in header and body variables, respectively.

breaks = str_locate(string = emails, pattern = "\n\n")

# Header
headers = str_sub(string = emails, end = breaks[,1])

cat(headers)

#Body

bodies = str_sub(string = emails, start = breaks[,2])

cat(bodies)





#### Second Lab


# 1. Create the following vector of strings in R
fruit = c("apple", "banana", 
          "pear", "pineapple")


###############################TABLE##########################################
####  ? preceding paattern is optional (matched 0 or 1 time)
####  * preceding paattern is matched 0 or more times
####  + preceding paattern is matched at least once (1 or more)
####  {n} preceding paattern is matched exactly n times
####  {n,m} preceding paattern is matched at least n times & up to m times
####  {n,} preceding paattern is matched at least n times
##############################################################################

# 2. Run the following lines of code, and try to understand what's happening.

#detects if patterns are found
str_detect(fruit, "a")

# patterns that start with a
str_detect(fruit, "^a")

# patterns that end with a
str_detect(fruit, "a$")

# pattern to check if it has a OR e OR i OR o OR u
#   [brackets] represent OR (any of the characters within the brackets)
str_detect(fruit, "[aeiou]")

# patterns that are between a and d, inclusive
str_detect(fruit, "[a-d]")

# patterns that are between 0 and 9, inclusive
str_detect(fruit, "[0-9]")


# 3. Using regular expressions, write down a line of R code to detect which of the fruits starts 
#     with an "a" and ends with an "e"


str_detect(fruit, "^a[a-z]*e$")

# . could be any character or number. IMPORTANT for mixed strings
str_detect(fruit, "a.*e$")


# 4. Create a parser that detects phone numbers of this format: 213 740 4826 .

phone = c("213 740 4826", 
          "213-740-4826",
          "(213) 740 4826")

# incorporate dashes
str_detect(phone, "[0-9]{3}[ -][0-9]{3}[ -][0-9]{4}")


#incorporate parenthesis option
str_detect(phone, "[(][0-9]{3}[)]?[ -][0-9]{3}[ -][0-9]{4}")
### NOTE: this does not work!!!!!!!! Ask Xenia or the professor

           