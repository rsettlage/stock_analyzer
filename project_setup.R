#####
# Rscript project_setup.R <project_name>
# note: dont include path
# path will be "/Users/rsettlag/Projects/"
#####


# 1.0 get command line arguments ----

args <- commandArgs(trailingOnly = TRUE)
# Rscript project_setup.R project
cat("project name is:", args, "\n")
project_directory_name <- args

# 2.0 mkdir project ----
project_directory_name = paste0("/Users/rsettlag/Projects/",project_directory_name)
## https://stackoverflow.com/questions/4216753/folder-management-with-r-check-existence-of-directory-and-create-it-if-it-does
if (file.exists(project_directory_name)){
  setwd(project_directory_name)
} else {
  dir.create(project_directory_name)
  setwd(project_directory_name)
}

# 3.0 change to project dir ----
setwd(project_directory_name)

# 4.0 create subdirectories ----

dir.create("00_original_data")
dir.create("00_working_data")
dir.create("01_scripts_functions")
dir.create("02_figures")
dir.create("03_results")



