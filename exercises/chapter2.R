# chapter 2 exercises
library(fpp3)

# 1.Use the help function to explore what the series gafa_stock, PBS, vic_elec and pelt represent.
# gafa_stock: Historical stock prices from 2014-2018 for Google, Amazon, Facebook and Apple. All prices are in $USD.
# PBS: PBS is a monthly tsibble with two values: Scripts: Total number of scripts; Cost: Cost of the scripts in $AUD.
# vic_elec: vic_elec is a half-hourly tsibble with three values: Demand: Total electricity demand in MW; Temperature: Temperature of Melbourne (BOM site 086071); Holiday: Indicator for if that day is a public holiday.
# pelt: Hudson Bay Company trading records for Snowshoe Hare and Canadian Lynx furs from 1845 to 1935. This data contains trade records for all areas of the company.
gafa_stock
PBS
vic_elec
pelt

# 1.a. Use autoplot() to plot some of the series in these data sets.
ggplot2::autoplot(gafa_stock, Close)
ggplot2::autoplot(vic_elec, Demand)

# 1.b. What is the time interval of each series?
# gafa_stock: daily
# PBS: monthly
# vic_elec: half-hourly
# pelt: yearly

# 2. Use filter() to find what days corresponded to the peak closing price for each of the four stocks in gafa_stock.
gafa_stock %>%
    group_by(Symbol) %>%
    filter(Close == max(Close))

# 3. 
# 3.a. You can read the data into R with the following script:
tute1 <- readr::read_csv("tute1.csv")
tute1

# 3.b. Convert the data to time series
tute_timeseries <- tute1 %>%
    mutate(Quarter = yearmonth(Quarter)) %>%
    as_tsibble(index = Quarter)
tute_timeseries

# 3.c. Construct time series plots of each of the three series
tute_timeseries %>%
    pivot_longer(-Quarter) %>%
    ggplot(aes(x = Quarter, y = value, colour = name)) +
    geom_line() +
    facet_grid(name ~ ., scales = 'free_y')

# 4. The USgas package contains data on the demand for natural gas in the US.
# 4.a. Install the USgas package.
install.packages('USgas')

# 4.b. Create a tsibble from us_total with year as the index and state as the key.
us_total_tibble <- as_tibble(USgas::us_total)
us_total_tibble <- rename(us_total_tibble, Year = year)
us_gas_total_timeseries <- us_total_tibble %>%
    tsibble::as_tsibble(
        key = state,
        index = Year
    )
us_gas_total_timeseries

# 4.c. Plot the annual natural gas consumption by state for the New England area (comprising the states of Maine, Vermont, New Hampshire, Massachusetts, Connecticut and Rhode Island).
us_gas_total_timeseries %>%
    filter(state %in% c('Maine', 'Vermont', 'New Hampshire', 'Massachusetts', 'Connecticut', 'Rhode Island')) %>%
    ggplot(aes(x = Year, y = y, colour = state)) +
    geom_line() +
    facet_grid(state ~ ., scales = 'free_y')

# 5.a. Download tourism.xlsx from the book website and read it into R using readxl::read_excel().
tourism_excel <- readxl::read_excel('tourism.xlsx')

# 5.b. Create a tsibble which is identical to the tourism tsibble from the tsibble package.
tsibble::tourism
tourism_excel
tourism_timeseries <- tourism_excel %>%
    mutate(Quarter = yearmonth(Quarter)) %>%
    as_tsibble(
        key = c(Region, State, Purpose),
        index = Quarter
    )
tourism_timeseries

# 5.c. Find what combination of Region and Purpose had the maximum number of overnight trips on average.
tourism_excel %>%
    group_by(Region, Purpose) %>%
    summarise(avg = mean(Trips)) %>%
    arrange(desc(avg))

# 5.d. Create a new tsibble which combines the Purposes and Regions, and just has total trips by State.
tourism_by_state <- tourism_excel %>%
    select(Quarter, State, Trips) %>%
    group_by(Quarter, State) %>%
    summarise(Trips = sum(Trips)) %>%
    mutate(Quarter = yearmonth(Quarter)) %>%
    as_tsibble(
        key = State,
        index = Quarter
    )
tourism_by_state
