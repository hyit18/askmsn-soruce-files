function S = rp_style()
%RP_STYLE  Shared colours, fonts and output folders (one fixed colour per configuration).
S.font   = 'Times New Roman';
S.fs     = 11;
S.GA     = [0.55 0.55 0.55];   % standard GA
S.IGA    = [0.12 0.31 0.47];   % DPA-IGA
S.truck  = [0.43 0.43 0.43];   % truck-only
S.RT     = [0.42 0.24 0.60];   % round-trip collaborative
S.TR     = [0.88 0.48 0.12];   % traversal collaborative
S.cat    = [0.07 0.11 0.25; 0.76 0.13 0.15; 0.11 0.49 0.25; 0.93 0.47 0.07]; % depot, O1, O2, O3
S.root   = fileparts(mfilename('fullpath'));
S.figdir = fullfile(S.root,'output','figures');
S.csvdir = fullfile(S.root,'output','plotdata');
S.dpi    = 800;
if ~exist(S.figdir,'dir'), mkdir(S.figdir); end
if ~exist(S.csvdir,'dir'), mkdir(S.csvdir); end
end
