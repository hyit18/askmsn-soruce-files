function rp_export(fig, name, T)
%RP_EXPORT  Save figure as PNG (800 dpi), vector PDF and .fig, and the plotted data as CSV.
S = rp_style();
set(findall(fig,'-property','FontName'),'FontName',S.font);
exportgraphics(fig, fullfile(S.figdir,[name '.png']), 'Resolution', S.dpi);
exportgraphics(fig, fullfile(S.figdir,[name '.pdf']), 'ContentType', 'vector');
savefig(fig, fullfile(S.figdir,[name '.fig']));
if nargin > 2 && ~isempty(T)
    writetable(T, fullfile(S.csvdir,[name '.csv']));
end
close(fig);
fprintf('  saved %s\n', name);
end
