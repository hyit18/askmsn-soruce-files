function R = stats_wilcoxon_effectsize(a, b, nboot, seed)
%STATS_WILCOXON_EFFECTSIZE  Toolbox-free paired Wilcoxon signed-rank test, matched-pairs
%rank-biserial correlation and percentile-bootstrap 95% CI of the mean percentage improvement.
%
%   R = stats_wilcoxon_effectsize(a, b) compares paired samples a (baseline, e.g. GA)
%   and b (DPA-IGA), where lower values are better. Intended for the per-run results
%   (30 runs per dataset) held by the authors; these per-run data are NOT in the manuscript.
%
%   Exact p-value (two-sided) for n <= 25 non-zero differences, normal approximation
%   with tie correction otherwise.
if nargin < 3, nboot = 2000; end
if nargin < 4, seed = 1; end
a = a(:); b = b(:); d = a - b; d = d(d ~= 0); n = numel(d);
[~,~,r] = unique(abs(d)); rk = tiedrank_(abs(d));
Wp = sum(rk(d > 0)); Wm = sum(rk(d < 0)); S = n*(n+1)/2;
R.n = n; R.Wplus = Wp; R.Wminus = Wm;
R.rank_biserial = (Wp - Wm) / S;                       % Kerby (2014) matched-pairs r
if n <= 25 && all(rk == round(rk))
    % exact null distribution of W+ by dynamic programming
    cnt = zeros(1, S+1); cnt(1) = 1;
    for k = 1:n, cnt = cnt + [zeros(1,rk(k)) cnt(1:end-rk(k))]; end
    pdf = cnt / 2^n; cdf = cumsum(pdf);
    lo = min(Wp, Wm);
    R.p = min(1, 2*cdf(lo+1)); R.method = 'exact';
else
    t = accumarray(r, 1); sig = sqrt(n*(n+1)*(2*n+1)/24 - sum(t.^3 - t)/48);
    z = (Wp - S/2 - sign(Wp - S/2)*0.5) / sig;
    R.p = erfc(abs(z)/sqrt(2)); R.method = 'normal';
end
imp = 100*(a - b)./a; R.mean_improvement = mean(imp);
rs = RandStream('mt19937ar','Seed',seed); m = numel(imp);
bm = zeros(nboot,1);
for k = 1:nboot, bm(k) = mean(imp(randi(rs, m, m, 1))); end
bm = sort(bm); R.ci95 = [bm(max(1,floor(0.025*nboot))) bm(ceil(0.975*nboot))];
end

function rk = tiedrank_(x)
[xs, i] = sort(x(:)); rk = zeros(size(xs)); k = 1; n = numel(xs);
while k <= n
    j = k; while j < n && xs(j+1) == xs(k), j = j + 1; end
    rk(i(k:j)) = (k + j) / 2; k = j + 1;
end
end
