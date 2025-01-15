%%%%%%%%%%%%%%%%%%%%clear%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                               %
%              110111010                                                                        %
%           111010-1-----101                                                                    %
%        1011111---------101111                                                                 %
%      11011------------------101         SCION: Spatial Continuous Integration                 %
%     111-----------------10011011        Earth Evolution Model                                 %
%    1--10---------------1111011111                                                             %
%    1---1011011---------1010110111       Coded by Benjamin J. W. Mills                         %
%    1---1011000111----------010011       email: b.mills@leeds.ac.uk                            %
%    1----1111011101----------10101                                                             %
%     1----1001111------------0111        Model initialiser                                     %
%      1----1101-------------1101         call this script to perform single runs               %
%        1--111----------------1                                                                %
%           1---------------1                                                                   %
%               111011011                                                                       %
%                                                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%   Define parameters   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function run = SCION_initialise_Mesozoic_LIPs_cryptic(runcontrol)

    %%%%%%% remove structures from pervious runs 
    clear stepnumber
    clear pars
    clear forcings
    clear workingstate
    clear switches
    clear state
    clear rawoutput
    clear options
    clear geoldata
    clear rawoutput
    clear resample
    %%%%%%% set up global structures
    global stepnumber
    global pars
    global forcings
    global workingstate
    global state 
    global gridstate 
    global INTERPSTACK
    global sensanal
    global plotrun
    global sensparams
    global LIPS
    global sigma
    %%%% global tuning variables
    global Gtune
    global Ctune
    global PYRtune
    global GYPtune
    global Atune
    global Otune
    global Stune
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%   Check for sensitivity analysis   %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if runcontrol >= 1
        sensanal = 1 ;
        plotrun = 0 ;
        pars.telltime = 0 ;
    else
        sensanal = 0 ;
        plotrun = 1 ;
        pars.telltime = 1 ;
    end
    pars.runcontrol = runcontrol ;
    
    %%%%%%% starting to load params
    if sensanal == 0 
        fprintf('setting parameters... \t')
        tic
    end


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%   Flux values at present   %%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%% reductant input
    pars.k_reductant_input = 0.4e12 ;  %%%% schopf and klein 1992
    
    %%%% org C cycle
    pars.k_locb = 2.5e12 ;
    pars.k_mocb = 2.5e12 ;
    % pars.k_locb = 4.5e12 ;
    % pars.k_mocb = 4.5e12 ;
    pars.k_ocdeg = 1.25e12 ;

    %%%% carb C cycle
    pars.k_ccdeg = 12e12 ;
    pars.k_carbw = 8e12 ;
    pars.k_sfw = 1.75e12 ;
    pars.k_mccb = pars.k_carbw + pars.k_ccdeg - pars.k_sfw ;
    pars.k_silw = pars.k_mccb - pars.k_carbw ;
    pars.basfrac = 0.3 ;
    pars.k_granw = pars.k_silw * (1-pars.basfrac) ;
    pars.k_basw = pars.k_silw * pars.basfrac ;

    %%%% S cycle
    pars.k_mpsb = 0.7e12 ;
    pars.k_mgsb = 1e12 ;
    pars.k_pyrw = 7e11 ;
    pars.k_gypw = 1e12 ;
    pars.k_pyrdeg = 0 ; 
    pars.k_gypdeg = 0 ;
    
    %%%% P cycle
    pars.k_capb = 2e10 ;
    pars.k_fepb = 1e10 ;
    pars.k_mopb = 1e10 ;
    pars.k_phosw = 4.25e10 ;
    pars.k_landfrac = 0.0588 ;
    %%%% N cycle
    pars.k_nfix = 8.67e12 ;
    pars.k_denit = 4.3e12 ;

    %%%% fluxes calculated for steady state
    pars.k_oxidw = pars.k_mocb + pars.k_locb - pars.k_ocdeg - pars.k_reductant_input ;

    %%%% Sr cycle
    pars.k_Sr_sedw = 17e9 ;
    pars.k_Sr_mantle = 7.3e9 ;
    pars.k_Sr_silw = 13e9 ;
    pars.k_Sr_granw = pars.k_Sr_silw * (1 - pars.basfrac) ;
    pars.k_Sr_basw = pars.k_Sr_silw * pars.basfrac ;
    pars.total_Sr_removal = pars.k_Sr_granw + pars.k_Sr_basw + pars.k_Sr_sedw + pars.k_Sr_mantle ;
    pars.k_Sr_sfw = pars.total_Sr_removal * ( pars.k_sfw / (pars.k_sfw + pars.k_mccb) ) ;
    pars.k_Sr_sedb = pars.total_Sr_removal * ( pars.k_mccb / (pars.k_sfw + pars.k_mccb) ) ;
    pars.k_Sr_metam = 13e9 ;

    %%%% others
    pars.k_oxfrac = 0.9975 ;
    Pconc0 = 2.2 ;
    Nconc0 = 30.9 ;
    pars.newp0 = 117 * min(Nconc0/16,Pconc0) ;
    %COPSE constant for calculating pO2 from normalised O2
    pars.copsek16 = 3.762 ;
    % oxidative weathering dependency on O2 concentration
    pars.a = 0.5 ;
    % marine organic carbon burial dependency on new production
    pars.b = 2 ; 
    %%fire feedback
    pars.kfire= 3 ;

    %reservoir present day sizes (mol)
    pars.P0 = 3.1*10^15 ;
    pars.O0 = 3.7*10^19 ;
    pars.A0 = 3.193*10^18 ;
    pars.G0 = 1.25*10^21 ;
    pars.C0 = 5*10^21 ;
    pars.PYR0 = 1.8*10^20 ;
    pars.GYP0 = 2*10^20 ;
    pars.S0 = 4*10^19 ;
    pars.CAL0 = 1.397e19 ;
    pars.N0 = 4.35e16 ;
    pars.OSr0 = 1.2e17 ; %%% francois and walker 1992
    pars.SSr0 = 5e18 ;

    %%%% finished loading params
    if sensanal == 0 
        fprintf('Done: ')
        endtime = toc ;
        fprintf('time (s): %d \n', endtime )
    end


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%   Load Forcings   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%% starting to load forcings
    if sensanal == 0 
        fprintf('loading forcings... \t')
        tic
    end

     %%%% load INTERPSTACK
    load( 'forcings/INTERPSTACK_oct_2021.mat') ;
    load( 'forcings/LIPSTACK_rev3.mat') ;
    
    %%Set LIPS
    LIPS.Columbia_River = Columbia_River ;
    LIPS.Afar = Afar ;
    LIPS.NAIP = NAIP ;
    LIPS.Deccan = Deccan ;
    LIPS.Seychelles = Seychelles ;
    LIPS.Madagascar = Madagascar ;
    LIPS.Caribbean_Colombian = Caribbean_Colombian ;
    LIPS.Bunbury = Bunbury ;
    LIPS.HALIP = HALIP ;
    LIPS.Comei = Comei ;
    LIPS.EQUAMP = EQUAMP ;
    LIPS.Parana_Etendeka = Parana_Etendeka ;
    LIPS.Trap = Trap ;
    LIPS.NW_Australia_Margin = NW_Australia_Margin ;
    LIPS.Karoo = Karoo ;
    LIPS.Ferrar = Ferrar ;
    LIPS.Qiangtang = Qiangtang ;
    LIPS.CAMP = CAMP ;
    LIPS.Siberia = Siberia ;
    LIPS.Emeishan = Emeishan ;
    LIPS.Tarim = Tarim ;
    LIPS.Kola_Dnieper = Kola_Dnieper ;
    LIPS.Vilyui = Vilyui ;
    LIPS.Irkutsk = Irkutsk ;
    LIPS.Magdalen = Magdalen ;
    LIPS.Suordakh = Suordakh ;
    LIPS.Kalkarindji = Kalkarindji ;
    LIPS.Wichita = Wichita ;
    LIPS.CIMP___A = CIMP___A ;
    LIPS.CIMP___B = CIMP___B ;
    LIPS.Franklin = Franklin ;
    LIPS.Mundine_Well = Mundine_Well ;
    LIPS.Gunbarrel = Gunbarrel ;
    LIPS.SWCUC = SWCUC ;
    
       
    %{
    NAIP_sigma = 0.1+(10-0.1)*rand(1,1) ;
    petmnaip_sigma = 0.1+(10-0.1)*rand(1,1) ;
    Deccan_sigma = 0.1+(10-0.1)*rand(1,1) ;
    Seychelles_sigma = 0.1+(10-0.1)*rand(1,1) ;
Madagascar_sigma = 0.1+(10-0.1)*rand(1,1);
Caribbean_Colombian_sigma = 0.1+(10-0.1)*rand(1,1) ;
Bunbury_sigma = 0.1+(10-0.1)*rand(1,1) ;
HALIP_sigma = 0.1+(10-0.1)*rand(1,1) ;
Comei_sigma = 0.1+(10-0.1)*rand(1,1);
EQUAMP_sigma = 0.1+(10-0.1)*rand(1,1) ;
Parana_Etendeka_sigma = 0.1+(10-0.1)*rand(1,1);
NW_Australia_Margin_sigma = 0.1+(10-0.1)*rand(1,1);
Karoo_sigma = 0.1+(10-0.1)*rand(1,1) ;
Ferrar_sigma = 0.1+(10-0.1)*rand(1,1) ;
Qiangtang_sigma = 0.1+(10-0.1)*rand(1,1);
CAMP_sigma = 0.1+(10-0.1)*rand(1,1) ;
Emeishan_sigma = 0.1+(10-0.1)*rand(1,1);
Panjal_sigma = 0.1+(10-0.1)*rand(1,1);    
Tarim_sigma = 0.1+(10-0.1)*rand(1,1) ;
Kola_Dnieper_sigma = 0.1+(10-0.1)*rand(1,1) ;    
Irkutsk_sigma = 0.1+(10-0.1)*rand(1,1) ;    
Suordakh_sigma = 0.1+(10-0.1)*rand(1,1) ;    
Kalkarindji_sigma = 0.1+(10-0.1)*rand(1,1);    
Wichita_sigma = 0.1+(10-0.1)*rand(1,1) ; 
Trap_sigma = 0.1+(10-0.1)*rand(1,1);    
  %}
    %%%% relative contribution from latitude bands
    lat_areas = (cosd(INTERPSTACK.lat))' ;
    for n=1:48
        pars.rel_contrib(:,n) = lat_areas / mean(lat_areas) ;
    end

    %%%% load COPSE reloaded forcing set
    load( 'forcings/COPSE_forcings.mat' ) 
    %%%% new BA 
    forcings.GR_BA = xlsread('forcings/GR_BA.xlsx','','','basic') ;
    forcings.GR_BA(:,1) = forcings.GR_BA(:,1)*1e6 ; %%% correct Myr
    %%%% new GA
    forcings.newGA = xlsread('forcings/GA_revised.xlsx','','','basic') ;
    forcings.newGA(:,1) = forcings.newGA(:,1)*1e6 ; %%% correct Myr
    %%%% degassing rate
    load('forcings/combined_D_force_oct_2021.mat') ;
    forcings.D_force_x = D_force_x ;
    forcings.D_force_mid = D_force_mid ;
    forcings.D_force_min = D_force_min ;
    forcings.D_force_max = D_force_max ;
    
    
    %%%% load shoreline forcing
    load('forcings/shoreline.mat') ;
    forcings.shoreline_time = shoreline_time ;
    forcings.shoreline_relative = shoreline_relative ;
    
        %%%% build LIP degassing forcing - From Black et al., 2024 Nat Geos
    
    %%%% load spreadsheet of degassing rates
    forcings.LIP_degass = xlsread('forcings/Degassing_restructured_noheaders_v4.xlsx','','','basic') ;
    
    %%%% choose rows for scenairo
    % rowrange = 1:22 ; %%% volcanism only
    % rowrange = 26:47 ; %%% 5:1 I:E
    % rowrange = 51:72 ; %%% 10:1 I:E
    % rowrange = 75:81 ; %%% volcanism only + meta
    % rowrange = 84:90 ; %%% 5:1 I:E + meta
    % rowrange = 93:99 ; %%% 10:1 I:E + meta
    
    rowrange = [1:22,26:47,51:72,75:82,85:92,95:102] ; %%% ALL
    
    %%%% extract columns
    LIP_starts = forcings.LIP_degass(rowrange,1).*-1 ;
    LIP_durations = forcings.LIP_degass(rowrange,2) ;
    LIP_d13C = forcings.LIP_degass(rowrange,16) ;
    LIP_CO2_rate_low = forcings.LIP_degass(rowrange,17) ;
    LIP_CO2_rate_high = forcings.LIP_degass(rowrange,18) ;
    
    %%% set time vector
    t_geol_forcing = -600:0.001:0 ;
    
    %%%% build continuous forcings
    for n = 1 : length(rowrange)
        LIP_CO2_input_low_raw(n,:) = interp1([-600 (LIP_starts(n) - 0.001 ) LIP_starts(n) (LIP_starts(n) + LIP_durations(n) ) (LIP_starts(n) + LIP_durations(n) + 0.001 ) 0 ],[0 0 LIP_CO2_rate_low(n) LIP_CO2_rate_low(n) 0 0],t_geol_forcing) ;
        LIP_CO2_input_high_raw(n,:) = interp1([-600 (LIP_starts(n) - 0.001 ) LIP_starts(n) (LIP_starts(n) + LIP_durations(n) ) (LIP_starts(n) + LIP_durations(n) + 0.001 ) 0 ],[0 0 LIP_CO2_rate_high(n) LIP_CO2_rate_high(n) 0 0],t_geol_forcing) ;
    end
    
    %%%% take max or min of combined forcings as single forcing
    LIP_CO2_input_low_nonzero = LIP_CO2_input_low_raw ;
    LIP_CO2_input_low_nonzero(LIP_CO2_input_low_nonzero==0) = 9e99 ; %%%% set zeros to high out of range
    forcings.LIP_CO2_input_low = min(LIP_CO2_input_low_nonzero) ; %%%% take min of nonzeros
    forcings.LIP_CO2_input_low(forcings.LIP_CO2_input_low == 9e99) = 0 ; %%%% reset high out of range to zeros
    forcings.LIP_CO2_input_high = max(LIP_CO2_input_high_raw) ;
    forcings.LIP_CO2_input_mid = (forcings.LIP_CO2_input_high + forcings.LIP_CO2_input_low) ./ 2 ;
    forcings.LIP_CO2_t = t_geol_forcing ;


    %%%% load melt envelopes
    forcings.melt_envelopes = xlsread('forcings/carbon_melt_envelopes.xlsx','','','basic') ;
    
    %%%%% finished loading forcings
    if sensanal == 0 
        fprintf('Done: ')
        endtime = toc ;
        fprintf('time (s): %d \n', endtime )
    end
    
    %Create randoms for LIP degassing
    sensparams.Siberia = 0.1+(10-0.1)*rand(1,1) ; 
    sensparams.Columbia_River = 0.1+(10-0.1)*rand(1,1) ;
    sensparams.Afar = 0.1+(10-0.1)*rand(1,1) ;
    sensparams.NAIP = 0.1+(10-0.1)*rand(1,1) ;
    sensparams.petmnaip = 0.1+(10-0.1)*rand(1,1) ;
    sensparams.Deccan = 0.1+(10-0.1)*rand(1,1) ;
    sensparams.Seychelles = 0.1+(10-0.1)*rand(1,1) ;
    sensparams.Madagascar = 0.1+(10-0.1)*rand(1,1) ;
    sensparams.Caribbean_Colombian = 0.1+(10-0.1)*rand(1,1) ;
    sensparams.Bunbury = 0.1+(10-0.1)*rand(1,1) ;
    sensparams.HALIP = 0.1+(10-0.1)*rand(1,1) ;
    sensparams.Comei = 0.1+(10-0.1)*rand(1,1) ;
    sensparams.EQUAMP = 0.1+(10-0.1)*rand(1,1) ;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%   Generate sensitivity randoms   %%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if sensanal == 1
        %%%% generate random number in [-1 +1]
        sensparams.randminusplus1 = 2*(0.5 - rand) ;
        sensparams.randminusplus2 = 2*(0.5 - rand) ;
        sensparams.randminusplus3 = 2*(0.5 - rand) ;
        sensparams.randminusplus4 = 2*(0.5 - rand) ;
        sensparams.randminusplus5 = 2*(0.5 - rand) ;
        sensparams.randminusplus6 = 2*(0.5 - rand) ;
        sensparams.randminusplus7 = 2*(0.5 - rand) ;    
        sensparams.randminusplus8 = 2*(0.5 - rand) ; 
    end


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%   Initialise solver   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%% run beginning
    if sensanal == 0 
        fprintf('Beginning run: \n')
    end

    %%%% if no plot or sensitivity command set to single run
    if isempty(sensanal) == 1
        sensanal = 0 ;
    end
    if isempty(plotrun) == 1
        plotrun = 1 ;
    end

    %%%%%%% model timeframe in years (0 = present day)
    pars.whenstart = - 500e6 ;
    pars.whenend = 0 ;

    %%%% setp up grid stamp times
    if runcontrol == -2
        pars.runstamps = 0 ;
    else
        pars.runstamps = INTERPSTACK.time( INTERPSTACK.time > ( pars.whenstart * 1e-6 ) ) ;
    end
    pars.next_gridstamp = pars.runstamps(1) ;
    pars.gridstamp_number = 1 ;
    pars.finishgrid = 0 ;

    %%%%%%% Show current timestep in command window? (1 = yes, 0 = no)
    pars.telltime = 1;

    %%%%%%% set number of model steps to take before beiling out
    pars.bailnumber = 1e6;

    %%%%%%% display every n model steps whilst running
    pars.display_resolution = 200 ;

    %%%%%%% set maximum step size for solver
    options = odeset('maxstep',1e5) ;

    %%%% set stepnumber to 1
    stepnumber = 1 ;

    %%%%%%% set starting reservoir sizes 
    pars.pstart = pars.P0;
    pars.tempstart = 288;
    pars.CAL_start = pars.CAL0;
    pars.N_start = pars.N0;
    pars.OSr_start = pars.OSr0;
    pars.SSr_start = pars.SSr0;
    pars.delta_A_start = 0 ;
    pars.delta_S_start = 35 ;
    pars.delta_G_start = -27 ;
    pars.delta_C_start = -2 ;
    pars.delta_PYR_start = -5 ;
    pars.delta_GYP_start = 20 ;
    pars.delta_OSr_start = 0.708 ;
    pars.delta_SSr_start = 0.708 ;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%   Initial parameter tuning option  %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if isempty(Gtune) == 0
        pars.ostart = pars.O0 * abs( Otune )  ;
        pars.astart = pars.A0 * abs( Atune ) ;
        pars.sstart = pars.S0 * abs( Stune ) ;
        pars.gstart = pars.G0 * abs( Gtune ) ;
        pars.cstart = pars.C0 * abs( Ctune ) ;
        pars.pyrstart = pars.PYR0 * abs( PYRtune ) ;
        pars.gypstart = pars.GYP0 * abs( GYPtune ) ; 
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%% if no tuning use previously tuned values
    if isempty(Gtune) == 1

        outputs = [ 0.55 1 1.2 1 0.1 0.05 3 ] ;
        
        pars.gstart = pars.G0 * outputs(1) ;
        pars.cstart = pars.C0 * outputs(2) ;
        pars.pyrstart = pars.PYR0 * outputs(3) ;
        pars.gypstart = pars.GYP0 * outputs(4) ; 
        pars.ostart = pars.O0 * outputs(5)  ;
        pars.sstart = pars.S0 * outputs(6) ;
        pars.astart = pars.A0 * outputs(7) ;

    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    %%%% model start state
    pars.startstate(1) = pars.pstart ;
    pars.startstate(2) = pars.ostart ;
    pars.startstate(3) = pars.astart ;
    pars.startstate(4) = pars.sstart ;
    pars.startstate(5) = pars.gstart ;
    pars.startstate(6) = pars.cstart ;
    pars.startstate(7) = pars.pyrstart ;
    pars.startstate(8) = pars.gypstart ;
    pars.startstate(9) = pars.tempstart ;
    pars.startstate(10) = pars.CAL_start ;
    pars.startstate(11) = pars.N_start ;
    pars.startstate(12) = pars.gstart * pars.delta_G_start ;
    pars.startstate(13) = pars.cstart * pars.delta_C_start ;
    pars.startstate(14) = pars.pyrstart * pars.delta_PYR_start ;
    pars.startstate(15) = pars.gypstart * pars.delta_GYP_start ;
    pars.startstate(16) = pars.astart * pars.delta_A_start ;
    pars.startstate(17) = pars.sstart * pars.delta_S_start ;
    pars.startstate(18) = pars.OSr_start ;
    pars.startstate(19) = pars.OSr_start * pars.delta_OSr_start ;
    pars.startstate(20) = pars.SSr_start ;
    pars.startstate(21) = pars.SSr_start * pars.delta_SSr_start ;

    %%%% note model start time
    tic

    %%%%%%% run the system 
    [rawoutput.T,rawoutput.Y] = ode15s(@SCION_equations_Mesozoic_LIPs_cryptic,[pars.whenstart pars.whenend],pars.startstate,options);



    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%   Postprocessing   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%% size of output 
    pars.output_length = length(rawoutput.T) ;
        
    if sensanal == 0
        %%%%%%%%%% model finished output to screen
        fprintf('Integration finished \t') ; fprintf('Total steps: %d \t' , stepnumber ) ; fprintf('Output steps: %d \n' , pars.output_length ) 
        toc
    end

    %%%%%%%%% print final model states using final state for each timepoint
    %%%%%%%%% during integration
    
    if sensanal == 0
    fprintf('assembling state vectors... \t')
    tic
    end

    %%%% trecords is index of shared values between ode15s output T vector and
    %%%% model recorded workingstate t vector
    [sharedvals,trecords] = intersect(workingstate.time,rawoutput.T,'stable') ;

    %%%%%% assemble output state vectors
    field_names = fieldnames(workingstate) ;
    for numfields = 1:length(field_names)
        eval([' state.' char( field_names(numfields) ) ' = workingstate.' char( field_names(numfields) ) '(trecords) ; '])
    end

    %%%%%% save state
    run.state = state ;
    run.gridstate = gridstate ;
    run.pars = pars ;
    run.sensparams = sensparams ;
    run.forcings = forcings ;
    
    if sensanal == 0
        %%%%%% done message
        fprintf('Done: ')
        endtime = toc ;
        fprintf('time (s): %d \n', endtime )
    end


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%   Plotting   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%% only plot if no tuning structure exists, only plot fluxes for quick runs
    if isempty(Gtune) == 1
        if plotrun == 1            
            if runcontrol>-1
                SCION_plot_worldgraphic
            end
            SCION_plot_fluxes
        end
    end


    
end
