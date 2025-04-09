%%%% build and check LIP degassing

%%%% load spreadsheet of degassing rates
forcings.LIP_degass = xlsread('forcings/Degassing_restructured_noheaders.xlsx','','','basic') ;

%%%% choose rows for scenairo
% rowrange = 1:22 ; %%% volcanism only
% rowrange = 26:47 ; %%% 5:1 I:E
% rowrange = 51:72 ; %%% 10:1 I:E
% rowrange = 75:81 ; %%% volcanism only + meta
% rowrange = 84:90 ; %%% 5:1 I:E + meta
% rowrange = 93:99 ; %%% 10:1 I:E + meta

rowrange = [1:22,26:47,51:72,75:81,84:90,93:99] ; %%% ALL

%%%% extract columns
LIP_starts = forcings.LIP_degass(rowrange,1).*-1 ;
LIP_durations = forcings.LIP_degass(rowrange,3) ;
LIP_d13C = forcings.LIP_degass(rowrange,15) ;
LIP_CO2_rate_low = forcings.LIP_degass(rowrange,16) ;
LIP_CO2_rate_high = forcings.LIP_degass(rowrange,17) ;

%%% set time vector
t_geol = -540:0.001:0 ;

%%%% build continuous forcings
for n = 1 : length(rowrange)
    LIP_CO2_input_low_raw(n,:) = interp1([-540 (LIP_starts(n) - 0.001 ) LIP_starts(n) (LIP_starts(n) + LIP_durations(n) ) (LIP_starts(n) + LIP_durations(n) + 0.001 ) 0 ],[0 0 LIP_CO2_rate_low(n) LIP_CO2_rate_low(n) 0 0],t_geol) ;
    LIP_CO2_input_high_raw(n,:) = interp1([-540 (LIP_starts(n) - 0.001 ) LIP_starts(n) (LIP_starts(n) + LIP_durations(n) ) (LIP_starts(n) + LIP_durations(n) + 0.001 ) 0 ],[0 0 LIP_CO2_rate_high(n) LIP_CO2_rate_high(n) 0 0],t_geol) ;
end

%%%% take max of combined forcings as single forcing
LIP_CO2_input_low = max(LIP_CO2_input_low_raw) ;
LIP_CO2_input_high = max(LIP_CO2_input_high_raw) ;

%%%% plot
plot(t_geol,LIP_CO2_input_low)
hold on
plot(t_geol,LIP_CO2_input_high)
