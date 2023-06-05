# 230602 2030 Sonic Pi cover of Resynthesis by Max Cooper
# Saved 230602 2030
# Created by linktr.ee/relaxnow

# Original: "Max Cooper - Resynthesis (official video by Kevin McGloughlin)"
#  https://youtu.be/Kpm1l0HfkV0
#  Amazing visuals from https://www.kevinmcgloughlin.com/world-passing-by

# Found notes and rythme here:
#  How to make the keys for the Max Cooper 'Resynthesis'
#  youtube.com/watch?v=QZQK7JYCy5w

use_debug false
set_volume! 2

with_fx :reverb, room: 0.7 do
  
  
  
  live_loop :a1 do
    tick
    
    
    / rythme /
    p = bools(1,1,0,0, 1,0,1,1, 1,1,0,1, 0,1,1,0,
              1,0,0,1, 0,0,1,0, 0,1,0,1, 0,1,1,0)
    
    
    / chords progression /
    n1 = [:gs2,:c3, :ds3,:fs4]
    n2 = [:gs2,:b2, :e3, :gs3, :b3,:fs4, :fs5]
    n3 = [:gs2,:cs3, :fs3,:gs4]
    n4 = [:e2,:as3, :b3,:fs4]
    l = 64
    n = knit(n1,l, n2,l, n3,l, n4,l).look
    #n = n4
    
    
    / synth /
    use_synth :saw                                #  (Full sound) :saw :dsaw :dtri :square   (thin sound) :blade
    c = line(60,100,steps: 32).mirror.look        # Synth cutoff
    amp = line(-0.5,0.5,steps: 32).mirror.look    # volume LFO on amp synth top chords
    
    
    / change synth "release" time here for tension effect /
    release = 1 #1 original
    # release = knit(1,64, 2,16,3,16).look
    #    release = 3
    case release
    when 1 # long and smooth (original)
      use_synth_defaults cutoff: c, release: [0.16,0.25].choose
    when 2 # sometimes short
      use_synth_defaults cutoff: c, release: [0.16,0.25].choose-[0,0.05,0.1].choose
    when 3 # very  short for tension
      use_synth_defaults cutoff: c, release: [0.16,0.25].choose-[0.09,0.11].choose
    end
    
    
    
    / change "synthVoices" here to explorer different synths /
    synthVoices = knit(5,64, 3,64, 2,64, 6,64, 7,64).look
    #synthVoices = 2 #2 #6arp 7arp
    
    case synthVoices
    when 0
      # No synth chords playing (only bass + drums)
    when 1 # "Single" chords
      use_synth :saw
      play n, amp: 1+amp, pan: rdist(0.25) if p.look
    when 2 # "Double up" on chords
      use_synth :saw
      play n, amp: 1+amp, pan: rdist(0.25) if p.look
      play n, amp: 1+amp, pitch: 12, pan: rdist(0.75) if p.look # extra copy to fill out chords sound
    when 3
      use_synth :dsaw
      play n, amp: 1+amp, pan: rdist(0.25) if p.look
      play n, amp: 1+amp, pitch: 12, pan: rdist(0.75) if p.look
    when 4
      use_synth :dtri
      play n, amp: 1+amp, pan: rdist(0.25) if p.look
      play n, amp: 1+amp, pitch: 12, pan: rdist(0.75) if p.look
    when 5
      use_synth :saw
      play n, amp: 1+amp, pan: rdist(0.25) if p.look
      use_synth :square
      play n, amp: 1+amp, pitch: 12, pan: rdist(0.75) if p.look
      
      # + ARP
    when 6
      #when 1 # "Single" chords
      use_synth :saw
      play n.pick(3), amp: 1+amp, pan: rdist(0.25) if p.look
      
    when 7 # +arp NICE
      #    when 2 # "Double up" on chords + arp with PICK(3)
      use_synth :saw
      play n.pick(3), amp: 1+amp, pan: rdist(0.25) if p.look
      use_synth :square
      play n.look, amp: 0.7+amp, pitch: 12, pan: rdist(0.75) if p.look
      
    end
    
    
    
    / bass /
    bass = n.take(1).look-12 #if spread(1,32).look
    #puts note_info(bass) if spread(1,32).look # Which bassnote are playing?
    play bass, amp: 1.25 if p.look
    
    
    
    / drums /
    d = 64*2
    drums = knit(0,d,1,d/2,2,d/4,3,d,4,d*2).look
    #drums = 1
    #drums = 0
    case drums
    when 0
    when 1
      sample :bd_haus, cutoff: 70, amp: 1.5 if bools(1,0,0,0).look
      sample :bd_haus, cutoff: 80, amp: 1.75 if (bools(0,0,0,0)*15+bools(0,0,1,0)).look and one_in(2)
    when 2
      sample :glitch_perc3, beat_stretch: [0.25,0.5, 1,2,4].choose, rate: [2,4].choose, slice: rrand_i(1,10), amp: 2, pan: rdist(0.5) if bools(1).look and one_in(2)
    when 3
      sample :bd_haus, cutoff: 70, amp: 1.5 if bools(1,0,0,0).look
      sample :bd_haus, cutoff: 80, amp: 1.75 if (bools(0,0,0,0)*15+bools(0,0,1,0)).look and one_in(2)
      sample :glitch_perc3, beat_stretch: [0.25,0.5, 1,2,4].choose, rate: [2,4].choose, slice: rrand_i(1,10), amp: 2, pan: rdist(0.5) if bools(1).look and one_in(2)
    when 4
      sample :bd_haus, cutoff: 70, amp: 1.5 if bools(1,0,0,0).look
      sample :bd_haus, cutoff: 80, amp: 1.75 if (bools(0,0,0,0)*15+bools(0,0,1,0)).look and one_in(2)
      sample :glitch_perc3, beat_stretch: [0.25,0.5, 1,2,4].choose, rate: [2,4].choose, slice: rrand_i(1,10), amp: 2, pan: rdist(0.5) if bools(1).look and one_in(2)
      sample :sn_generic, slice: 1, rate: 3, amp: 1.5, pan: rdist(0.75)  if bools(0,0,0,0, 1,0,0,0, 0,0,0,0, 0,0,0,0,).look #and one_in(2)
      sample :sn_generic, rate: [1,1.2,1.5].choose, finish: [0.15,0.25].choose, amp: 1.5, pan: rdist(0.75)  if bools(0,0,0,0, 0,0,0,0, 0,0,0,0, 1,0,0,0,).look
    end
    
    
    sleep 0.25
    
  end
end
