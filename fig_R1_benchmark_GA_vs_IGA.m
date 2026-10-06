% fig_R1_benchmark_GA_vs_IGA  Table 8: runtime and delivery time, standard GA vs DPA-IGA.
D = rp_data(); S = rp_style(); B = D.bench;
fig = figure('Units','centimeters','Position',[2 2 18 7.5],'Color','w');
tl = tiledlayout(fig,1,2,'TileSpacing','compact','Padding','compact');

ax = nexttile(tl);
b = bar(ax, categorical(B.names,B.names), [B.GA_time; B.IGA_time]', 'grouped', 'EdgeColor','none');
b(1).FaceColor = S.GA; b(2).FaceColor = S.IGA;
ylabel(ax,'Average runtime (s)'); title(ax,'(a) Runtime','FontWeight','normal');
legend(ax,{'Standard GA','DPA-IGA'},'Location','northwest','Box','off'); grid(ax,'on'); box(ax,'off');

ax = nexttile(tl);
b = bar(ax, categorical(B.names,B.names), [B.GA_del; B.IGA_del]', 'grouped', 'EdgeColor','none');
b(1).FaceColor = S.GA; b(2).FaceColor = S.IGA;
ylabel(ax,'Total delivery time (min)'); title(ax,'(b) Delivery time','FontWeight','normal');
legend(ax,{'Standard GA','DPA-IGA'},'Location','northwest','Box','off'); grid(ax,'on'); box(ax,'off');
set(findall(fig,'Type','axes'),'FontSize',S.fs);

T = table(B.names', B.n', B.GA_time', B.IGA_time', B.GA_del', B.IGA_del', ...
    'VariableNames',{'Dataset','DemandPoints','GA_time_s','IGA_time_s','GA_delivery_min','IGA_delivery_min'});
rp_export(fig,'R1_benchmark_GA_vs_IGA',T);
