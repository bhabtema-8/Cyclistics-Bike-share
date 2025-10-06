install.packages("tidyverse")
library(tidyverse)
install.packages("readxl")
library(readxl)
Divvy_trip_2019 <- read.csv("divvy_trips_2019_Q1.csv")
Divvy_trip_2020 <- read.csv("divvy_trips_2020_Q1.csv")
head(Divvy_trip_2020)
head(Divvy_trip_2019)
summarise(Divvy_trip_2019, mean_duration = mean(ride_length), Max_ridelength=max(ride_length), Mode_weekday=mode(WEEKDAY))
summarise(Divvy_trip_2020, mean_duration = mean(ride_length), Max_ridelength=max(ride_length), Mode_weekday=mode(weekday))
View(Divvy_trip_2019)
install.packages("lubridate")   
library(lubridate)
df$ride_length <- as.numeric(df$ride_length)
library(lubridate)
library(dplyr)
Divvy_trip_2019 <- Divvy_trip_2019 %>%
  mutate(ride_length_seconds = as.numeric(hms(ride_length)))
Divvy_trip_2020 <- Divvy_trip_2020 %>%
  mutate(ride_length_seconds = as.numeric(hms(ride_length)))
summary_stats_2019 <- Divvy_trip_2019 %>%
  summarise(
    mean_duration = mean(ride_length_seconds, na.rm = TRUE),
    max_ridelength = max(ride_length_seconds, na.rm = TRUE),
    mode_weekday = names(sort(table(WEEKDAY), decreasing = TRUE))[1]
  )
summary_stats_2020 <- Divvy_trip_2020 %>%
  summarise(
    mean_duration =mean(ride_length_seconds, na.rm = TRUE),
    max_ridelength =max(ride_length_seconds, na.rm = TRUE),
    mode_weekday = names(sort(table(WEEKDAY), decreasing = TRUE))[1]
  )
seconds_to_hms <- function(seconds) {
  sprintf("%02d:%02d:%02d",
          seconds %/% 3600,
          (seconds %% 3600) %/% 60,
          round(seconds %% 60))
}
summary_stats_2019$mean_duration_hms <- seconds_to_hms(summary_stats_2019$mean_duration)
summary_stats_2019$max_ridelength_hms <- seconds_to_hms(summary_stats_2019$max_ridelength)
summary_stats_2020$mean_duration_hms <- seconds_to_hms(summary_stats_2020$mean_duration)
summary_stats_2020$max_ridelength_hms <- seconds_to_hms(summary_stats_2020$max_ridelength)
print(summary_stats_2019)
print(summary_stats_2020)
average_by_user_type <- Divvy_trip_2019 %>%
  group_by(member_casual) %>%
  summarise(
    mean_duration = mean(ride_length_seconds, na.rm = TRUE)
  ) %>%
  mutate(
    mean_duration_hms = seconds_to_hms(mean_duration)
  )
print(average_by_user_type)
average_by_user_type <- Divvy_trip_2020 %>%
  group_by(member_casual) %>%
  summarise(
    mean_duration = mean(ride_length_seconds, na.rm = TRUE)
  ) %>%
  mutate(
    mean_duration_hms = seconds_to_hms(mean_duration)
  )
print(average_by_user_type)
library(dplyr)

ride_counts_by_day <- Divvy_trip_2019 %>%
  group_by(WEEKDAY) %>%
  summarise(ride_count = n_distinct(trip_id)) %>%  # Use n() if ride_id isn't unique
  arrange(WEEKDAY)  # Ensures days go from 1 (Sunday) to 7 (Saturday)
print(ride_counts_by_day)
ride_counts_by_day <- Divvy_trip_2020 %>%
  group_by(WEEKDAY) %>%
  summarise(ride_count = n_distinct(ride_id)) %>%  # Use n() if ride_id isn't unique
  arrange(WEEKDAY)  # Ensures days go from 1 (Sunday) to 7 (Saturday)
print(ride_counts_by_day)

ride_counts_by_day_user <- Divvy_trip_2019 %>%
  group_by(WEEKDAY, member_casual) %>%
  summarise(ride_count = n()) %>%
  arrange(WEEKDAY)

print(ride_counts_by_day_user)

