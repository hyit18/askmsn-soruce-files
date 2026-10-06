% run_all  Rebuild every result figure, plot-data CSV and the consistency report.
%   Run time: < 1 min (plotting only; no optimisation is re-run).
%   Requires base MATLAB R2020a or newer (exportgraphics); no toolboxes.
here = fileparts(mfilename('fullpath')); addpath(here); cd(here);
maxNumCompThreads(2);
fig_R1_benchmark_GA_vs_IGA
fig_R2_mode_comparison
fig_R3_pareto
fig_R4_sensitivity
fig_R5_case_nodes
check_consistency

% Diagnostic only (not reported in the manuscript): dataset-level test on the nine
% Table 8 rows. The Methods-level analysis would use the 30 per-run results per dataset.
D = rp_data(); S = rp_style();
Rt = stats_wilcoxon_effectsize(D.bench.GA_time, D.bench.IGA_time);
Rd = stats_wilcoxon_effectsize(D.bench.GA_del,  D.bench.IGA_del);
T = table({'Runtime';'Delivery time'}, [Rt.n;Rd.n], [Rt.Wplus;Rd.Wplus], [Rt.p;Rd.p], ...
    [Rt.rank_biserial;Rd.rank_biserial], [Rt.mean_improvement;Rd.mean_improvement], ...
    [Rt.ci95(1);Rd.ci95(1)], [Rt.ci95(2);Rd.ci95(2)], 'VariableNames', ...
    {'Metric','n_datasets','W_plus','p_exact','rank_biserial','mean_improvement_pct','CI95_low','CI95_high'});
writetable(T, fullfile(S.csvdir,'diagnostic_dataset_level_stats.csv'));
disp(T)
disp('All outputs written to output/figures and output/plotdata.');
