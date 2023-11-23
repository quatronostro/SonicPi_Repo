
##|  ____                                                 __
##| /\  _`\                                              /\ \
##| \ \ \L\ \     __     _ __    __      ___ ___   __  __\ \ \/'\
##|  \ \  _ <'  /'__`\  /\`'__\/'__`\  /' __` __`\/\ \/\ \\ \ , <
##|   \ \ \L\ \/\ \L\.\_\ \ \//\ \L\.\_/\ \/\ \/\ \ \ \_\ \\ \ \\`\
##|    \ \____/\ \__/.\_\\ \_\\ \__/.\_\ \_\ \_\ \_\ \____/ \ \_\ \_\
##|     \/___/  \/__/\/_/ \/_/ \/__/\/_/\/_/\/_/\/_/\/___/   \/_/\/_/






use_bpm 148

live_loop :bar do
  sleep 1
end


with_fx :reverb, mix: 0.5 do
  live_loop :intro2, sync: :bar do
    stop
    sample "C:/Users/Berke/Music/AbleforSonic2023/intro_element.wav", amp: 0.2, onset: pick
    sleep 4
  end
end

live_loop :bridge3, sync: :bar do
  stop
  sample "C:/Users/Berke/Music/AbleforSonic3/bridge3.wav", amp: 0.2, cutoff: 100
  sleep 64
end


live_loop :intro, sync: :bar do
  stop
  sample "C:/Users/Berke/Music/AbleforSonic2023/intro_reaktor.wav", amp: 1
  sleep 320
end





##| live_loop :intro2, sync: :bar do
##|   stop
##|   sample "C:/Users/Berke/Music/AbleforSonic2023/tripin.wav", amp: 1
##|   sleep 359
##| end




with_fx :reverb, mix: 0.5 do
  live_loop :intro22, sync: :bar do
    stop
    sample "C:/Users/Berke/Music/AbleforSonic2023/intro_element.wav", amp: 0.2, onset: pick
    sleep 4
  end
end

live_loop :bridge32, sync: :bar do
  stop
  sample "C:/Users/Berke/Music/AbleforSonic3/bridge3.wav", amp: 0.2, cutoff: 100
  sleep 64
end


live_loop :intro2222, sync: :bar do
  stop
  sample "C:/Users/Berke/Music/AbleforSonic2023/intro_reaktor.wav", amp: 1
  sleep 320
end





##| live_loop :intro2, sync: :bar do
##|   stop
##|   sample "C:/Users/Berke/Music/AbleforSonic2023/tripin.wav", amp: 1
##|   sleep 359
##| end