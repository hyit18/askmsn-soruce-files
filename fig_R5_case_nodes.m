% fig_R5_case_nodes  Table 9: case-study demand nodes by service category (scaled coordinates).
D = rp_data(); S = rp_style(); N = D.case.nodes;
fig = figure('Units','centimeters','Position',[2 2 16 10],'Color','w');
ax = axes(fig); hold(ax,'on');
lbl = {'Distribution center','O_1 truck-only','O_2 drone-only','O_3 truck or drone'};
h = gobjects(1,4);
for c = 0:3
    m = N(:,5) == c;
    h(c+1) = scatter(ax, N(m,2), N(m,3), 40 + 6*N(m,4), S.cat(c+1,:), 'filled', 'MarkerEdgeColor','w');
end
text(ax, N(:,2)+0.0012, N(:,3)+0.0012, string(N(:,1)), 'FontSize', 8);
xlabel(ax,'Longitude (scaled, °E)'); ylabel(ax,'Latitude (scaled, °N)');
legend(ax, h, lbl, 'Location','southeast'); grid(ax,'on'); box(ax,'on'); ax.FontSize = S.fs;
T = table(N(:,1), D.case.names', N(:,2), N(:,3), N(:,4), N(:,5), 'VariableNames', ...
    {'ID','Name','Lon','Lat','Demand','Category'});
rp_export(fig,'R5_case_nodes',T);
