% fig_R2_mode_comparison  Table 11: total delivery time and cost of the three delivery modes.
D = rp_data(); S = rp_style(); M = D.modes;
fig = figure('Units','centimeters','Position',[2 2 18 7.5],'Color','w');
tl = tiledlayout(fig,1,2,'TileSpacing','compact','Padding','compact');
cols = [S.truck; S.RT; S.TR];
lab = categorical({'Truck-only','Round-trip','Traversal'},{'Truck-only','Round-trip','Traversal'});

ax = nexttile(tl);
b = bar(ax, lab, M.total_time, 'FaceColor','flat','EdgeColor','none'); b.CData = cols;
text(ax, 1:3, M.total_time, compose('%.2f',M.total_time), 'HorizontalAlignment','center','VerticalAlignment','bottom');
ylabel(ax,'Total delivery time (min)'); ylim(ax,[0 115]); title(ax,'(a) Delivery time','FontWeight','normal');
grid(ax,'on'); box(ax,'off');

ax = nexttile(tl);
b = bar(ax, lab, M.total_cost, 'FaceColor','flat','EdgeColor','none'); b.CData = cols;
text(ax, 1:3, M.total_cost, compose('%.2f',M.total_cost), 'HorizontalAlignment','center','VerticalAlignment','bottom');
ylabel(ax,'Total delivery cost (USD)'); ylim(ax,[0 80]); title(ax,'(b) Delivery cost','FontWeight','normal');
grid(ax,'on'); box(ax,'off');
set(findall(fig,'Type','axes'),'FontSize',S.fs);

T = table(M.names', M.veh_time(:,1), M.veh_time(:,2), M.veh_time(:,3), M.total_time', M.total_cost', M.drone_pts', ...
    'VariableNames',{'Mode','Truck1_min','Truck2_min','Truck3_min','Total_time_min','Total_cost_USD','Drone_points'});
rp_export(fig,'R2_mode_comparison',T);
