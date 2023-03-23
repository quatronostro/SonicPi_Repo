### Polyrhythmic Amen Break Flanger
### Author: Shea Kennedy (Doffu)
### About: This live_loop instrument chops up a drum sample programmatically and applies flanger FX based on LFO step positions.
###        A polyrhythm is produced by doubling up two samples playing at different beat lengths.
###        Randomness is introduced across various parameters using 'choose'.

### INITIALIZE MASTER VALUES
# This sets the project BPM.
use_bpm 80
# This sets the random seed (affects any portion of the code that uses randomness).
use_random_seed 0

### AUTOMATION
# This imitates a saw LFO which has 4 steps. It begins at a value of 0, and ends at a value of 0.8.
lfo1 = (line 0, 0.8, inclusive: true, steps: 4)
# This imitates a saw LFO which has 6 steps. It begins at a value of 0, and ends at a value of 0.8.
lfo2 = (line 0, 0.8, inclusive: true, steps: 6)

### LEVELS
# This variable controls the instrument's volume. Can be set between 0 and 1 (Higher values could result in distortion or clipping).
inst0_lvl = 1

### LIVE LOOPS
live_loop :amen do
  # Only proceeds if instrument's volume is not zero.
  if(inst0_lvl != 0)
    # The level FX will apply the current amp volume to the loop.
    with_fx :level, amp: inst0_lvl do
      # This generates a tick which is used to progress through the LFO steps using 'look'.
      puts tick
      # This adds flanger FX with feedback randomly swapping between LFO1 and LFO2. The mix of the FX randomly fluctuates between 1 and 0.
      with_fx :flanger, feedback: choose([lfo1.look, lfo2.look]), mix: 1 do
        # Using the sample loop_amen, onset is used in a ring to cycle between a sequence of transient starting points.
        # The beat is stretched across 2 bars with a sample release of 0.01.
        sample :loop_amen, rate: 1, onset: (ring 0, 4, 0, 6).look, beat_stretch: 2, release: 0.01
        # Using the sample loop_amen, rate cycles between 1, 4, and 2x in a mirrored pattern.
        # The pattern is only 3 beats long resulting in a polyrhythm.
        # Onset is used in a ring to cycle between a sequence of transient starting points.
        # The beat is stretched across 1 bars with a sample release of 0.01.
        sample :loop_amen, rate: (ring 1, 4, 2).mirror.look, onset: (ring 8, 9, 10).look, beat_stretch: 1, release: 0.01
      end
    end
  end
  # The loop sleeps 0.25 before repeating.
  sleep 0.25
end
