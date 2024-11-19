var <-c(1,2,3,4)
typeof(var)
var1<-list("a", 1L, 1.5, TRUE)
typeof(var1)
str(var1)
p<-var1[1]
typeof(p)

library(tidyverse)
library(lubridate)

ymd("2021-01-20 20:11:59")

ymd_hms("2021-01-20 20:11:59")

as<- ymd_hms("2021-01-20 20:11:59")

as_date(as)

z <- data.frame(x = c(1, 2, 3) , y = c(1.5, 5.5, 7.5))
z[2,1]

print(z)
z
typeof(z)

quarter_1_sales <- 35657.98 

quarter_2_sales <- 43810.55 

midyear_sales <- quarter_1_sales + quarter_2_sales 
midyear_sales

#Tidyverse is a collection of R packages that share a common design philosophy, making it easier to manipulate, explore, and visualize data. 

library(tidyverse)
browseVignettes("ggplot2")

data("ToothGrowth")
View(ToothGrowth)

#dplyr package consists functions containing filtering
library(dplyr)

filtered_tg <- filter(ToothGrowth, dose == 0.5)
filtered_tg
arrange(filtered_tg,len)

#ctrl+ Shift + M for Pipe shortcut
piped_toothgrowth <- ToothGrowth %>% 
  filter(dose== 0.5) %>% 
  arrange(len)
piped_toothgrowth


mdy("2027-02-27")
mdy(02272027)
dmy(02272027)


data(diamonds)

head(diamonds)

str(diamonds)

colnames(diamonds)

diamonds <- mutate(diamonds, carat_2 = carat * 100)

as_tibble(diamonds)

install.packages("Here")
install.packages("skimr")
install.packages("Janitor")
install.packages("palmerpenguins")

library(Here)
library(skimr)
library(Janitor)
library(dplyr)  # This was mentioned as already being loaded
library(palmerpenguins)


skimr::skim_without_charts(penguins) #Summery of Data
glimpse(penguins)
head(penguins)

#Selecting Columns

select(penguins, species) 
select(penguins, -species) #without species

#Renaming Columns

rename(penguins, island_new = island)


arrange(penguins, bill_length_mm) #Ascending order
arrange(penguins, desc(bill_length_mm))

penguins2 <- arrange(penguins, desc(bill_length_mm))

penguins %>% 
  group_by(island) %>% 
  drop_na(island) %>% 
  summarize(mean_bill_length_mm = mean(bill_length_mm))

penguins %>% 
  group_by(island, species) %>% 
  drop_na(island, species) %>% 
  summarize(mean_bill_length_mm = mean(bill_length_mm),
            max_bill_length_mm = max(bill_length_mm))

#Filter the penguins data to only include data on Adelie penguins:
  
  penguins %>% 
  filter(species == "Adelie")
  
  
  
#Manually Create data frame
  
  id <- c(1:10)
  
  name <- c("John Mendes", "Rob Stewart", "Rachel Abrahamson", "Christy Hickman", "Johnson Harper", "Candace Miller", "Carlson Landy", "Pansy Jordan", "Darius Berry", "Claudia Garcia")
  
  job_title <- c("Professional", "Programmer", "Management", "Clerical", "Developer", "Programmer", "Management", "Clerical", "Developer", "Programmer")
  
  employee <- data.frame(id, name, job_title)

employee

#separate() function:
  
  employee <- data.frame(
    id = c(1, 2, 3),
    name = c("John Doe", "Jane Smith", "Peter Jones"),
    job_title = c("Analyst", "Manager", "Engineer")
  )

employee <- separate(employee, name, into = c("first_name", "last_name"), sep = " ")

print(employee)


#Unite two colums

employee <- unite(employee, "name", first_name, last_name, sep = " ")
print(employee)

# Assuming 'penguins' dataset is loaded
penguins <- mutate(penguins, body_mass_kg = body_mass_g / 1000)

print(penguins)

?select

install.packages("SimDesign")
library(SimDesign)



actual_sales <- c(100, 85, 120, 90, 110)
predicted_sales <- c(130, 100, 150, 110, 140)

bias(actual_sales, predicted_sales)

bias(predicted_sales, actual_sales)


library(ggplot2)
data(penguins)

#Create a scatter plot of body mass vs. flipper length:
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g))

ggplot(data = penguins) + 
  geom_point(mapping = aes(x = bill_length_mm, y = bill_depth_mm))

