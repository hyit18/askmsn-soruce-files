% fig_R4_sensitivity  Figures 16-18: drone speed, maximum flight time and payload.
D = rp_data(); S = rp_style();
tags = {'R4a_sens_speed','R4b_sens_flight_time','R4c_sens_payload'};
for k = 1:3
    s = D.sens(k);
    fig = figure('Units','centimeters','Position',[2 2 14 9],'Color','w');
    ax = axes(fig); hold(ax,'on');
    xl = categorical(compose(['%g ' s.unit], s.x), compose(['%g ' s.unit], s.x));
    yyaxis(ax,'left');
    b = bar(ax, xl, [s.RT_time; s.TR_time]', 'grouped', 'EdgeColor','none');
    b(1).FaceColor = S.RT; b(2).FaceColor = S.TR;
    xt = b(1).XEndPoints; xt2 = b(2).XEndPoints;
    text(ax, xt,  s.RT_time, compose('%.2f',s.RT_time), 'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',8);
    text(ax, xt2, s.TR_time, compose('%.2f',s.TR_time), 'HorizontalAlignment','center','VerticalAlignment','bottom','FontSize',8);
    ylabel(ax,'Total delivery time (min)'); ylim(ax,[0 105]); ax.YColor = [0 0 0];
    yyaxis(ax,'right');
    plot(ax, xl, s.RT_pts, '--o', 'Color', S.RT, 'LineWidth', 1.4, 'MarkerFaceColor','w');
    plot(ax, xl, s.TR_pts, '-o',  'Color', [0.11 0.49 0.25], 'LineWidth', 1.4, 'MarkerFaceColor','w');
    ylabel(ax,'Demand points served by drone'); ylim(ax,[0 25]); ax.YColor = [0 0 0];
    xlabel(ax, sprintf('%s (%s)', s.name, s.unit));
    legend(ax,{'Round-trip delivery time','Traversal delivery time','Round-trip drone points','Traversal drone points'}, ...
        'Location','northoutside','NumColumns',2,'Box','off');
    grid(ax,'on'); box(ax,'off'); ax.FontSize = S.fs;
    T = table(s.x', s.RT_time', s.TR_time', s.RT_pts', s.TR_pts', 'VariableNames', ...
        {matlab.lang.makeValidName(s.unit), 'RoundTrip_time_min','Traversal_time_min','RoundTrip_drone_pts','Traversal_drone_pts'});
    rp_export(fig, tags{k}, T);
end
