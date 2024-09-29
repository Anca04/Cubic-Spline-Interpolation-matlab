function mono = stereo_to_mono(stereo)
  % fac meadia pentru fiecare rand
  mono = mean(stereo, 2);

  % Normalize
  mono = mono / max(abs(mono));
endfunction

