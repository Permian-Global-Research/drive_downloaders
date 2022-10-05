
<!-- README.md is generated from README.Rmd. Please edit that file -->

# drive_downloaders

<!-- badges: start -->
<!-- badges: end -->

The goal of drive_downloaders is to provide some helper functions for
using the {googledrive} package. Nothing fancy just useful.

``` r
library(googledrive)
source("drive_downloaders.R")

# .email <- "EMAIL"
# googledrive::drive_auth(.email)

.url <- "https://drive.google.com/drive/folders/1rRPmBZT0OhU-sFDmvWCKEMiYt7Tqh8aM"
.dirname <- "Drive-DL-testing"
drive_download_dir(drive.folder=.dirname)
#> ! Using an auto-discovered, cached token.
#>   To suppress this message, modify your code or options to clearly consent to
#>   the use of a cached token.
#>   See gargle's "Non-interactive auth" vignette for more details:
#>   <https://gargle.r-lib.org/articles/non-interactive-auth.html>
#> ℹ The googledrive package is using a cached token for
#>   'hugh.graham@earthengine.permianglobal.com'.
#> ✔ The input `path` resolved to exactly 1 file.
#> File downloaded:
#> • 't3.R' <id: 1bfyrf9WslgEt7j-MMQwCJx9xlt6d5OfE>
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/t3.R'
#> File downloaded:
#> • 't2.txt' <id: 1XuYOqsJ8XaxhnEF4L_1LJ8p_gK3Pexof>
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/t2.txt'
#> File downloaded:
#> • 't1.md' <id: 14SgS8jVuxdIr8hhrGc9FOE8giCuoSxQN>
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/t1.md'
#> File downloaded:
#> • 't2.txt' <id: 1IdR7_W5msi4MqV1vYAILjwgU4kYUW2m->
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/F2/t2.txt'
#> File downloaded:
#> • 't3.R' <id: 1shqI-kkjGILqH-fiG2_PkI2sY6WLD_kH>
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/F2/t3.R'
#> File downloaded:
#> • 't1.md' <id: 1syayUnie6TM8ZaT-yuumJ3VqrXN8n22d>
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/F2/t1.md'
#> File downloaded:
#> • 't2.txt' <id: 1HDGoAh-5voxDU6LGEdkgwGfIvUIgo-dk>
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/F2/F2-B/t2.txt'
#> File downloaded:
#> • 't1.md' <id: 1VXkVkYeKkgQ_WSpavSUsrc_QXBmvrams>
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/F2/F2-B/t1.md'
#> File downloaded:
#> • 't3.R' <id: 10FSBmGxiMGWBDaTt93ZCD2WCC4UUcf3r>
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/F2/F2-B/t3.R'
#> File downloaded:
#> • 't3.R' <id: 1Fj7-8CCCtBQnkOswEaBv5EZA8OYDn_mh>
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/F1/t3.R'
#> File downloaded:
#> • 't2.txt' <id: 1tqJ95UZKKq1ldBKX_RLUMWQLunP1u09o>
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/F1/t2.txt'
#> File downloaded:
#> • 't1.md' <id: 1yF9o0HTN6XPOozvGoAXPI6Q7KWywdmgS>
#> Saved locally as:
#> • '/home/hugh/HG-Permian/drive_downloaders/Drive-DL-testing/F1/t1.md'
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


#install.packages(fs)
library(fs)
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
