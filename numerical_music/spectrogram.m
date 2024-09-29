function [S f t] = spectrogram(signal, fs, window_size)
  % dimensiunea semnalului
  size_signal = length(signal);
  % numarul de ferestre
  number_windows = floor(size_signal / window_size);

  % aplic hanning
  hanning_window = hanning(window_size);

  % pentru fiecare fereastra trebuie sa aplic hanning
  for i = 1:number_windows
    % aflu o anumita parte a semnalului pentru a putea aplica
    idx_start = (i - 1) * window_size + 1;
    idx_end = idx_start + window_size - 1;
    window_signal = signal(idx_start:idx_end);

    % aplic hanning pentru fiecare fereastra
    window_signal_new = window_signal .* hanning_window;

    % aplic transformata
    apply_fft = fft(window_signal_new, 2 * window_size);

    % elimin conjugata
    discard_conjugate = apply_fft(1:window_size);

    % S ia ceea ce ramane in modul
    S(:, i) = abs(discard_conjugate);
  endfor

  % calculez vectorul de frecventa, iau doar jumatate
  f = ((0:window_size-1) * (fs / window_size / 2))';

  % calculez vectorul de timp, dimensiunea ferestrei impartita de sampling rate
  % pentru fiecare fereastra
  t = (((0:number_windows - 1) * window_size) / fs)';
endfunction

