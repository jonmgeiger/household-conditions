to_moe <- function(moe) {
    moe_single <- function(x) {
        str_extract_all(x, "\\d+") %>%
            unlist() %>%        # List to Vector
            as.numeric() %>%    # Convert to numbers
            diff() %>%          # Take the difference
            `/`(2) %>%          # Single-sided MoE
            `/`(100) %>%        # Convert to proportion
            return()            # Return Margin of Error
    }
    lapply(moe, FUN = moe_single) %>%
        unlist() %>%
        return()
}