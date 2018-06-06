library(tidyverse)
library(spedtools) 
set.seed(2) 

#------------------------------------------------------------------------------

# Make fake student dataset 
students <- make_table_a(1000) %>% 
  mutate(FEDSET_PRS = as.character(FEDSET_PRS))

#------------------------------------------------------------------------------

# Vector of indices where students have receive preschool in separate schools
sel <- which(students$FEDSET_PRS == "450") 

# Randomly select 75 percent from sel
sel_2 <- sample(selected, .75 * length(selected)) 

# Output mean of time in general ed for remaining records 
students %>% 
  filter(!(row_number() %in% sel_2)) %>% 
  summarise(mean = mean(IN_REGCLS)) %>% 
  as.numeric()