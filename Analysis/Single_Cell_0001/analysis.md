# Analysis

## Extremely dark parts of the fish are their eyes and belly

- Histogram
  - Data
    - fish_cell_0001
    - single_fish_0001
  - The background tends to be very bright
    - Since there are more background, it is expected that there are more count in background intensity pixels
  - The fish tends to be darker than the background
    - However, it isn't always true.
      - Some of the fish' part have similar pixel values
  - For certain, the very dark pixels represents the fish's eye and belly.

## Some parts of the fish's body is undistinguishable from the background

- We can see this more clearly using the mesh plot.
  - When using the program and looking at it from the sides, we can see that many background pixels that have the same level as the fish.
  - This makes sense since the fish's body is transparent and it is like the cells.
