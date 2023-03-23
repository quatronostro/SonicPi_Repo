# 220822 2317 Exploring Sonic Pi version 331 sample libary with numbers with Hydra code
# 220822 Update: with guit in index
# Sonic Pi 3.3.1
# YT https://youtu.be/smaKWzsF7A0


#----------------------------------------------#
use_bpm 130

live_loop :time, delay: 0.01 do
  sleep 1
end


#----------------------------------------------#
#----------------------------------------------#
# rate of 3 samplers below                     #
my_rate = 1                                    # change here 1-2
case my_rate
when 1
  r1 = 1
  r2 = 2
  r3 = 4
when 2
  r1 = 1
  r2 = 4
  r3 = 8
end
#----------------------------------------------#

#----------------------------------------------#
# f = :finish of samples below                 #  (I decided to do this for each soundgroup below)
#f = 0.125                                     # change here 0.02 - 0.5 (max = 1)
#----------------------------------------------#

#----------------------------------------------#
# nice order 1,3,5,4,6,7,8,9,10,11,12,14,2,13     #
SonicPiSampleIndex = 7                         # Change here 0-14
#----------------------------------------------#
# SonicPiSampleIndex              f=:finish
#                a-b
# 0  STOP
# 1  ambi        0-10             f=0.125
# 2  bass       11-19             f=0.25
# 3  bd         20-32             f=1
# 4  drum       33-52             f=1
# 5  elec       53-77             f=1
# 6  glicth     78-89             f=0.125
# 7  guit       86-89             f=0.125
# 8  loop      90-106             f=0.05
# 9  mehackit 107-117             f=0.25
# 10  misc     118-120             f=0.15
# 11 perc     121-130   nice      f=1
# 12 sn       131-134   nice      f=1
# 13 tabla    135-160   nice      f=1
# 14 vinyl    161-164             f=0.15
#----------------------------------------------#
#----------------------------------------------#



case SonicPiSampleIndex

when 0
  stop
  
when 1 # ambi 0-10
  a= 0
  b= 10
  f= 0.125
  
when 2 # bass 11-19
  a= 11
  b= 19
  f= 0.25
  
when 3 # bd 20-32
  a= 20
  b= 32
  f= 1
  
when 4 # drum 33-52
  a= 33
  b= 52
  f= 1
  
when 5 # elec 53-77
  a= 53
  b= 77
  f= 1
  
when 6 # glicth 78-89
  a= 78
  b= 89
  f= 0.125
  
when 7 # guit 86-89
  a= 78
  b= 89
  f= 0.125
  
when 8 # loop 90-106
  a= 90
  b= 106
  f= 0.05
  
when 9 # mehackit 107-117
  a= 107
  b= 117
  f= 0.25
  
when 10 # misc 118-120
  a= 118
  b= 120
  f= 0.15
  
when 11 # perc 121-130
  a= 121
  b= 130
  f= 1
  
when 12 # sn 131-134
  a= 131
  b= 134
  f= 1
  
when 13 # tabla 135-160
  a= 135
  b= 160
  f= 1
  
when 14 # vinyl 161-164
  a= 161
  b= 164
  f= 0.15
end
#------------------------------------------------------------------------#



with_fx :reverb, room: 0.7 do
  
  use_random_seed 1
  live_loop :sampl, sync: :time do
    #stop
    puts sample rrand_i(a,b), rate: r1, finish: f,pan: rrand(-1,1) if spread(3,5).tick()
    sleep 0.5
  end
  
  use_random_seed 5
  live_loop :sampl2, sync: :time do
    # stop
    puts sample rrand_i(a,b), rate: r2, finish: f,pan: rrand(-1,1) if spread(3,6).tick()
    sleep 0.25
  end
  
  use_random_seed 10
  live_loop :sampl3, sync: :time do
    #stop
    puts sample rrand_i(a,b), rate: r3, finish: f,pan: rrand(-1,1) if spread(3,7).tick()
    sleep 0.25
  end
  
end # end reverb




# https://www.howtoexcel.org/how-to-get-a-list-of-file-names-from-a-folder-and-all-subfolders/
# (samplelist starts at 0 + subtract readme file)


# Samples in Sonic Pi folder after number

#--------------------------- ambi 0-10
# 0 ambi_choir.flac
# 1 ambi_dark_woosh.flac
# 2 ambi_drone.flac
# 3 ambi_glass_hum.flac
# 4 ambi_glass_rub.flac
# 5 ambi_haunted_hum.flac
# 6 ambi_lunar_land.flac
# 7 ambi_piano.flac
# 8 ambi_sauna.flac
# 9 ambi_soft_buzz.flac
# 10 ambi_swoosh.flac

#--------------------------- bass 11-19
# 11 bass_dnb_f.flac
# 12 bass_drop_c.flac
# 13 bass_hard_c.flac
# 14 bass_hit_c.flac
# 15 bass_thick_c.flac
# 16 bass_trance_c.flac
# 17 bass_voxy_c.flac
# 18 bass_voxy_hit_c.flac
# 19 bass_woodsy_c.flac

#--------------------------- bd 20-32
# 20 bd_808.flac
# 21 bd_ada.flac
# 22 bd_boom.flac
# 23 bd_fat.flac
# 24 bd_gas.flac
# 25 bd_haus.flac
# 26 bd_klub.flac
# 27 bd_mehackit.flac
# 28 bd_pure.flac
# 29 bd_sone.flac
# 30 bd_tek.flac
# 31 bd_zome.flac
# 32 bd_zum.flac

