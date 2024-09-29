function signal = apply_reverb(signal, impulse_response)
  % aplic functia stereo_to_mono pentru a ma asigura ca impulse_response
  % este in mono
  impulse_response_mono = stereo_to_mono(impulse_response);
  % aplic fftconv pentru a afla convolutia
  convolution = fftconv(signal, impulse_response_mono);
  % normalizez
  signal = convolution / max(abs(convolution));
endfunction

