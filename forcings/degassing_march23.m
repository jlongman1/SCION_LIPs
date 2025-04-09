
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% LIP degassing options march 2023 %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t_geol = [-1000:0.001:0] ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% SIBERIAN TRAPS %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Siberian traps timings
ST_1_start = -252.24 ;
ST_1_end = -251.9 ;
ST_2_start = -251.48 ;
ST_2_end = -250.2 ;
ST_pulse_start = -251.9 ;
ST_pulse_end = -251.8 ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% CO2 emissions VOLCANISM ONLY
% ST_1_CO2_low = 1.22e16 ;
% ST_1_CO2_high = 1.14e17 ;
% ST_2_CO2_low = 6.11e15 ;
% ST_2_CO2_high = 5.68e16 ;
% ST_pulse_CO2 = 0 ;

% %%%% CO2 emissions 5:1 I:E RATIO
% ST_1_CO2_low = 4.89e16 ;
% ST_1_CO2_high = 4.54e17 ;
% ST_2_CO2_low = 2.44e16 ;
% ST_2_CO2_high = 2.27e17 ;
% ST_pulse_CO2 = 0 ;

%%%% CO2 emissions VOLCANISM + META PULSE
% ST_1_CO2_low = 1.22e16 ;
% ST_1_CO2_high = 1.14e17 ;
% ST_2_CO2_low = 6.11e15 ;
% ST_2_CO2_high = 5.68e16 ;
% ST_pulse_CO2 = 1.3e17 ;

%%%% CO2 emissions 5:1 I:E RATIO + META PULSE
ST_1_CO2_low = 4.89e16 ;
ST_1_CO2_high = 4.54e17 ;
ST_2_CO2_low = 2.44e16 ;
ST_2_CO2_high = 2.27e17 ;
ST_pulse_CO2 = 1.3e17 ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% rates
ST_1_rate_low = ( ST_1_CO2_low * (1000/44) ) / ( 1e6*(ST_1_end - ST_1_start) ) ;
ST_1_rate_high = ( ST_1_CO2_high * (1000/44) ) / ( 1e6*(ST_1_end - ST_1_start) ) ;
ST_2_rate_low = ( ST_2_CO2_low * (1000/44) ) / ( 1e6*(ST_2_end - ST_2_start) ) ;
ST_2_rate_high = ( ST_2_CO2_high * (1000/44) ) / ( 1e6*(ST_2_end - ST_2_start) ) ;
ST_pulse_rate = ( ST_pulse_CO2 * (1000/44) ) / ( 1e6*(ST_pulse_end - ST_pulse_start) ) ;

