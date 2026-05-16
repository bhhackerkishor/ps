clear; clc;
PSM = linspace(1, 100);
TMS = [0.2024 0.1687 0.1212 0.0404];
for i = 1:length(TMS)
    t(i,:) = (0.14 .* TMS(i)) ./ ((PSM.^0.02 ) - 1);
end
plot(PSM, t)
grid on
xlabel('Plug Setting Multiplier (PSM)')
ylabel('Operating Time (seconds)')
title('IDMT Relay Coordination Curves')
legend('Relay R4', 'Relay R3', 'Relay R2', 'Relay R1')