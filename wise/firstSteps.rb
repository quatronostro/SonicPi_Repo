#-ilk sesler
play :C3
sleep 0.5
play :D3
sleep 0.5
play :E4

##| -bu seslere parametre eklemek
##| 	Amp, pan, cutoff
##| -synth’leri deðiþtirmek
##| •	:prophet
##| •	:dsaw
##| •	:fm
##| •	:tb303
##| •	:pulse

##| Sample ekleme, sample ile nota kullanýmý, sample’lara parametre verme(amp, pan, cutoff, rate)
##| 	sample :ambi_lunar_land
##| sleep 1
##| play 48
##| sleep 0.5
##| play 36
##| sample :ambi_drone
##| sleep 1
##| play 36
##| -external sample ekleme
##| -randomisation ve loop yapýsý
##| 	loop do
##|   play rrand(50, 95)
##|   sleep 0.5
##| end
##| loop do
##|   sample :perc_bell, rate: (rrand 0.125, 1.5)
##|   sleep rrand(0.2, 2)
##| end
##| use_synth :organ_tonewheel
##| loop do
##|   play rrand(50, 70), release: 0.1, cutoff: rrand(60, 120)
##|   sleep 0.25
##| end
##| -ayný örnekler live_loop yapýsý ile
