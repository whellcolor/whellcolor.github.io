# WCC Profile Data Configuration
app_name <- "Whellcolor Cube Crypto (WCC)"
website_url <- "https://whellcolor.github.io/"
publisher_id <- "pub-7182145371991939"
payment_threshold <- 1300000

# Membuat Data Frame Sederhana untuk Analytics
wcc_profile_df <- data.frame(
  Property = c("App Name", "URL", "Publisher ID", "Threshold (IDR)"),
  Value = c(app_name, website_url, publisher_id, payment_threshold)
)

print(wcc_profile_df)
