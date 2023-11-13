define :algorave_15 do |i|
  date = 24 nov 2023
  play_pattern_timed 21 PM
  osc = "C:/Kadikoy/karga"
end

with_fx :EXECUTE_MAYBE, mix: 1 do
  in_thread do
    sample :KATRAN, w:ZAZA_LA_LOCA
    sleep 30
  end
  
  in_thread do
    sample :IDIL_ACIM, lpf: 5
    sleep 30
  end
  
  in_thread do
    sample :BARAMUK, w:UZAK
    sleep 30
  end
  
  in_thread do
    sample :RAW, rate: -2
    sleep 30
  end
end