% %%%% LOW
% ST_CO2 = ST_1_rate_low * interp1([ -1000 ST_1_start (ST_1_start + 0.001) (ST_1_end - 0.001) ST_1_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%        + ST_2_rate_low * interp1([ -1000 ST_2_start (ST_2_start + 0.001) (ST_2_end - 0.001) ST_2_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%        + ST_pulse_rate * interp1([ -1000 ST_pulse_start (ST_pulse_start + 0.001) (ST_pulse_end - 0.001) ST_pulse_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ;

%%%% HIGH
ST_CO2 = ST_1_rate_high * interp1([ -1000 ST_1_start (ST_1_start + 0.001) (ST_1_end - 0.001) ST_1_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
       + ST_2_rate_high * interp1([ -1000 ST_2_start (ST_2_start + 0.001) (ST_2_end - 0.001) ST_2_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
       + ST_pulse_rate * interp1([ -1000 ST_pulse_start (ST_pulse_start + 0.001) (ST_pulse_end - 0.001) ST_pulse_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ;

   
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% DECCAN TRAPS %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% Deccan traps timings
DT_1_start = -66.423 ;
DT_2_start = -66.413 ;
DT_3_start = -66.352 ;
DT_4_start = -66.3 ;
DT_5_start = -66.275 ;
DT_6_start = -66.219 ;
DT_7_start = -66.18 ;
DT_8_start = -66.109 ;
DT_9_start = -66.053 ;
DT_10_start = -65.916 ;
DT_11_start = -65.586 ;
%%%%
DT_1_end = -66.423 + 10000e-6 ;
DT_2_end = -66.413 + 61000e-6 ;
DT_3_end = -66.352 + 52000e-6 ;
DT_4_end = -66.3 + 25000e-6 ;
DT_5_end = -66.275 + 56000e-6;
DT_6_end = -66.219 + 39000e-6 ;
DT_7_end = -66.18 + 71000e-6 ;
DT_8_end = -66.109 + 56000e-6 ;
DT_9_end = -66.053 + 137000e-6 ;
DT_10_end = -65.916 + 330000e-6 ;
DT_11_end = -65.586 + 163000e-6 ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% CO2 emissions VOLCANISM ONLY
% DT_1_CO2_low = 2.71e14 ;
% DT_2_CO2_low = 5.64e14 ;
% DT_3_CO2_low = 1.36e14 ;
% DT_4_CO2_low = 1.54e14 ;
% DT_5_CO2_low = 4.82e14 ;
% DT_6_CO2_low = 1.28e14 ;
% DT_7_CO2_low = 9.92e13 ;
% DT_8_CO2_low = 2.19e14 ;
% DT_9_CO2_low = 3.14e14 ;
% DT_10_CO2_low = 6.07e14 ;
% DT_11_CO2_low = 2.7e14 ;
% %%%%
% DT_1_CO2_high = 7.35e14 ;
% DT_2_CO2_high = 1.53e15 ;
% DT_3_CO2_high = 3.68e14 ;
% DT_4_CO2_high = 4.17e14 ;
% DT_5_CO2_high = 1.31e15 ;
% DT_6_CO2_high = 3.47e14 ;
% DT_7_CO2_high = 2.69e14 ;
% DT_8_CO2_high = 5.94e14 ;
% DT_9_CO2_high = 8.49e14 ;
% DT_10_CO2_high = 1.64e15 ;
% DT_11_CO2_high = 7.3e14 ;

% %%%% CO2 emissions 5:1 I:E RATIO
DT_1_CO2_low = 1.09E+15 ;
DT_2_CO2_low = 2.26E+15 ;
DT_3_CO2_low = 5.44E+14 ;
DT_4_CO2_low = 6.16E+14 ;
DT_5_CO2_low = 1.93E+15 ;
DT_6_CO2_low = 5.13E+14 ;
DT_7_CO2_low = 3.97E+14 ;
DT_8_CO2_low = 8.78E+14 ;
DT_9_CO2_low = 1.25E+15 ;
DT_10_CO2_low = 2.43E+15 ;
DT_11_CO2_low = 1.08E+15 ;
%%%%
DT_1_CO2_high = 2.94E+15 ;
DT_2_CO2_high = 6.11E+15 ;
DT_3_CO2_high = 1.47E+15 ;
DT_4_CO2_high = 1.67E+15 ;
DT_5_CO2_high = 5.23E+15 ; 
DT_6_CO2_high = 1.39E+15 ;
DT_7_CO2_high = 1.07E+15 ;
DT_8_CO2_high = 2.38E+15 ;
DT_9_CO2_high = 3.40E+15 ;
DT_10_CO2_high = 6.57E+15 ;
DT_11_CO2_high = 2.92E+15 ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% rates
DT_1_rate_low = ( DT_1_CO2_low * (1000/44) ) / ( 1e6*(DT_1_end - DT_1_start) ) ;
DT_1_rate_high = ( DT_1_CO2_high * (1000/44) ) / ( 1e6*(DT_1_end - DT_1_start) ) ;
DT_2_rate_low = ( DT_2_CO2_low * (2000/44) ) / ( 2e6*(DT_2_end - DT_2_start) ) ;
DT_2_rate_high = ( DT_2_CO2_high * (2000/44) ) / ( 2e6*(DT_2_end - DT_2_start) ) ;
DT_3_rate_low = ( DT_3_CO2_low * (3000/44) ) / ( 3e6*(DT_3_end - DT_3_start) ) ;
DT_3_rate_high = ( DT_3_CO2_high * (3000/44) ) / ( 3e6*(DT_3_end - DT_3_start) ) ;
DT_4_rate_low = ( DT_4_CO2_low * (4000/44) ) / ( 4e6*(DT_4_end - DT_4_start) ) ;
DT_4_rate_high = ( DT_4_CO2_high * (4000/44) ) / ( 4e6*(DT_4_end - DT_4_start) ) ;
DT_5_rate_low = ( DT_5_CO2_low * (5000/44) ) / ( 5e6*(DT_5_end - DT_5_start) ) ;
DT_5_rate_high = ( DT_5_CO2_high * (5000/44) ) / ( 5e6*(DT_5_end - DT_5_start) ) ;
DT_6_rate_low = ( DT_6_CO2_low * (6000/44) ) / ( 6e6*(DT_6_end - DT_6_start) ) ;
DT_6_rate_high = ( DT_6_CO2_high * (6000/44) ) / ( 6e6*(DT_6_end - DT_6_start) ) ;
DT_7_rate_low = ( DT_7_CO2_low * (7000/44) ) / ( 7e6*(DT_7_end - DT_7_start) ) ;
DT_7_rate_high = ( DT_7_CO2_high * (7000/44) ) / ( 7e6*(DT_7_end - DT_7_start) ) ;
DT_8_rate_low = ( DT_8_CO2_low * (8000/44) ) / ( 8e6*(DT_8_end - DT_8_start) ) ;
DT_8_rate_high = ( DT_8_CO2_high * (8000/44) ) / ( 8e6*(DT_8_end - DT_8_start) ) ;
DT_9_rate_low = ( DT_9_CO2_low * (9000/44) ) / ( 9e6*(DT_9_end - DT_9_start) ) ;
DT_9_rate_high = ( DT_9_CO2_high * (9000/44) ) / ( 9e6*(DT_9_end - DT_9_start) ) ;
DT_10_rate_low = ( DT_10_CO2_low * (10000/44) ) / ( 10e6*(DT_10_end - DT_10_start) ) ;
DT_10_rate_high = ( DT_10_CO2_high * (10000/44) ) / ( 10e6*(DT_10_end - DT_10_start) ) ;
DT_11_rate_low = ( DT_11_CO2_low * (11000/44) ) / ( 11e6*(DT_11_end - DT_11_start) ) ;
DT_11_rate_high = ( DT_11_CO2_high * (11000/44) ) / ( 11e6*(DT_11_end - DT_11_start) ) ;


%%%% LOW
% DECCAN_CO2 = DT_1_rate_low * interp1([ -1000 DT_1_start (DT_1_start + 0.001) (DT_1_end - 0.001) DT_1_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%              + DT_2_rate_low * interp1([ -1000 DT_2_start (DT_2_start + 0.001) (DT_2_end - 0.001) DT_2_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%              + DT_3_rate_low * interp1([ -1000 DT_3_start (DT_3_start + 0.001) (DT_3_end - 0.001) DT_3_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%              + DT_4_rate_low * interp1([ -1000 DT_4_start (DT_4_start + 0.001) (DT_4_end - 0.001) DT_4_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%              + DT_5_rate_low * interp1([ -1000 DT_5_start (DT_5_start + 0.001) (DT_5_end - 0.001) DT_5_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%              + DT_6_rate_low * interp1([ -1000 DT_6_start (DT_6_start + 0.001) (DT_6_end - 0.001) DT_6_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%              + DT_7_rate_low * interp1([ -1000 DT_7_start (DT_7_start + 0.001) (DT_7_end - 0.001) DT_7_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%              + DT_8_rate_low * interp1([ -1000 DT_8_start (DT_8_start + 0.001) (DT_8_end - 0.001) DT_8_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%              + DT_9_rate_low * interp1([ -1000 DT_9_start (DT_9_start + 0.001) (DT_9_end - 0.001) DT_9_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%              + DT_10_rate_low * interp1([ -1000 DT_10_start (DT_10_start + 0.001) (DT_10_end - 0.001) DT_10_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%              + DT_11_rate_low * interp1([ -1000 DT_11_start (DT_11_start + 0.001) (DT_11_end - 0.001) DT_11_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ;
% 
% 
%   
   
%%%% HIGH
DECCAN_CO2 = DT_1_rate_high * interp1([ -1000 DT_1_start (DT_1_start + 0.001) (DT_1_end - 0.001) DT_1_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
             + DT_2_rate_high * interp1([ -1000 DT_2_start (DT_2_start + 0.001) (DT_2_end - 0.001) DT_2_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
             + DT_3_rate_high * interp1([ -1000 DT_3_start (DT_3_start + 0.001) (DT_3_end - 0.001) DT_3_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
             + DT_4_rate_high * interp1([ -1000 DT_4_start (DT_4_start + 0.001) (DT_4_end - 0.001) DT_4_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
             + DT_5_rate_high * interp1([ -1000 DT_5_start (DT_5_start + 0.001) (DT_5_end - 0.001) DT_5_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
             + DT_6_rate_high * interp1([ -1000 DT_6_start (DT_6_start + 0.001) (DT_6_end - 0.001) DT_6_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
             + DT_7_rate_high * interp1([ -1000 DT_7_start (DT_7_start + 0.001) (DT_7_end - 0.001) DT_7_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
             + DT_8_rate_high * interp1([ -1000 DT_8_start (DT_8_start + 0.001) (DT_8_end - 0.001) DT_8_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
             + DT_9_rate_high * interp1([ -1000 DT_9_start (DT_9_start + 0.001) (DT_9_end - 0.001) DT_9_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
             + DT_10_rate_high * interp1([ -1000 DT_10_start (DT_10_start + 0.001) (DT_10_end - 0.001) DT_10_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
             + DT_11_rate_high * interp1([ -1000 DT_11_start (DT_11_start + 0.001) (DT_11_end - 0.001) DT_11_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ;
       




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% NAIP %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% NAIP timings
NAIP_1_start = -61 ;
NAIP_1_end = -57 ;
NAIP_2_start = -56 ;
NAIP_2_end = -55 ;
NAIP_pulse_start = -56 ;
NAIP_pulse_end = -55.95 ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% CO2 emissions VOLCANISM ONLY
% NAIP_1_CO2_low = 3.08e14 ;
% NAIP_1_CO2_high = 4.45e15 ;
% NAIP_2_CO2_low = 3.69e15 ;
% NAIP_2_CO2_high = 5.34e16 ;
% NAIP_pulse_CO2 = 0 ;

% %%%% CO2 emissions 5:1 I:E RATIO
% NAIP_1_CO2_low = 1.23e15 ;
% NAIP_1_CO2_high = 1.78e16 ;
% NAIP_2_CO2_low = 1.48e16 ;
% NAIP_2_CO2_high = 2.13e17 ;
% NAIP_pulse_CO2 = 0 ;

%%%% CO2 emissions VOLCANISM + META PULSE
% NAIP_1_CO2_low = 3.08e14 ;
% NAIP_1_CO2_high = 4.45e15 ;
% NAIP_2_CO2_low = 3.69e15 ;
% NAIP_2_CO2_high = 5.34e16 ;
% NAIP_pulse_CO2 = 4.41e16 ;

%%%% CO2 emissions 5:1 I:E RATIO + META PULSE
NAIP_1_CO2_low = 1.23e15 ;
NAIP_1_CO2_high = 1.78e16 ;
NAIP_2_CO2_low = 1.48e16 ;
NAIP_2_CO2_high = 2.13e17 ;
NAIP_pulse_CO2 = 4.41e16 ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% rates
NAIP_1_rate_low = ( NAIP_1_CO2_low * (1000/44) ) / ( 1e6*(NAIP_1_end - NAIP_1_start) ) ;
NAIP_1_rate_high = ( NAIP_1_CO2_high * (1000/44) ) / ( 1e6*(NAIP_1_end - NAIP_1_start) ) ;
NAIP_2_rate_low = ( NAIP_2_CO2_low * (1000/44) ) / ( 1e6*(NAIP_2_end - NAIP_2_start) ) ;
NAIP_2_rate_high = ( NAIP_2_CO2_high * (1000/44) ) / ( 1e6*(NAIP_2_end - NAIP_2_start) ) ;
NAIP_pulse_rate = ( NAIP_pulse_CO2 * (1000/44) ) / ( 1e6*(NAIP_pulse_end - NAIP_pulse_start) ) ;

% %%%% LOW
% NAIP_CO2 = NAIP_1_rate_low * interp1([ -1000 NAIP_1_start (NAIP_1_start + 0.001) (NAIP_1_end - 0.001) NAIP_1_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%        + NAIP_2_rate_low * interp1([ -1000 NAIP_2_start (NAIP_2_start + 0.001) (NAIP_2_end - 0.001) NAIP_2_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%        + NAIP_pulse_rate * interp1([ -1000 NAIP_pulse_start (NAIP_pulse_start + 0.001) (NAIP_pulse_end - 0.001) NAIP_pulse_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ;

%%%% HIGH
NAIP_CO2 = NAIP_1_rate_high * interp1([ -1000 NAIP_1_start (NAIP_1_start + 0.001) (NAIP_1_end - 0.001) NAIP_1_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
       + NAIP_2_rate_high * interp1([ -1000 NAIP_2_start (NAIP_2_start + 0.001) (NAIP_2_end - 0.001) NAIP_2_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
       + NAIP_pulse_rate * interp1([ -1000 NAIP_pulse_start (NAIP_pulse_start + 0.001) (NAIP_pulse_end - 0.001) NAIP_pulse_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% CRB %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% CRB timings
CRB_1_start = -16.65 ;
CRB_2_start = -16.59 ;
CRB_3_start = -16.57 ;
CRB_4_start = -16.066 ;
CRB_5_start = -15.895 ;
%%%%
CRB_1_end = -16.59 ;
CRB_2_end = -16.57 ;
CRB_3_end = -16.066 ;
CRB_4_end = -15.895 ;
CRB_5_end = -6 ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% CO2 emissions VOLCANISM ONLY
% CRB_1_CO2_low = 7.74E+14 ;
% CRB_2_CO2_low = 2.68E+14 ;
% CRB_3_CO2_low = 3.63E+15 ;
% CRB_4_CO2_low = 2.96E+14 ;
% CRB_5_CO2_low = 5.90E+13 ;
% %%%%
% CRB_1_CO2_high = 2.10E+15 ;
% CRB_2_CO2_high = 7.25E+14 ;
% CRB_3_CO2_high = 9.83E+15 ;
% CRB_4_CO2_high = 8.03E+14 ;
% CRB_5_CO2_high = 1.60E+14 ;


% %%%% CO2 emissions 5:1 I:E RATIO
CRB_1_CO2_low = 3.10E+15 ;
CRB_2_CO2_low = 1.07E+15 ;
CRB_3_CO2_low = 1.45E+16 ;
CRB_4_CO2_low = 1.19E+15 ;
CRB_5_CO2_low = 2.36E+14 ;
%%%%
CRB_1_CO2_high = 8.39E+15 ;
CRB_2_CO2_high = 2.90E+15 ;
CRB_3_CO2_high = 3.93E+16 ;
CRB_4_CO2_high = 3.21E+15 ;
CRB_5_CO2_high = 6.39E+14 ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%% rates
CRB_1_rate_low = ( CRB_1_CO2_low * (1000/44) ) / ( 1e6*(CRB_1_end - CRB_1_start) ) ;
CRB_1_rate_high = ( CRB_1_CO2_high * (1000/44) ) / ( 1e6*(CRB_1_end - CRB_1_start) ) ;
CRB_2_rate_low = ( CRB_2_CO2_low * (2000/44) ) / ( 2e6*(CRB_2_end - CRB_2_start) ) ;
CRB_2_rate_high = ( CRB_2_CO2_high * (2000/44) ) / ( 2e6*(CRB_2_end - CRB_2_start) ) ;
CRB_3_rate_low = ( CRB_3_CO2_low * (3000/44) ) / ( 3e6*(CRB_3_end - CRB_3_start) ) ;
CRB_3_rate_high = ( CRB_3_CO2_high * (3000/44) ) / ( 3e6*(CRB_3_end - CRB_3_start) ) ;
CRB_4_rate_low = ( CRB_4_CO2_low * (4000/44) ) / ( 4e6*(CRB_4_end - CRB_4_start) ) ;
CRB_4_rate_high = ( CRB_4_CO2_high * (4000/44) ) / ( 4e6*(CRB_4_end - CRB_4_start) ) ;
CRB_5_rate_low = ( CRB_5_CO2_low * (5000/44) ) / ( 5e6*(CRB_5_end - CRB_5_start) ) ;
CRB_5_rate_high = ( CRB_5_CO2_high * (5000/44) ) / ( 5e6*(CRB_5_end - CRB_5_start) ) ;


%%%% LOW
% CRB_CO2 = CRB_1_rate_low * interp1([ -1000 CRB_1_start (CRB_1_start + 0.001) (CRB_1_end - 0.001) CRB_1_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%        + CRB_2_rate_low * interp1([ -1000 CRB_2_start  (CRB_2_start + 0.001) (CRB_2_end - 0.001) CRB_2_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%        + CRB_3_rate_low * interp1([ -1000 CRB_3_start (CRB_3_start + 0.001) (CRB_3_end - 0.001) CRB_3_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%        + CRB_4_rate_low * interp1([ -1000 CRB_4_start  (CRB_4_start + 0.001) (CRB_4_end - 0.001) CRB_4_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
%        + CRB_5_rate_low * interp1([ -1000 CRB_5_start (CRB_5_start + 0.001) (CRB_5_end - 0.001) CRB_5_end 0 ],[ 0 0 1 1 0 0 ],t_geol) ;
%    
%%%% HIGH
CRB_CO2 = CRB_1_rate_high * interp1([ -1000 CRB_1_start (CRB_1_start + 0.001) (CRB_1_end - 0.001) CRB_1_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
       + CRB_2_rate_high * interp1([ -1000 CRB_2_start  (CRB_2_start + 0.001) (CRB_2_end - 0.001) CRB_2_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
       + CRB_3_rate_high * interp1([ -1000 CRB_3_start (CRB_3_start + 0.001) (CRB_3_end - 0.001) CRB_3_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
       + CRB_4_rate_high * interp1([ -1000 CRB_4_start  (CRB_4_start + 0.001) (CRB_4_end - 0.001) CRB_4_end  0 ],[ 0 0 1 1 0 0 ],t_geol) ...
       + CRB_5_rate_high * interp1([ -1000 CRB_5_start (CRB_5_start + 0.001) (CRB_5_end - 0.001) CRB_5_end 0 ],[ 0 0 1 1 0 0 ],t_geol) ;






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% total CO2 input from LIPs
TOTAL_CO2_INPUT = CRB_CO2 + NAIP_CO2 + DECCAN_CO2 + ST_CO2;


%%%% outputs for excel
output_x = t_geol' ;
output_y = TOTAL_CO2_INPUT' ;

% %%%% move to coarse grid
% tgrid = -1000:0.01:0 ;
% output = interp1(t_geol,TOTAL_CO2_INPUT,tgrid) ;















