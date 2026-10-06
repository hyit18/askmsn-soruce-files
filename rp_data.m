function D = rp_data()
%RP_DATA  All numerical results exactly as reported in the manuscript
%   "Truck-Drone Cooperative Routing for Post-Disaster Emergency Medical
%   Supply Distribution Under Road Uncertainty" (Scientific Reports, R2).
%
%   No value here is generated or estimated: every number is transcribed from
%   a table, the text, or a data label printed on a figure of the manuscript.
%   The source of each block is given in the comments.

%% Table 8 - standard GA vs DPA-IGA on nine Solomon-derived benchmarks
D.bench.names = {'R108-10','C108-10','RC108-10','R108-20','C108-20','RC108-20','R108-50','C108-50','RC108-50'};
D.bench.n     = [10 10 10 20 20 20 50 50 50];
D.bench.GA_drone_pts  = [4 4 4 7 7 7 17 17 18];
D.bench.IGA_drone_pts = [4 4 4 8 8 6 17 17 18];
D.bench.GA_time   = [7.46 5.17 4.65 9.58 5.19 6.10 13.87 14.64 14.94];           % s
D.bench.GA_del    = [76.56 74.06 84.05 96.17 94.99 92.56 239.11 244.15 244.15];   % min
D.bench.IGA_time  = [4.40 4.97 4.03 5.58 6.52 8.52 11.17 11.29 12.12];            % s
D.bench.IGA_del   = [74.76 69.35 76.26 94.44 85.22 85.22 231.10 230.05 238.09];   % min
D.bench.rep_time_red = [14.21 3.87 13.33 17.46 5.82 7.56 19.89 22.74 19.59];      % % (as printed)
D.bench.rep_del_red  = [3.35 6.31 9.53 2.51 10.35 7.94 3.37 5.78 2.48];           % % (as printed)
D.bench.rep_avg = struct('GA_time',8.83,'GA_del',136.55,'IGA_time',6.99,'IGA_del',126.77, ...
                         'time_red',17.55,'del_red',6.49);

%% Section 7.3 text - summary of the other baselines (no per-dataset table in the paper)
D.baseline = struct('ACO_del_red',9.21,'ACO_conv_red',14.33,'FSTSP_del_red',18.74, ...
                    'ASAR_sd_red',38,'DTAC_infeasible_red',73);

%% Section 7.2 text - R108-10 illustrative run
D.r108 = struct('GA_time',17.77,'GA_del',77.90,'IGA_time',5.53,'IGA_del',74.65, ...
                'rep_time_red',68.9,'rep_del_red',4.17);

%% Table 7 - R108-10 nodes (ID, X, Y, demand, category 0=depot 1=O1 2=O2 3=O3)
D.r108.nodes = [0 35 20 0 0; 1 41 49 10 3; 2 35 17 7 3; 3 55 45 13 1; 4 55 20 19 3; 5 15 30 26 3;
                6 25 30 3 3; 7 20 50 5 3; 8 10 43 9 3; 9 55 60 12 2; 10 30 60 15 3];

%% Table 9 - case-study nodes (ID, lon, lat, demand, category)
D.case.names = {'Distribution Center','Kotli Sattian','Rawalakot','Pallandri','Azad Pattan Gul','Bhurban', ...
    'Kohala','DhiKot','Baloch','Bagh','Sudhan Galli','Abbaspur','Mandhar','Mandhole','Nambla','Chaktroo', ...
    'Farwad Rahuta','Hajira','Chakothi','Nar Sher Ali Khan','Sailani','Haveli Azad Kashmir'};
D.case.nodes = [ ...
 0 105.3432 29.3973  0 0;  1 105.3413 29.3963 11 3;  2 105.3485 29.3986 13 3;  3 105.3464 29.3895  8 3;
 4 105.3330 29.3725  5 3;  5 105.3306 29.3853 10 3;  6 105.3307 29.3942  2 3;  7 105.3272 29.4062  4 3;
 8 105.3400 29.3966  6 3;  9 105.3504 29.4065 15 1; 10 105.3634 29.3857  9 3; 11 105.3773 29.3826 12 2;
12 105.3405 29.3700  7 3; 13 105.3847 29.3997  7 2; 14 105.3748 29.4278  9 3; 15 105.3905 29.4175 11 3;
16 105.3965 29.4241  7 3; 17 105.3679 29.3932  4 3; 18 105.3585 29.4019  9 3; 19 105.3675 29.4164 12 2;
20 105.4034 29.4150 17 3; 21 105.3759 29.4120  2 3];

%% Table 10 - Pareto solutions of the improved NSGA-II (traversal mode)
D.pareto.Z1 = [59.51 59.89 62.80 64.47 67.38];      % min
D.pareto.Z2 = [469.09 459.63 457.71 452.25 450.16]; % USD
D.pareto.selected = 3;                               % as stated in Section 8.3

%% Table 11 - delivery-mode comparison (case study)
D.modes.names      = {'Truck-only','Round-trip collaborative','Traversal collaborative'};
D.modes.veh_time   = [99.24 98.84 83.20; 69.95 69.09 71.47; 56.66 23.69 62.80]; % min, trucks 1-3
D.modes.total_time = [99.24 71.47 62.80];  % min
D.modes.total_cost = [71.03 65.79 64.08];  % USD
D.modes.drone_pts  = [0 10 14];            % Sections 8.2-8.3 text
D.modes.rep = struct('rt_vs_truck_time',27.98,'tr_vs_truck_time',36.72,'tr_vs_rt_time',12.12, ...
                     'rt_vs_truck_cost',7.36,'tr_vs_truck_cost',9.78,'tr_vs_rt_cost',2.60);

%% Figures 16-18 - sensitivity analysis (values read from the data labels printed on the figures)
D.sens(1) = struct('name','Drone flight speed','unit','km/h','x',[25 35 50 60], ...
    'RT_time',[85.6 81.48 76.7 71.5],'TR_time',[70.89 69.5 61.8 62.3],'RT_pts',[6 6 7 9],'TR_pts',[9 10 13 13],'base',50);
D.sens(2) = struct('name','Maximum drone flight time','unit','min','x',[15 20 30 35], ...
    'RT_time',[75.17 72.28 71.48 74.68],'TR_time',[81.19 72.1 62.9 61.57],'RT_pts',[9 10 11 11],'TR_pts',[10 11 13 13],'base',30);
D.sens(3) = struct('name','Maximum drone payload','unit','kg','x',[5 10 15 20], ...
    'RT_time',[89.3 78.53 71.48 69.5],'TR_time',[83.49 76.42 62.9 59.88],'RT_pts',[5 9 11 11],'TR_pts',[9 12 15 16],'base',10);
D.sens_rep_payload_increase = 43.75;   % % stated in Section 9.3 (9 -> 16 points)

%% Table 6 - model parameters
D.param = struct('v_truck',40,'v_drone',50,'s_truck',5,'s_drone',3,'SL',1,'SR',1,'LT',500,'LD',10, ...
                 'Tmax',30,'P',100,'maxgen',200,'Pc',0.8,'Pm',0.1,'T0',100,'lambda0',0.95,'bigM',1000);
end