ggplot(data = penguins) + 
  geom_point(aes(x = bill_length_mm, y = bill_depth_mm))


#To know syntaxes and help
?geom_point

# Load the ggplot2 package
library(ggplot2)

# Load the penguins dataset
data(penguins)

# Map the species variable to the shape aesthetic
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, shape = species)) + 
  geom_point()

# Map the species variable to the color aesthetic
ggplot(penguins) + 
  geom_point(mapping= aes(x = flipper_length_mm, y = body_mass_g, color = species))

?ggplot

# Map the species variable to the shape aesthetic
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, shape = species)) + 
  geom_point()

# Map the species variable to both color and shape aesthetics
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = species)) + 
  geom_point()

# Map the species variable to the alpha aesthetic
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, alpha = species)) + 
  geom_point()

# Set the color of all points to purple
ggplot(penguins) + 
  geom_point(aes(x = flipper_length_mm, y = body_mass_g),color = "purple")
?aes
?size
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species, shape = species )) + 
  geom_point()


df <- data.frame(x = 1:10 , y = 1:10)
p <- ggplot(df, aes(x, y))
p + geom_line(linetype = 2)
p + geom_line(linetype = "dotdash")

# An example with hex strings; the string "33" specifies three units on followed
# by three off and "3313" specifies three units on followed by three off followed
# by one on and finally three off.
p + geom_line(linetype = "3313")

p + geom_line(linetype = "33")

# Mapping line type from a grouping variable
ggplot(economics_long, aes(date, value01)) +
  geom_line(aes(linetype = variable))

# Linewidth examples
ggplot(economics, aes(date, unemploy)) +
  geom_line(linewidth = 2, lineend = "round")
ggplot(economics, aes(date, unemploy)) +
  geom_line(aes(linewidth = uempmed), lineend = "round")

# Size examples
p <- ggplot(mtcars, aes(wt, mpg))
p + geom_point(size = 4)
p + geom_point(aes(size = qsec))
p + geom_point(size = 2.5) +
  geom_hline(yintercept = 25, size = 3.5)

# Shape examples
p + geom_point()
p + geom_point(shape = 5)
p + geom_point(shape = "k", size = 3)
p + geom_point(shape = ".")
p + geom_point(shape = NA)
p + geom_point(aes(shape = factor(cyl)))

# A look at all 25 symbols
df2 <- data.frame(x = 1:5 , y = 1:25, z = 1:25)
p <- ggplot(df2, aes(x, y))
p + geom_point(aes(shape = z), size = 4) +
  scale_shape_identity()
# While all symbols have a foreground colour, symbols 19-25 also take a
# background colour (fill)
p + geom_point(aes(shape = z), size = 4, colour = "Red") +
  scale_shape_identity()
p + geom_point(aes(shape = z), size = 4, colour = "Red", fill = "Black") +
  scale_shape_identity()

