% fig_R3_pareto  Table 10: Pareto solutions (traversal mode) and equal-weight compromise scores.
D = rp_data(); S = rp_style(); P = D.pareto;
n1 = (P.Z1 - min(P.Z1)) / (max(P.Z1) - min(P.Z1));     % ideal/nadir normalisation, Section 8.3
n2 = (P.Z2 - min(P.Z2)) / (max(P.Z2) - min(P.Z2));
score = 0.5*n1 + 0.5*n2;

fig = figure('Units','centimeters','Position',[2 2 18 7.5],'Color','w');
tl = tiledlayout(fig,1,2,'TileSpacing','compact','Padding','compact');
ax = nexttile(tl); hold(ax,'on');
plot(ax, P.Z1, P.Z2, '--', 'Color', [0.5 0.5 0.5]);
scatter(ax, P.Z1, P.Z2, 55, S.IGA, 'filled');
scatter(ax, P.Z1(P.selected), P.Z2(P.selected), 90, S.TR, 'filled', 'MarkerEdgeColor','k');
text(ax, P.Z1+0.25, P.Z2+0.6, compose('S%d',1:5));
xlabel(ax,'Z_1 total delivery time (min)'); ylabel(ax,'Z_2 total delivery cost (USD)');
title(ax,'(a) Pareto solutions (Table 10)','FontWeight','normal'); grid(ax,'on'); box(ax,'off');

ax = nexttile(tl);
b = bar(ax, categorical(compose('S%d',1:5)), score, 'FaceColor','flat','EdgeColor','none');
b.CData = repmat(S.IGA,5,1); b.CData(P.selected,:) = S.TR;
text(ax, 1:5, score, compose('%.3f',score), 'HorizontalAlignment','center','VerticalAlignment','bottom');
ylabel(ax,'Composite score (lower is better)'); ylim(ax,[0 0.6]);
title(ax,'(b) Equal-weight compromise score','FontWeight','normal'); grid(ax,'on'); box(ax,'off');
set(findall(fig,'Type','axes'),'FontSize',S.fs);

T = table((1:5)', P.Z1', P.Z2', n1', n2', score', 'VariableNames', ...
    {'Solution','Z1_time_min','Z2_cost_USD','Z1_norm','Z2_norm','Composite_score'});
rp_export(fig,'R3_pareto_compromise',T);
