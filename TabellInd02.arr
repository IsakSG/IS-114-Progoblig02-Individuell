use context essentials2021

include shared-gdrive(
"dcic-2021",
"1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")

include data-source

include gdrive-sheets
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"
tabell-for-energi-forbruk=
load-table:komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
sanitize energi using string-sanitizer
end

#https://uia-worker.github.io/is114komp/gp03.html#ica <- Bil 
distance-travelled-per-day = 16 #Funnet-på-tall
distance-per-unit-of-fuel = 8
energy-per-unit-of-fuel = 10

energy-per-day = 
  ( distance-travelled-per-day / distance-per-unit-of-fuel) 
  * energy-per-unit-of-fuel

fun energi-to-number(str :: String) -> Number:
cases(Option) string-to-number(str):
    |none => energy-per-day
    |some(a) => a
 
end

where:
  energi-to-number("") is energy-per-day
energi-to-number("48")is 48
end

tabell-string-to-number = transform-column(tabell-for-energi-forbruk, "energi", energi-to-number)

tabell-string-to-number



sum(tabell-string-to-number, "energi")


bar-chart(tabell-string-to-number, "komponent", "energi")
