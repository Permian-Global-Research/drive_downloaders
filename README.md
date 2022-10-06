
<!-- README.md is generated from README.Rmd. Please edit that file -->

# drive_downloaders

<!-- badges: start -->
<!-- badges: end -->

The goal of drive_downloaders is to provide some helper functions for
using the {googledrive} package. Nothing fancy just useful.

``` r
library(googledrive)
library(fs)
source("drive_downloaders.R")

# .email <- "EMAIL"
# googledrive::drive_auth(.email)

.url <- "https://drive.google.com/drive/folders/1rRPmBZT0OhU-sFDmvWCKEMiYt7Tqh8aM"
.dirname <- "Drive-DL-testing"

d <- suppressMessages(
    drive_download_dir(drive.folder="Drive-DL-testing")
    )
  
  print(d)
#> # A dribble: 12 × 4
#>    name   id                                drive_resource    path              
#>    <chr>  <drv_id>                          <list>            <chr>             
#>  1 t3.R   1bfyrf9WslgEt7j-MMQwCJx9xlt6d5OfE <named list [42]> /home/hugh/HG-Per…
#>  2 t2.txt 1XuYOqsJ8XaxhnEF4L_1LJ8p_gK3Pexof <named list [43]> /home/hugh/HG-Per…
#>  3 t1.md  14SgS8jVuxdIr8hhrGc9FOE8giCuoSxQN <named list [42]> /home/hugh/HG-Per…
#>  4 t2.txt 1IdR7_W5msi4MqV1vYAILjwgU4kYUW2m- <named list [43]> /home/hugh/HG-Per…
#>  5 t3.R   1shqI-kkjGILqH-fiG2_PkI2sY6WLD_kH <named list [42]> /home/hugh/HG-Per…
#>  6 t1.md  1syayUnie6TM8ZaT-yuumJ3VqrXN8n22d <named list [42]> /home/hugh/HG-Per…
#>  7 t2.txt 1HDGoAh-5voxDU6LGEdkgwGfIvUIgo-dk <named list [43]> /home/hugh/HG-Per…
#>  8 t1.md  1VXkVkYeKkgQ_WSpavSUsrc_QXBmvrams <named list [42]> /home/hugh/HG-Per…
#>  9 t3.R   10FSBmGxiMGWBDaTt93ZCD2WCC4UUcf3r <named list [42]> /home/hugh/HG-Per…
#> 10 t3.R   1Fj7-8CCCtBQnkOswEaBv5EZA8OYDn_mh <named list [42]> /home/hugh/HG-Per…
#> 11 t2.txt 1tqJ95UZKKq1ldBKX_RLUMWQLunP1u09o <named list [43]> /home/hugh/HG-Per…
#> 12 t1.md  1yF9o0HTN6XPOozvGoAXPI6Q7KWywdmgS <named list [42]> /home/hugh/HG-Per…
  
  dir_tree(path = "Drive-DL-testing", recurse = TRUE)
#> Drive-DL-testing
#> ├── F1
#> │   ├── t1.md
#> │   ├── t2.txt
#> │   └── t3.R
#> ├── F2
#> │   ├── F2-B
#> │   │   ├── t1.md
#> │   │   ├── t2.txt
#> │   │   └── t3.R
#> │   ├── t1.md
#> │   ├── t2.txt
#> │   └── t3.R
#> ├── t1.md
#> ├── t2.txt
#> └── t3.R
```
