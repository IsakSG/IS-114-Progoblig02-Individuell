use context essentials2021

#Ratios:
#Danmark = 1.321 (37:28) 
#Norge = 1.375 (22:16)
#Island = 1.389 (25:18)
#Sverige = 1.6 (8:5)
#Finland = 1.636 (18:11)
#Farayane = 1.375 (22:16)


fun cross-flag(tallx :: Number, tally :: Number, base :: String, thinstripe :: String, largestripe :: String) -> Image:


  scale-xy(tallx, tally,
  overlay-xy(rectangle(220, 20, "solid", thinstripe), 0, -70,
    overlay-xy(rectangle(20, 160, "solid", thinstripe), -70, 0,
      overlay-xy(rectangle(220, 40, "solid", largestripe), 0, -60, 
        overlay-xy(rectangle(40, 160, "solid", largestripe), -60, 0,
            rectangle(220, 160, "solid", base))))))
  
  
  
end


norway = cross-flag(1.375, 1, "red", "midnight-blue", "white")
sweden = cross-flag(1.6, 1,"medium-blue", "gold", "gold")
denmark = cross-flag(1.321, 1, "crimson", "white", "crimson")
finland = cross-flag(1.636, 1, "white", "navy", "navy")
island = cross-flag(1.389, 1, "medium-blue", "red", "white")
faroeisland = cross-flag(1.375, 1, "white", "red", "royal-blue")


denmark
norway
island
faroeisland
sweden
finland