ride_counts_by_day_user <- Divvy_trip_2020 %>%
  group_by(WEEKDAY, member_casual) %>%
  summarise(ride_count = n()) %>%
  arrange(WEEKDAY)

print(ride_counts_by_day_user)

library(dplyr)
library(lubridate)
library(ggplot2)

df <- Divvy_trip_2019 %>%
  mutate(
    started_at = ymd_hms(start_time),
    WEEKDAY = wday(started_at, label = TRUE, abbr = FALSE, week_start = 7)  # Sunday = 1
  )
ride_counts <- Divvy_trip_2019 %>%
  group_by(WEEKDAY) %>%
  summarise(ride_count = n()) %>%
  arrange(match(WEEKDAY, c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")))
ggplot(ride_counts, aes(x = WEEKDAY, y = ride_count)) +
  geom_bar(stat = "identity", fill = "#2E86C1") +
  labs(
    title = "Number of Rides by Day of Week",
    x = "Day of Week",
    y = "Number of Rides"
  ) +
  theme_minimal()

df <- Divvy_trip_2019 %>%
  mutate(
    started_at = ymd_hms(start_time),
    WEEKDAY = wday(started_at, label = TRUE, abbr = FALSE, week_start = 7)  # Sunday = 1
  )
ride_counts <- df %>%
  group_by(WEEKDAY, member_casual) %>%
  summarise(ride_count = n(), .groups = "drop") %>%
  mutate(WEEKDAY = factor(WEEKDAY, 
                              levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")))
ggplot(ride_counts, aes(x = WEEKDAY, y = ride_count, fill = member_casual)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Number of Rides by Day of Week and User Type",
    x = "Day of Week",
    y = "Number of Rides",
    fill = "User Type"
  ) +
  scale_fill_manual(values = c("member" = "#1F77B4", "casual" = "#FF7F0E")) +  # Optional custom colors
  theme_minimal()
ggsave('2019_Number_of Rides_per_day_chart.png',
       width=16,
       height=8)
df <- Divvy_trip_2020 %>%
  mutate(
    started_at = ymd_hms(started_at),
    WEEKDAY = wday(started_at, label = TRUE, abbr = FALSE, week_start = 7)  # Sunday = 1
  )
ride_counts <- df %>%
  group_by(WEEKDAY, member_casual) %>%
  summarise(ride_count = n(), .groups = "drop") %>%
  mutate(WEEKDAY = factor(WEEKDAY, 
                          levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")))
ggplot(ride_counts, aes(x = WEEKDAY, y = ride_count, fill = member_casual)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Number of Rides by Day of Week and User Type",
    x = "Day of Week",
    y = "Number of Rides",
    fill = "User Type"
  ) +
  scale_fill_manual(values = c("member" = "#1F77B4", "casual" = "#FF7F0E")) +  # Optional custom colors
  theme_minimal()
ggsave('2020_Number_of Rides_per_day_chart.png',
       width=16,
       height=8)
library(dplyr)
library(ggplot2)
library(lubridate)
df <-Divvy_trip_2020 %>%
  mutate(
    ride_length_parsed = suppressWarnings(hms(ride_length)),
    failed_parse = is.na(ride_length_parsed) & !is.na(ride_length)
  )
df %>% filter(failed_parse) %>% select(ride_id, ride_length)
df_clean <- Divvy_trip_2020 %>%
  mutate(
    ride_length_clean = trimws(ride_length),  # Remove leading/trailing whitespace
    ride_length_parsed = suppressWarnings(hms(ride_length_clean)),  # Try parsing
    ride_length_mins = as.numeric(ride_length_parsed, units = "mins")
  )
df_clean <- df_clean %>%
  filter(!is.na(ride_length_mins))
df_clean <- df_clean %>%
  arrange(started_at) %>%
  mutate(ride_index = row_number())

ggplot(df_clean, aes(x = ride_index, y = ride_length_mins, color = member_casual)) +
  geom_point(alpha = 0.6) +
  labs(
    title = "Ride Length vs Ride Index by User Type",
    x = "Ride Index",
    y = "Ride Length (minutes)",
    color = "User Type"
  ) +
  scale_color_manual(values = c("member" = "#1F77B4", "casual" = "#FF7F0E")) +
  theme_minimal()
sum(is.na(df_clean$ride_length_mins))
ggsave('Duration_of_users_spent_chart.png',
       width=16,
       height=8)