#--------------------------- drum 33-52
# 33 drum_bass_hard.flac
# 34 drum_bass_soft.flac
# 35 drum_cowbell.flac
# 36 drum_cymbal_closed.flac
# 37 drum_cymbal_hard.flac
# 38 drum_cymbal_open.flac
# 39 drum_cymbal_pedal.flac
# 40 drum_cymbal_soft.flac
# 41 drum_heavy_kick.flac
# 42 drum_roll.flac
# 43 drum_snare_hard.flac
# 44 drum_snare_soft.flac
# 45 drum_splash_hard.flac
# 46 drum_splash_soft.flac
# 47 drum_tom_hi_hard.flac
# 48 drum_tom_hi_soft.flac
# 49 drum_tom_lo_hard.flac
# 50 drum_tom_lo_soft.flac
# 51 drum_tom_mid_hard.flac
# 52 drum_tom_mid_soft.flac

#--------------------------- elec 53-77
# 53 elec_beep.flac
# 54 elec_bell.flac
# 55 elec_blip.flac
# 56 elec_blip2.flac
# 57 elec_blup.flac
# 58 elec_bong.flac
# 59 elec_chime.flac
# 60 elec_cymbal.flac
# 61 elec_filt_snare.flac
# 62 elec_flip.flac
# 63 elec_fuzz_tom.flac
# 64 elec_hi_snare.flac
# 65 elec_hollow_kick.flac
# 66 elec_lo_snare.flac
# 67 elec_mid_snare.flac
# 68 elec_ping.flac
# 69 elec_plip.flac
# 70 elec_pop.flac
# 71 elec_snare.flac
# 72 elec_soft_kick.flac
# 73 elec_tick.flac
# 74 elec_triangle.flac
# 75 elec_twang.flac
# 76 elec_twip.flac
# 77 elec_wood.flac

#--------------------------- glicth 78-85
# 78 glitch_bass_g.flac
# 79 glitch_perc1.flac
# 80 glitch_perc2.flac
# 81 glitch_perc3.flac
# 82 glitch_perc4.flac
# 83 glitch_perc5.flac
# 84 glitch_robot1.flac
# 85 glitch_robot2.flac

#--------------------------- guit 86-89
# 86 guit_em9.flac
# 87 guit_e_fifths.flac
# 88 guit_e_slide.flac
# 89 guit_harmonics.flac

#--------------------------- loop 90-106
# 90 loop_3d_printer.flac
# 91 loop_amen.flac
# 92 loop_amen_full.flac
# 93 loop_breakbeat.flac
# 94 loop_compus.flac
# 95 loop_drone_g_97.flac
# 96 loop_electric.flac
# 97 loop_garzul.flac
# 98 loop_industrial.flac
# 99 loop_mehackit1.flac
# 100 loop_mehackit2.flac
# 101 loop_mika.flac
# 102 loop_perc1.flac
# 103 loop_perc2.flac
# 104 loop_safari.flac
# 105 loop_tabla.flac
# 106 loop_weirdo.flac

#--------------------------- mehackit 107-117
# 107 mehackit_phone1.flac
# 108 mehackit_phone2.flac
# 109 mehackit_phone3.flac
# 110 mehackit_phone4.flac
# 111 mehackit_robot1.flac
# 112 mehackit_robot2.flac
# 113 mehackit_robot3.flac
# 114 mehackit_robot4.flac
# 115 mehackit_robot5.flac
# 116 mehackit_robot6.flac
# 117 mehackit_robot7.flac

#--------------------------- misc 118-120
# 118 misc_burp.flac
# 119 misc_cineboom.flac
# 120 misc_crow.flac

#--------------------------- perc 121-130
# 121 perc_bell.flac
# 122 perc_bell2.flac
# 123 perc_door.flac
# 124 perc_impact1.flac
# 125 perc_impact2.flac
# 126 perc_snap.flac
# 127 perc_snap2.flac
# 128 perc_swash.flac
# 129 perc_swoosh.flac
# 130 perc_till.flac

#--------------------------- sn 131-134
# 131 sn_dolf.flac
# 132 sn_dub.flac
# 133 sn_generic.flac
# 134 sn_zome.flac

#--------------------------- tabla 135-160
# 135 tabla_dhec.flac
# 136 tabla_ghe1.flac
# 137 tabla_ghe2.flac
# 138 tabla_ghe3.flac
# 139 tabla_ghe4.flac
# 140 tabla_ghe5.flac
# 141 tabla_ghe6.flac
# 142 tabla_ghe7.flac
# 143 tabla_ghe8.flac
# 144 tabla_ke1.flac
# 145 tabla_ke2.flac
# 146 tabla_ke3.flac
# 147 tabla_na.flac
# 148 tabla_na_o.flac
# 149 tabla_na_s.flac
# 150 tabla_re.flac
# 151 tabla_tas1.flac
# 152 tabla_tas2.flac
# 153 tabla_tas3.flac
# 154 tabla_te1.flac
# 155 tabla_te2.flac
# 156 tabla_te_m.flac
# 157 tabla_te_ne.flac
# 158 tabla_tun1.flac
# 159 tabla_tun2.flac
# 160 tabla_tun3.flac

#--------------------------- vinyl 161-164
# 161 vinyl_backspin.flac
# 162 vinyl_hiss.flac
# 163 vinyl_rewind.flac
# 164 vinyl_scratch.flac