#Using different geoms in ggplot2 lets you represent your data in different ways.
# Create a scatter plot of body mass vs. flipper length
ggplot(data = penguins, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point()

# Create a scatter plot with a smooth trend line
ggplot(data = penguins, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_smooth()

# Create a scatter plot with both points and a smooth trend line
ggplot(data = penguins, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_smooth() +
  geom_point()

# Create a scatter plot with separate lines for each species
ggplot(data = penguins, aes(x = body_mass_g, y = flipper_length_mm, linetype = species)) +
  geom_smooth()

# Create a scatter plot with jittered points
ggplot(data = penguins, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_jitter()
ggplot(data = penguins, aes(x = body_mass_g, y = flipper_length_mm)) +
  geom_point()

#Comparing Geom points and geom jitter with grid extra package
library(grid)
install.packages("gridExtra")
library(gridExtra)
p=ggplot(data = penguins, aes(x = body_mass_g, y = flipper_length_mm))
grid.arrange(
           p + geom_point(),
           p + geom_jitter(width = 0.25, height = 0.5)
         )


library(ggplot2)
library(gridExtra)

P1 <- ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()

P2 <- ggplot(mtcars, aes(x = wt)) +
  geom_histogram()

P3 <- ggplot(mtcars, aes(x = qsec)) +
  geom_histogram()

grid.arrange(P1, P2, P3, ncol = 2, nrow = 2)


library(ggplot2)
library(gridExtra)

P1 <- ggplot(mtcars, aes(x = mpg)) +
  geom_histogram()

P2 <- ggplot(mtcars, aes(x = wt)) +
  geom_histogram()

P3 <- ggplot(mtcars, aes(x = qsec)) +
  geom_histogram()


grid.arrange(P1, P2, P3, ncol = 2, nrow = 2)


#This will get you 2 plots on top and 1 plot in the middle at the bottom
grid.arrange(P1, P2, P3, ncol = 2, nrow = 2, layout_matrix= rbind(c(1,2), 3))

#This will get you 1 plot in the middle at top and 2 plots at the bottom
grid.arrange(P1, P2, P3, ncol = 2, nrow = 2, layout_matrix= rbind(c(1,1),c(2,3)))


# Load the diamonds dataset
data(diamonds)

# Create a bar chart of the 'cut' variable
ggplot(data = diamonds, aes(x = cut)) +
  geom_bar()

# Create a bar chart with colored outlines
ggplot(data = diamonds, aes(x = cut, color = cut)) +
  geom_bar()

# Create a bar chart with filled bars
ggplot(data = diamonds, aes(x = cut, fill = cut)) +
  geom_bar()

# Create a stacked bar chart of 'cut' and 'clarity'
ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar()         
diamonds

#facet_wrap(): This function is used to facet your plot by a single variable. 
# For instance, if you want to visualize data for different penguin species separately, facet_wrap(~species) would be your go-to.
#facet_grid(): When you want to facet your plot using two variables simultaneously, facet_grid() comes in handy.
# It splits the plot vertically and horizontally based on the values of the two variables you specify. 
library(ggplot2)
data(penguins)

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  facet_wrap(~species)

ggplot(diamonds, aes(x = cut)) +
  geom_bar() +
  facet_wrap(~cut)

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  facet_grid(sex~species)

ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point() +
  facet_grid(. ~ species)

#Adding Title to the data
ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  labs(title = "Relationship between Body Mass and Flipper Length")
#Adding a subtitle:
  
  ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  geom_point() +
  labs(title = "Relationship between Body Mass and Flipper Length for Three Penguin Species",
       subtitle = "Data from Palmers Penguins Dataset")

   # Adding a caption:
    
    ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
    geom_point() +
    labs(title = "Relationship between Body Mass and Flipper Length for Three Penguin Species",
         subtitle = "Data from Palmers Penguins Dataset",
         caption = "Data collected by Dr. Kristen Gorman")
   # Adding an annotation(A note of explanation or comment added to a text or diagram.):
      
      ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
      geom_point() +
      labs(title = "Relationship between Body Mass and Flipper Length for Three Penguin Species",
           subtitle = "Data from Palmers Penguins Dataset",
           caption = "Data collected by Dr. Kristen Gorman") +
      annotate("text", x = 220, y = 3500, label = "The Gentoos are the largest")
   
     # Customizing the annotation:
        
        ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
        geom_point() +
        labs(title = "Relationship between Body Mass and Flipper Length for Three Penguin Species",
             subtitle = "Data from Palmers Penguins Dataset",
             caption = "Data collected by Dr. Kristen Gorman") +
        annotate("text", x = 220, y = 3500, label = "The Gentoos are the largest", 
                 color = "purple", fontface = "bold", size = 4, angle = 25)
        #Storing the plot as a variable:
          
          p <- ggplot(penguins, aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
          geom_point() +
          labs(title = "Relationship between Body Mass and Flipper Length for Three Penguin Species",
               subtitle = "Data from Palmers Penguins Dataset",
               caption = "Data collected by Dr. Kristen Gorman") 
        
        p + annotate("text", x = 220, y = 3500, label = "The Gentoos are the largest", 
                     color = "purple", fontface = "bold", size = 4, angle = 25)
        
        #Export or use ggsave to save latest graph to files
        ggsave("Three Penguin Species.png")   
        
#Other ways to save plot
        #AS png
        png(file = "exampleplot.png", bg = "transparent")
        plot(1:10)
        rect(1, 5, 3, 7, col = "white")
        dev.off()
      
        #As Pdf
        pdf(file = "/Users/username/Desktop/example.pdf",    
            width = 4,     
            height = 4) 
        plot(x = 1:10,     
             y = 1:10)
        abline(v = 0)
        text(x = 0, y = 1, labels = "Random text")
        dev.off()
